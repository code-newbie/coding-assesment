import Foundation
import Moya
import Alamofire
import JWTDecode
import Common
import Domains

struct StubResponse {
    let responseCode: Int
    let responseData: Data
}
enum NetworkCounter: Int {
    case validity = 60
}
//swiftlint:disable function_body_length
public struct NetworkService {
    
    public static var instance = NetworkService(stubResponse: nil)
    fileprivate let provider: MoyaProvider<MultiTarget>
    public weak var delegate: NetworkServiceWireframe?
    var settingContext = SettingContext.shared
    // Passing StubResponse for Unit Testing's purpose only
    init(stubResponse: StubResponse?) {
        if let stub = stubResponse {
            let errorEndpoint = {(target: MultiTarget) -> Endpoint in
                var data: Data!
                if (200...500).contains(stub.responseCode) {
                    data = stub.responseData
                } else {
                    data = target.sampleData
                }
                return Endpoint(url: URL(target: target).absoluteString,
                                sampleResponseClosure: { .networkResponse(stub.responseCode, data ) },
                                method: target.method,
                                task: target.task,
                                httpHeaderFields: target.headers)
            }
            self.provider = MoyaProvider<MultiTarget>(endpointClosure: errorEndpoint, stubClosure: MoyaProvider.immediatelyStub)
        } else {
            var trustManagerEvaluators = [String : ServerTrustEvaluating]()
            let environment = AppContext.instance.infoForKey(ConfigKeys.appEnv.rawValue)
            let appEnvironment = AppEnvironment(rawValue: environment)
            let baseUrlHost = URL(string: AppContext.instance.infoForKey(ConfigKeys.baseUrl.rawValue, defaultValue: ""))?.host
            let enableUntrust = AppContext.instance.infoForKey(ConfigKeys.isEnableUntrustBaseUrl.rawValue)
            
            if let appEnvironment = appEnvironment, appEnvironment == .uat, let baseUrlHost = baseUrlHost {
                if let isEnableUntrust = enableUntrust.boolYN(), isEnableUntrust {
                    trustManagerEvaluators[baseUrlHost] = DisabledEvaluator()
                } else {
                    // Do implementing SSL Pinning
                }
            }
            let manager = Session(
                configuration: URLSessionConfiguration.default,
                serverTrustManager: ServerTrustManager(evaluators: trustManagerEvaluators)
            )
            // Front End will have counter for access token validity.
            // If access token is going to expire in 60 second
            // Front End will call refresh API then continue call back end API.
            self.provider = MoyaProvider<MultiTarget>(
                requestClosure: { (endpoint, closure) in
                    guard var request = try? endpoint.urlRequest() else { return }
                    request.httpShouldHandleCookies = false
                    request.timeoutInterval = 90.0
                    do {
                       debugLog("")
                    } catch {
                        closure(.failure(MoyaError.statusCode(Response(statusCode: HTTPStatusCode.unauthorized.rawValue,
                                                                       data: Data()))))
                    }
            }, session: manager)
        }
    }
}

// MARK: - Extension NetworkService
/**
 - parameters:
 - T: TargetType
 - C: Codable
 */
extension NetworkService {
    public func requestObject<T: TargetType, C: Decodable>(_ target: T, c classType: C.Type, completion: @escaping (Result<C, NetworkError>) -> Void) {
        provider.request(MultiTarget(target)) { (result) in
            switch result {
            case .success(let value):
                do {
                    let filteredResponse = try value.filterSuccessfulStatusCodes()
                    let result = try filteredResponse.map(C.self)
                    completion(.success(result))
                } catch is DecodingError {
                    completion(.failure(NetworkError.incorrectDataReturned))
                } catch MoyaError.statusCode(let response) {
                    if response.statusCode == HTTPStatusCode.serviceUnavailable.rawValue {
                        completion(.failure(NetworkError.serviceUnavailable))
                    } else {
                        do {
                            let result = try value.map(ErrorResponse.self)
                            if result.code == ErrorResponseCode.serviceOff.rawValue {
                                self.delegate?.showServiceOff()
                                completion(.failure(NetworkError.softError(error: ErrorResponse.serviceOff())))
                            } else if result.code == ErrorResponseCode.downtimeUnscheduleError.rawValue {
                                self.delegate?.showGenericDowntime(errorResponse: result)
                                self.provider.session.cancelAllRequests()
                            } else if result.code == ErrorResponseCode.downtimeScheduleError.rawValue {
                                self.delegate?.showGenericDowntime(errorResponse: result)
                                self.provider.session.cancelAllRequests()
                            } else {
                                completion(.failure(NetworkError.softError(error: result)))
                            }
                        } catch {
                            completion(.failure(NetworkError.incorrectDataReturned))
                        }
                    }
                } catch {
                    if (try? value.map(EmptyResponse.self)) != nil {
                        completion(.failure(NetworkError.emptyResponse))
                    } else {
                        completion(.failure(NetworkError.unknown))
                    }
                }
                debugLog("Url:", value.request?.url?.absoluteString ?? "nil")
                debugLog("Status code:", value.response?.statusCode ?? "nil")
            case .failure(let error):
                switch error {
                case .underlying(let error, _):
                    completion(.failure(NetworkError(error: error as NSError)))
                default:
                    do {
                        let result = try error.response?.map(ErrorResponse.self)
                        completion(.failure(NetworkError.softError(error: result)))
                    } catch {
                        completion(.failure(NetworkError.incorrectDataReturned))
                    }
                }
            }
        }
    }
}


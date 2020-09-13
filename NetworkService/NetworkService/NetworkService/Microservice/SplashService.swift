//
//  SplashService.swift
//  NetworkService
//
//  Created by Ilhammalik on 05/09/20.
//

import Foundation
import Moya
import Common

public enum SplashService {
    case downtime
    case mobileVersion
    case languagePack(languagePackId: String)
}

extension SplashService: TargetType {
    public var baseURL: URL {
        let baseurl = AppContext.instance.infoForKey(ConfigKeys.baseUrl.rawValue, defaultValue: "http://0.0.0.0:3004")
        let basePath = AppContext.instance.infoForKey(ConfigKeys.basePath.rawValue, defaultValue: "project/dev2/")
        let url = baseurl + basePath
        return URL(string: url)!
    }
    
    public var path: String {
        switch self {
        case .downtime:
            return MicroservicePaths.system + "downtime"
        case .mobileVersion:
            return MicroservicePaths.system + "mobile-app-version"
        case .languagePack:
            return MicroservicePaths.localization + "language-pack"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .languagePack(let languagePackId):
            return .requestParameters(parameters: [
                "languagePackVersionUuid": languagePackId
            ], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }
    
    public var parameters: [String: Any] {
        switch self {
//        case .customer(let userId):
//            let body = [
//                "userId" : userId
//            ]
//            return body
        default:
            return [:]
        }
    }
    
    public var headers: [String : String]? {
        return HTTPHeaderField.getCommonHeader()
    }
}

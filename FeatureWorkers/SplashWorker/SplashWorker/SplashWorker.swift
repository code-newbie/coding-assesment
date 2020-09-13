//
//  SplashWorker.swift
//  SplashWorker
//
//  Created by Ilhammalik on 01/09/20.
//

import Foundation
import UIKit
import NetworkService
import Domains
import Common

public protocol SplashWorkerProtocol {
    func getDowntimeStatus()
}

public class SplashWorker: SplashWorkerProtocol {
    private var networkService: NetworkService
    public init(networkService: NetworkService = NetworkService.instance) {
        self.networkService = networkService
    }
    
    public func getDowntimeStatus() {
        
        networkService
            .requestObject(SplashService.downtime,
                           c: EmptyResponse.self) { (result) in
//                            switch result {
//                            case .success:
//                                self.downtimeDelegate?.didCheckDowntime(with: nil)
//                            case .failure(let error):
//                                switch error {
//                                case .softError(let errorResponse):
//                                    self.downtimeDelegate?.didCheckDowntime(with: errorResponse)
//                                case .serviceUnavailable:
//                                    self.downtimeDelegate?.didCheckDowntime(with: .serverConnectionError())
//                                default:
//                                    self.downtimeDelegate?.didCheckDowntime(with: .genericError())
//                                }
//                            }
        }
    }
}

// 
//  SplashMainInteractor.swift
//  Splash
//
//  Created by Ilhammalik on 01/09/20.
//

import Foundation
import Domains
import SplashWorker
class SplashMainInteractor: SplashMainPresenterToInteractor {
    weak var presenter: SplashMainInteractorToPresenter?
//    var worker: SplashWorkerProtocol
//
//    init(with worker: SplashWorkerProtocol) {
//        self.worker = worker
//    }
//
    func checkServerDowntime() {
       // worker.getDowntimeStatus()
    }
}

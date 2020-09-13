//
//  SplashMainPresenter.swift
//  Splash
//
//  Created by Ilhammalik on 01/09/20.
//

import Foundation

class SplashMainPresenter: SplashMainViewToPresenter {
    var view: SplashMainPresenterToView?
    var interactor: SplashMainPresenterToInteractor?
    var router: SplashMainPresenterToRouter?
    
    func viewDidLoad() {
        guard let view = view else { return }
        router?.navigateToVending(view)
    }
    
}

extension SplashMainPresenter: SplashMainInteractorToPresenter {
    
}

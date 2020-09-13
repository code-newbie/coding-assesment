// 
//  SplashMainProtocols.swift
//  Splash
//
//  Created by Ilhammalik on 01/09/20.
//

import UIKit


//MARK: View -
protocol SplashMainPresenterToView: class {
    var presenter: SplashMainViewToPresenter? { get set }
    /**
     * Stubs for communication PRESENTER -> VIEW
     */
}

//MARK: Interactor -
protocol SplashMainPresenterToInteractor: class {
    var presenter: SplashMainInteractorToPresenter?  { get set }
    
    /**
     * Stubs for communication PRESENTER -> INTERACTOR
     */
    func checkServerDowntime()
}


//MARK: Router -
protocol SplashMainPresenterToRouter: class {
    func navigateToVending(_ from: SplashMainPresenterToView)
    /**
     * Stubs for communication PRESENTER -> ROUTER
     */
}

//MARK: Presenter -
protocol SplashMainViewToPresenter: class {
    var view: SplashMainPresenterToView? {get set}
    var interactor: SplashMainPresenterToInteractor? {get set}
    var router: SplashMainPresenterToRouter? {get set}
    
    /**
     * Stubs for communication VIEW -> PRESENTER
     */
    func viewDidLoad()
}

protocol SplashMainInteractorToPresenter: class {
    
    /**
     * Stubs for communication INTERACTOR -> PRESENTER
     */
}

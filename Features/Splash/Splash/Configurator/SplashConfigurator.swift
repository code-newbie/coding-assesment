//
//  SplashConfigurator.swift
//  Splash
//
//  Created by Ilhammalik on 01/09/20.
//

import UIKit
import SplashWorker

public class SplashConfigurator {
    public static var shared = SplashConfigurator()
    public weak var delegate: SplashWireframe?
    
    public func createSplashMainScene() -> UIViewController {
        let router: SplashMainPresenterToRouter = SplashMainRouter()
        let interactor: SplashMainPresenterToInteractor = SplashMainInteractor()
        let presenter: SplashMainViewToPresenter & SplashMainInteractorToPresenter = SplashMainPresenter()
        
        let view: UIViewController & SplashMainPresenterToView = SplashMainView()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}

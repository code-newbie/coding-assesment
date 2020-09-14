// 
//  SplashMainRouter.swift
//  Splash
//
//  Created by Ilhammalik on 01/09/20.
//

import UIKit

class SplashMainRouter: SplashMainPresenterToRouter {
    func navigateToVending(_ from: SplashMainPresenterToView) {
        guard let splashVC = from as? UIViewController else {return}
        SplashConfigurator.shared.delegate?.fromSplashScreenToVending(splashVC)
    }
}

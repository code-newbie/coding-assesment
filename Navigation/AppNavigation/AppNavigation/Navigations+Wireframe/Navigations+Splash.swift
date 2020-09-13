//
//  Navigations+Splash.swift
//  AppNavigation
//
//  Created by Ilhammalik on 01/09/20.
//

import UIKit
import Splash


extension Navigation: SplashWireframe {
    public func fromSplashScreenToVending(_ splashVC: UIViewController) {
        let navigationController = buildTabBarScreen()
        navigationController.modalPresentationStyle = .fullScreen
        splashVC.navigationController?.present(navigationController, animated: true, completion: nil)
    }
}

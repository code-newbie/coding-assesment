//
//  UIApplication.swift
//  Common
//
//  Created by Ilhammalik on 05/09/20.
//

import UIKit

public extension UIApplication {
     class func getTopMostViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopMostViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return getTopMostViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return getTopMostViewController(base: presented)
        }
        return base
    }

    class func appRootViewController() -> UIViewController? {
        return (UIApplication.shared.keyWindow?.rootViewController as? UINavigationController)?.viewControllers.first
    }
    
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}

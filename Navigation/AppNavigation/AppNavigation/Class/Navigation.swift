//
//  Navigation.swift
//  AppNavigation
//
//  Created by Ilhammalik on 01/09/20.
//

import UIKit
import Foundation
import Splash
import VendingMachine
import Payment
import Music
import Domains

public class Navigation {
    public static let shared = Navigation()
    // used to bypassing error response from server
  
    var window: UIWindow?
    
    var mainWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.connectedScenes.filter { (scene) -> Bool in
                return scene.activationState == .foregroundActive
            }.compactMap {
                (($0 as? UIWindowScene)?.delegate as? UIWindowSceneDelegate)
                }.first?.window as? UIWindow ?? UIApplication.shared.keyWindow
        }
        return UIApplication.shared.keyWindow
    }
    
 
    //add init for implement delegate
    init() {
        SplashConfigurator.shared.delegate = self
        VendingMachineConfigurator.shared.delegate = self
        PaymentConfigurator.shared.delegate = self
        MusicConfigurator.shared.delegate = self
    }
    
    public func buildSplashModule() -> UIViewController {
        return SplashConfigurator.shared.createSplashMainScene()
    }
    
    public func buildVendingModule() -> UIViewController {
        return VendingMachineConfigurator.shared.createVendingModule()
    }
    
    public func buildPaymentModule(dataModel: VendingModel?) -> UIViewController {
        return PaymentConfigurator.shared.createPaymentModule(dataModel: dataModel)
    }
    
    public func buildReceiptModule() -> UIViewController {
           return PaymentConfigurator.shared.createReceiptModule()
    }
    
    public func buildMusicModule() -> UIViewController {
          return MusicConfigurator.shared.createMusicListModule()
    }
    
    public func buildMusicPlayerModule(dataModel: [Song]?, indexPath: IndexPath) -> UIViewController {
            return MusicConfigurator.shared.createMusicPlayerModule(dataModel: dataModel, indexPath: indexPath)
      }
    
    public func buildTabBarScreen(selectedIndex: Int = 0, flag: Bool = false) -> MainTabBarViewController {
           var viewControllers:[UIViewController] = []
             viewControllers.append(TabBarControllerCategory.home.viewController)
             viewControllers.append(TabBarControllerCategory.music.viewController)
           return  MainTabBarViewController(with: viewControllers, selectedIndex: selectedIndex)
       }

}

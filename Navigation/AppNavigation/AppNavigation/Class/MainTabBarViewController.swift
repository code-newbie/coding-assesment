//
//  MainTabBarViewController.swift
//  AppNavigation
//
//  Created by Ilhammalik on 01/09/20.
//

import UIKit
import CommonUIKit
import Domains

public class MainTabBarViewController: UIViewController {
    
    private var selectedIndex: Int = 0
    
    public init(with viewController: [UIViewController], selectedIndex: Int) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = viewController
        self.selectedIndex = selectedIndex
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var viewControllers:[UIViewController] = []
    
    lazy var tabBarViewController: UITabBarController = {
        let tabBarViewController: UITabBarController = UITabBarController()
        tabBarViewController.tabBar.barTintColor = .white
        tabBarViewController.tabBar.isTranslucent = false
        tabBarViewController.delegate = self
        return tabBarViewController
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabBarViewController.view)
        self.addChild(tabBarViewController)
        tabBarViewController.didMove(toParent: self)
        tabBarViewController.viewControllers = viewControllers
        tabBarViewController.selectedIndex = selectedIndex
        setNeedsStatusBarAppearanceUpdate()
        
    }
}

extension MainTabBarViewController: UITabBarControllerDelegate {
    public func tabBarController(_ tabBarController: UITabBarController,
                                 shouldSelect viewController: UIViewController) -> Bool {
        setNeedsStatusBarAppearanceUpdate()
        return  viewController != tabBarViewController.selectedViewController
    }
}

enum TabBarControllerCategory {
    case home
    case music
}


extension TabBarControllerCategory {
    var getImage: (normal: String, selected: String) {
        switch self {
        case .home:
            return (NIC.home.value, NIC.home.value)
        case .music:
            return (NIC.music.value, NIC.music.value)
            
        }
    }
    
    var tabBarTitle: String? {
        switch self {
        case .home:
            return NSC.home.rawValue
        case .music:
            return NSC.music.rawValue
        }
    }
    
    public var getTabBarItem: UITabBarItem {
        let tabbarItem = UITabBarItem(title: self.tabBarTitle?.uppercased(),
                                      image: UIImage(named: self.getImage.normal),
                                      selectedImage: UIImage(named: self.getImage.selected))
        return tabbarItem
    }
    
    var viewController: UIViewController {
        switch self {
        case .home:
            let homeViewController = Navigation.shared.buildVendingModule()
            homeViewController.tabBarItem = self.getTabBarItem
            homeViewController.title = self.tabBarTitle
            if #available(iOS 13.0, *) {
                let boldConfig = UIImage.SymbolConfiguration(weight: .bold)
                let icon = UIImage(systemName: "house", withConfiguration: boldConfig)
                homeViewController.tabBarItem.image = icon
            } else {
                // Fallback on earlier versions
            }
            
            return NavigationController(rootViewController: homeViewController)
        case .music:
            let musicViewController = Navigation.shared.buildMusicModule()
            musicViewController.title = self.tabBarTitle
            musicViewController.tabBarItem = self.getTabBarItem
            if #available(iOS 13.0, *) {
                let boldConfig = UIImage.SymbolConfiguration(weight: .bold)
                let icon = UIImage(systemName: "play", withConfiguration: boldConfig)
                musicViewController.tabBarItem.image = icon
            } else {
                // Fallback on earlier versions
            }
            return NavigationController(rootViewController: musicViewController)
        }
    }
}

import Foundation
import UIKit
import Common
import Domains
import AppNavigation

/// The concept
/// Deep linking, Analytics will be injected here
/// Instantiate subassemblies
/// Wires connections between subassemblies
/// Keep strong references to subassemblies

public class MainAssembly {
    
    var mainStory : MainStoryAssembly!
    
    private static var initialized = false
    
    ///initiliaziation can be several parameters
    public init(_ window: UIWindow,
                firebaseAppId: String? = "") {
        mainStory = MainStoryAssembly.init(window: window)
        initialSetup(window: window)
    }
    
    public func getInitialScreen() -> UIViewController {
        return mainStory.initialScreen()
    }
    
    func initialSetup(window: UIWindow) {

    }
}

protocol MainStoryAssemblyImp: class {
    func initialScreen() -> UIViewController
    func initialHomeScreen() -> UIViewController
}

public class MainStoryAssembly: MainStoryAssemblyImp {
    
    var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }

    /// `Func` to called initial story of Navigation
    func initialScreen() -> UIViewController {
        return Navigation.shared.buildSplashModule()
    }
 
    func initialHomeScreen() -> UIViewController {
        return UIViewController()
    }
    
}

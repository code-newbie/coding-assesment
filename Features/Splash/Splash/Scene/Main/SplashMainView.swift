//
//  SplashMainView.swift
//  Splash
//
//  Created by Ilhammalik on 01/09/20.
//

import UIKit

class SplashMainView: UIViewController, SplashMainPresenterToView {
    var presenter: SplashMainViewToPresenter?
    let username: String? = nil
    let hasWarning :String = ""
    var className: String = String(describing: SplashMainView.self)
    
    init() {
        super.init(nibName: className, bundle: Bundle(for: SplashMainView.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

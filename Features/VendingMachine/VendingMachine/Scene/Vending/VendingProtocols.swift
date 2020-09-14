// 
//  VendingProtocols.swift
//  VendingMachine
//
//  Created by ILHAM on 11/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit
import Domains

//MARK: View -
protocol VendingPresenterToView: class {
    var presenter: VendingViewToPresenter? { get set }
    /**
     * Stubs for communication PRESENTER -> VIEW
     */
    func setupView()
    func navigationBar()
}

//MARK: Interactor -
protocol VendingPresenterToInteractor: class {
    var presenter: VendingInteractorToPresenter?  { get set }
    
    /**
     * Stubs for communication PRESENTER -> INTERACTOR
     */
}


//MARK: Router -
protocol VendingPresenterToRouter: class {
    func navigateToPayment(_ from: VendingPresenterToView, dataModel: VendingModel?)
    /**
     * Stubs for communication PRESENTER -> ROUTER
     */
}

//MARK: Presenter -
protocol VendingViewToPresenter: class {
    var view: VendingPresenterToView? {get set}
    var interactor: VendingPresenterToInteractor? {get set}
    var router: VendingPresenterToRouter? {get set}
    var vendingModel : [VendingModel] {get set}
    /**
     * Stubs for communication VIEW -> PRESENTER
     */
    func viewDidload()
    func didSelect(dataModel: VendingModel?)
}

protocol VendingInteractorToPresenter: class {
    
    /**
     * Stubs for communication INTERACTOR -> PRESENTER
     */
}

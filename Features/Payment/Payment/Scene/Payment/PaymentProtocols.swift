// 
//  PaymentProtocols.swift
//  Payment
//
//  Created by ILHAM on 11/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit
import Domains

//MARK: View -
protocol PaymentPresenterToView: class {
    var presenter: PaymentViewToPresenter? { get set }
    /**
     * Stubs for communication PRESENTER -> VIEW
     */
    func setInformation(productImage:String?, productName: String?, price:Int?)
    func setArrayButton(listButton: [ButtonModel])
    func setStackView()
    func navigationBar()
}

//MARK: Interactor -
protocol PaymentPresenterToInteractor: class {
    var presenter: PaymentInteractorToPresenter?  { get set }
    
    /**
     * Stubs for communication PRESENTER -> INTERACTOR
     */
}


//MARK: Router -
protocol PaymentPresenterToRouter: class {
    static func createPaymentModule() -> UIViewController
    /**
     * Stubs for communication PRESENTER -> ROUTER
     */
}

//MARK: Presenter -
protocol PaymentViewToPresenter: class {
    var view: PaymentPresenterToView? {get set}
    var interactor: PaymentPresenterToInteractor? {get set}
    var router: PaymentPresenterToRouter? {get set}
    var dataModel: VendingModel? {get set}
    /**
     * Stubs for communication VIEW -> PRESENTER
     */
    func viewDidload()
}

protocol PaymentInteractorToPresenter: class {
    
    /**
     * Stubs for communication INTERACTOR -> PRESENTER
     */
}

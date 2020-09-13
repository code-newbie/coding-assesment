// 
//  ReceiptProtocols.swift
//  Payment
//
//  Created by ILHAM on 11/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit


//MARK: View -
protocol ReceiptPresenterToView: class {
    var presenter: ReceiptViewToPresenter? { get set }
    /**
     * Stubs for communication PRESENTER -> VIEW
     */
}

//MARK: Interactor -
protocol ReceiptPresenterToInteractor: class {
    var presenter: ReceiptInteractorToPresenter?  { get set }
    
    /**
     * Stubs for communication PRESENTER -> INTERACTOR
     */
}


//MARK: Router -
protocol ReceiptPresenterToRouter: class {
    static func createReceiptModule() -> UIViewController
    /**
     * Stubs for communication PRESENTER -> ROUTER
     */
}

//MARK: Presenter -
protocol ReceiptViewToPresenter: class {
    var view: ReceiptPresenterToView? {get set}
    var interactor: ReceiptPresenterToInteractor? {get set}
    var router: ReceiptPresenterToRouter? {get set}
    
    /**
     * Stubs for communication VIEW -> PRESENTER
     */
}

protocol ReceiptInteractorToPresenter: class {
    
    /**
     * Stubs for communication INTERACTOR -> PRESENTER
     */
}

// 
//  PaymentRouter.swift
//  Payment
//
//  Created by ILHAM on 11/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit

class PaymentRouter: PaymentPresenterToRouter {
    
    static func createPaymentModule() -> UIViewController {
        let view: UIViewController & PaymentPresenterToView = PaymentView()
        let presenter: PaymentViewToPresenter & PaymentInteractorToPresenter = PaymentPresenter()
        let interactor: PaymentPresenterToInteractor = PaymentInteractor()
        let router: PaymentPresenterToRouter = PaymentRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}

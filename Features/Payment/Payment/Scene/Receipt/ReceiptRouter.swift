// 
//  ReceiptRouter.swift
//  Payment
//
//  Created by ILHAM on 11/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit

class ReceiptRouter: ReceiptPresenterToRouter {
    
    static func createReceiptModule() -> UIViewController {
        let view: UIViewController & ReceiptPresenterToView = ReceiptView()
        let presenter: ReceiptViewToPresenter & ReceiptInteractorToPresenter = ReceiptPresenter()
        let interactor: ReceiptPresenterToInteractor = ReceiptInteractor()
        let router: ReceiptPresenterToRouter = ReceiptRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}

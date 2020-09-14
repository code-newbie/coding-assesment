//
//  PaymentConfigurator.swift
//  Payment
//
//  Created by ILHAM on 12/09/20.
//

import UIKit
import Domains

public class PaymentConfigurator {
    public static var shared = PaymentConfigurator()
    public weak var delegate:  PaymentWireframe?
    
    public func createPaymentModule(dataModel: VendingModel?) -> UIViewController {
        let view: UIViewController & PaymentPresenterToView = PaymentView()
        let presenter: PaymentViewToPresenter & PaymentInteractorToPresenter = PaymentPresenter()
        let interactor: PaymentPresenterToInteractor = PaymentInteractor()
        let router: PaymentPresenterToRouter = PaymentRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.dataModel = dataModel
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    public func createReceiptModule() -> UIViewController {
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

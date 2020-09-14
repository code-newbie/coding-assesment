//
//  PaymentPresenter.swift
//  Payment
//
//  Created by ILHAM on 12/09/20.
//

import Foundation
import UIKit
import Domains

class PaymentPresenter: PaymentViewToPresenter {
    
    
    weak var view: PaymentPresenterToView?
    var interactor: PaymentPresenterToInteractor?
    var router: PaymentPresenterToRouter?
    var dataModel: VendingModel?
    var listButton : [ButtonModel] = [
        ButtonModel(nominal: 2000),
        ButtonModel(nominal: 5000),
        ButtonModel(nominal: 10000),
        ButtonModel(nominal: 20000)
    ]

    func viewDidload() {
        view?.navigationBar()
        view?.setArrayButton(listButton: listButton)
        view?.setStackView()
        view?.setInformation(productImage: dataModel?.image, productName: dataModel?.title, price: dataModel?.price)
    }
}

extension PaymentPresenter: PaymentInteractorToPresenter {
    
}

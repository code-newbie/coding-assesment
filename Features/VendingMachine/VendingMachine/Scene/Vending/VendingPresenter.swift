//
//  VendingPresenter.swift
//  VendingMachine
//
//  Created by ILHAM on 11/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import Foundation
import Domains

class VendingPresenter: VendingViewToPresenter {
    weak var view: VendingPresenterToView?
    var interactor: VendingPresenterToInteractor?
    var router: VendingPresenterToRouter?
    var vendingModel : [VendingModel] = [
        VendingModel(id: 1, title: "Aqua", image: "Aqua", price: 5000, stock: 0),
        VendingModel(id: 2, title: "Teh Botol", image: "Teh", price: 7000, stock: 10),
        VendingModel(id: 3, title: "Pocari", image: "Pocari", price: 10000, stock: 12)
    ]
    
    func viewDidload() {
        view?.setupView()
        view?.navigationBar()
    }
    
    func didSelect(dataModel: VendingModel?) {
        guard let view = view else { return }
        router?.navigateToPayment(view, dataModel: dataModel)
    }
}

extension VendingPresenter: VendingInteractorToPresenter {
    
}

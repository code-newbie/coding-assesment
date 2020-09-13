//
//  ReceiptPresenter.swift
//  Payment
//
//  Created by ILHAM on 11/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import Foundation

class ReceiptPresenter: ReceiptViewToPresenter {
    weak var view: ReceiptPresenterToView?
    var interactor: ReceiptPresenterToInteractor?
    var router: ReceiptPresenterToRouter?
  
}

extension ReceiptPresenter: ReceiptInteractorToPresenter {
    
}

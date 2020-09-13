// 
//  VendingRouter.swift
//  VendingMachine
//
//  Created by ILHAM on 11/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit
import Domains

class VendingRouter: VendingPresenterToRouter {
    func navigateToPayment(_ from: VendingPresenterToView, dataModel: VendingModel?) {
        guard let splashVC = from as? UIViewController else {return}
        VendingMachineConfigurator.shared.delegate?.fromVendingScreenToPayment(splashVC, dataModel: dataModel)
    }
}

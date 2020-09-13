//
//  Navigations+VendingMachine.swift
//  AppNavigation
//
//  Created by ILHAM on 11/09/20.
//

import UIKit
import VendingMachine
import Domains

extension Navigation: VendingMachineWireframe {

     public func fromVendingScreenToPayment(_ viewcontrollerVC: UIViewController, dataModel: VendingModel?) {
        let toViewcontroller = buildPaymentModule(dataModel: dataModel)
        toViewcontroller.hidesBottomBarWhenPushed = true
        viewcontrollerVC.navigationController?.pushViewController(toViewcontroller, animated: true)
      }
}

//
//  VendingMachineWireframe.swift
//  VendingMachine
//
//  Created by ILHAM on 11/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit
import Domains

public protocol VendingMachineWireframe: class {
    func fromVendingScreenToPayment(_ viewcontrollerVC: UIViewController, dataModel: VendingModel?)
}

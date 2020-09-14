//
//  PayemntWireframe.swift
//  Payment
//
//  Created by ILHAM on 11/09/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit

public protocol PaymentWireframe: class {
    func fromPaymentScreenToRecipt(_ splashVC: UIViewController)
}

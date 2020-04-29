//
//  VendingMachineViewModel.swift
//  aia-ios-assesment
//
//  Created by Imanuel Pardosi on 30/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import Foundation
import UIKit

class VendingMachineViewModel {
   
    var nominal = [Nominal]()
    var currentMoney = 0
    
    init() {
        nominal = [Nominal(nominal: 2000, display: "Rp2.000"),
                   Nominal(nominal: 5000, display: "Rp5.000"),
                   Nominal(nominal: 10000, display: "Rp10.000"),
                   Nominal(nominal: 20000, display: "Rp20.000")
        ]
    }
    
    func updateMoney(index: Int) -> (String) {
        currentMoney += nominal[index].nominal
        
        return "Total: Rp\(currentMoney.formattedWithSeparator)"
    }
    
    
}

extension VendingMachineViewModel {
    func getNumberOfNominal() -> Int {
        return nominal.count
    }
    
    func getNominalForIndex(index: Int) -> Nominal {
        return nominal[index]
    }
    
    
}


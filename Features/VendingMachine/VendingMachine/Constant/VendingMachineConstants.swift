//
//  SplashConstants.swift
//  Splash
//
//  Created by Ilhammalik on 01/09/20.
//

import Foundation
typealias Constants = PaymentConstants
struct PaymentConstants {
    static let titleNavigationBar = "Vending Machine"
    static let price = "Harga : "
    static let stock = "Ketersediaan : "
}

enum VendingScreenCellID: String, CaseIterable {
    case defaultCellID = "cell"
    
    var value : String {
        return rawValue
    }
}

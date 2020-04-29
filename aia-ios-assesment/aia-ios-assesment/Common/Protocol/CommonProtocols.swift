//
//  CommonProtocols.swift
//  aia-ios-assesment
//
//  Created by Imanuel Pardosi on 30/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import Foundation

protocol ProductDelegate: class {
    func updateTotalPurchase(cell: ProductCell, updateType: UpdateType, numberOfItem: Int)
    func updateLabelTotalPurchase(text: String)
}

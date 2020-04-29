//
//  ProductCell.swift
//  aia-ios-assesment
//
//  Created by Imanuel Pardosi on 30/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTotalItem: UILabel!
    
    var numberOfItem = 0
    
    weak var delegate: ProductDelegate?
    
    
    @IBAction func btnDecreaseOnClick() {
        delegate?.updateTotalPurchase(cell: self, updateType: .decrease, numberOfItem: numberOfItem)
    }
    
    @IBAction func btnIncreaseOnClick() {
        delegate?.updateTotalPurchase(cell: self, updateType: .increase, numberOfItem: numberOfItem)
    }
}

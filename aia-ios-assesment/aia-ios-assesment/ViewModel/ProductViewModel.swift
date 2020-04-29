//
//  ProductViewModel.swift
//  aia-ios-assesment
//
//  Created by Imanuel Pardosi on 30/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import Foundation
import UIKit

class ProductViewModel {
   
    var arrProduct = [Product]()
    var totalPurchased = 0
    var totalMoney: Int!
    
    weak var delegate: ProductDelegate?
    
    
    init() {
        arrProduct = [Product(id: 0, name: "Aqua", price: 5000, stock: 10),
                   Product(id: 1, name: "Teh Botol", price: 7000, stock: 5),
                   Product(id: 2, name: "Pocari Sweat", price: 10000, stock: 5)
        ]
    }

    func updatePurchaseProduct(viewController: UIViewController, product: Product, cell: ProductCell, updateType: UpdateType, numberOfItem: Int) {
        
        if updateType == .decrease {
            if numberOfItem > 0 {
                totalPurchased -= product.price
                delegate?.updateLabelTotalPurchase(text: "Total Purchase: Rp\(totalPurchased.formattedWithSeparator)")
                cell.numberOfItem = numberOfItem - 1
                cell.lblTotalItem.text = "\(numberOfItem - 1)"
            }
        }
        
        if updateType == .increase {
            if (totalPurchased + product.price) > totalMoney {
                Utility.showAlert(toController: viewController, withTitle: "Error", withMessage: "Your balance is not enough")
            } else if isStockValid(product: product, numberOfItem: numberOfItem) {
                totalPurchased += product.price
                delegate?.updateLabelTotalPurchase(text: "Total Purchase: Rp\(totalPurchased.formattedWithSeparator)")
                cell.numberOfItem = numberOfItem + 1
                cell.lblTotalItem.text = "\(numberOfItem + 1)"
            } else {
                Utility.showAlert(toController: viewController, withTitle: "Error", withMessage: "Product out of stock")
            }
        }
    }
    
    func isStockValid(product: Product, numberOfItem: Int) -> Bool {
        var result = false
        
        for (index, data) in arrProduct.enumerated() {
            if data.id == product.id {
                if numberOfItem < arrProduct[index].stock {
                    result = true
                }
            }
        }
        return result
    }


}

extension ProductViewModel {
    func getNumberOfProduct() -> Int {
        return arrProduct.count
    }
    
    func getProductForIndex(index: Int) -> Product {
        return arrProduct[index]
    }
    
    
}


//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Ryan Tanri on 01/04/20.
//  Copyright © 2020 Ryan Tanri. All rights reserved.
//

import Foundation

class VendingMachine {
    var itemInVendingMachine = [Item]()
    var moneyAcceptedByVendingMachine = 0
    
    func inputItemToVendingMachine(itemName: ItemName) {
        let itemToBeInput = Item(itemName: itemName)
        itemInVendingMachine.append(itemToBeInput)
    }
    
    func getMoneyFromCustomer(nominal: Int) {
        if nominal == 2000 || nominal == 5000 || nominal == 10000 || nominal == 20000 {
            moneyAcceptedByVendingMachine += nominal
        } else {
            print("Sorry this vending machine can only accept 2000, 5000, 10000, and 20000")
        }
    }
    
    func isSelectedItemInStock(itemName: ItemName) -> Bool {
        var quantityOfSelectedItem = 0
        for item in itemInVendingMachine {
            if item.itemName == itemName {
                quantityOfSelectedItem += 1
            }
        }
        if quantityOfSelectedItem > 0 {
            return true
        } else {
            return false
        }
    }
}

//
//  Item.swift
//  VendingMachine
//
//  Created by Ryan Tanri on 01/04/20.
//  Copyright © 2020 Ryan Tanri. All rights reserved.
//

import Foundation

enum ItemName {
    case Aqua
    case TehBotol
    case PocariSweat
}

class Item {
    var itemName: ItemName
    var price: Int
    
    init(itemName: ItemName) {
        self.itemName = itemName
        switch itemName {
        case .Aqua:
            price = 5000
        case .TehBotol:
            price = 7000
        case .PocariSweat:
            price = 10000
        }
    }
}

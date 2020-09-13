//
//  Articles.swift
//  Domains
//
//  Created by Ilhammalik on 30/05/20.
//  Copyright © 2020 Ilhammalik. All rights reserved.
//

import Foundation
// MARK: - Article
public struct VendingModel: Codable {
    public var id: Int
    public var title: String
    public var image: String
    public var price: Int
    public var stock: Int

    public init(id: Int, title: String, image: String, price: Int, stock: Int) {
      self.id = id
      self.title = title
      self.image = image
      self.price = price
      self.stock = stock
    }
}



public struct ButtonModel: Codable {
    public var nominal: Int
    
    public init(nominal: Int) {
      self.nominal = nominal
    }
}

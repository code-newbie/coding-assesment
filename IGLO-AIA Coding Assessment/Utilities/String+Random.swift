//
//  String+Random.swift
//  IGLO-AIA Coding Assessment
//
//  Created by Vebby Clarissa on 17/04/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

extension String {
    static func randomString(length: Int) -> String {
      let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        return String((0...length).map{ _ in letters.randomElement()! })
    }
}

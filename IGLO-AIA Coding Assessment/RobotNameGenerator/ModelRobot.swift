//
//  ModelRobot.swift
//  IGLO-AIA Coding Assessment
//
//  Created by Vebby Clarissa on 17/04/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

struct Robot {
    var name: String = ""
    init() {
        rename()
    }
    init(_ name:String) {
        self.name = name
    }
    mutating func rename() {
        let number = Int.random(in: 100...999)
        let str = String.randomString(length: 2)
        name = "\(str)\(number)"
    }
}

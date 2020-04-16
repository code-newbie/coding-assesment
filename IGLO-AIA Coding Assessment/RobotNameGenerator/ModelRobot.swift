//
//  ModelRobot.swift
//  IGLO-AIA Coding Assessment
//
//  Created by Vebby Clarissa on 17/04/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

struct Robot {
    static var names : [String] = []
    var name: String
    init() {
        rename()
        while Robot.names.contains(name) {
            rename()
        }
    }
    mutating func rename() {
        let number = Int.random(in: 100...999)
        let str = String.randomString(length: 2)
        name = "\(str)\(number)"
    }
}

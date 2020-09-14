//
//  NavigationConstant.swift
//  AppNavigation
//
//  Created by ILHAM on 12/09/20.
//

typealias NIC = NavigationImageConstant
enum NavigationImageConstant: String {
    case home = "home"
    case music = "music"

    var value: String {
        return self.rawValue
    }
}

typealias NSC = NavigationStringConstant

enum NavigationStringConstant: String {
    case home = "Vending"
    case music = "Music"
    
    var localized: String? {
        return self.rawValue.localize()
    }
}

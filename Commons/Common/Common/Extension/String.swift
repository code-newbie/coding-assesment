//
//  String.swift
//  Common
//
//  Created by Ilhammalik on 05/09/20.
//

import Foundation
import UIKit

// MARK: - Y/N handling

let kYesString = "Y"
let kNoString = "N"

public extension Bool {
    func stringYN() -> String {
        return self ? kYesString : kNoString
    }
}

public extension String {
    func boolYN() -> Bool? {
        switch self {
        case kYesString: return true
        case kNoString: return false
        default: return nil
        }
    }
    
    var boolValue: Bool? {
        switch self {
        case "1": return true
        case "0": return false
        default: return nil
        }
    }
    
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    func localize() -> String {
        return LanguageManager.shared.getI18nStringValue(of: self)
    }
    
    func localize(with variables: [String:String]) -> String {
        return LanguageManager.shared.getI18nStringValue(of: self, with: variables)
    }

    static func separatorStringArrayToString(stringArray: [String]) -> String {
        let filterStringArr = stringArray.filter({ $0.isNotEmpty })
        return filterStringArr.joined(separator: "\n")
    }
    
    func convertCurrentcy() -> String {
        let harga:Int = Int(self) ?? 0
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        guard let currentcy = formatter.string(from: harga as NSNumber) else { return "" }
        return "\(currentcy)"
    }
}

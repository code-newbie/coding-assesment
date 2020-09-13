//
//  SettingContextProtocol.swift
//  Common
//
//  Created by Ilhammalik on 05/09/20.
//

import Foundation
import Valet

public protocol SettingContextProtocol {
    var appLaunchType: String? {get set}
    var secretKey: String? {get set}
    var cardFlowType: String? {get set}
    var encryptedEpin: String? { get set }
    var encryptedPassword : String? { get set }
    var selectedLanguage: String? {get set}
}

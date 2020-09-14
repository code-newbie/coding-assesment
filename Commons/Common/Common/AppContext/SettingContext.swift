//
//  SettingContext.swift
//  Common
//
//  Created by Ilhammalik on 05/09/20.
//

import Foundation
import Valet

public class SettingContext: SettingContextProtocol {
    public var encryptedEpin: String?
    
    public var encryptedPassword: String?
    
    public static var shared = SettingContext()
    let keychainValet: Valet
    let userDefault = UserDefaults.standard
    
    init() {
        self.keychainValet = Valet.valet(with: Identifier(nonEmpty: Bundle.main.bundleIdentifier)!,
                            accessibility: .whenUnlocked)
    }
    
    public var secretKey: String? {
        get { return self.keychainValet.string(forKey: "secretKey") }
        set {
            if let newValue = newValue {
                self.keychainValet.set(string: newValue, forKey: "secretKey")
            } else {
                self.keychainValet.removeObject(forKey: "secretKey")
            }
        }
    }
    public var accessToken: String?
    public var selectedLanguage: String? {
         get {
             return self.userDefault.string(forKey: "selectedLanguage")
         }
         set {
             self.userDefault.set(newValue, forKey: "selectedLanguage")
         }
     }
    public var refreshToken: String? {
        get {return self.keychainValet.string(forKey: "refreshToken")}
        set {
            if let newValue = newValue {
                self.keychainValet.set(string: newValue, forKey: "refreshToken")
            } else {
                self.keychainValet.removeObject(forKey: "refreshToken")
            }
        }
    }
    
    public var appLaunchType: String? {
        get { return self.userDefault.string(forKey: "appLaunchType") }
        set { self.userDefault.set(newValue, forKey: "appLaunchType") }
    }
    
    public var scenario: String?
    public var cardFlowType: String? {
        get { return self.userDefault.string(forKey: "cardFlowType") }
        set { self.userDefault.set(newValue, forKey: "cardFlowType") }
    }
    
    public var userId: String?
    
    public var deviceId: String? {
        get { return self.keychainValet.string(forKey: "deviceId") }
        set(newDeviceId) {
            if let newDeviceId = newDeviceId {
                self.keychainValet.set(string: newDeviceId, forKey: "deviceId")
            } else {
                self.keychainValet.removeObject(forKey: "deviceId")
            }
        }
    }
    public var authToken: String? {
        get {
            return self.keychainValet.string(forKey: "authToken")
        }
        set {
            if let newValue = newValue {
                self.keychainValet.set(string: newValue, forKey: "authToken")
            } else {
                self.keychainValet.removeObject(forKey: "authToken")
            }
        }
    }

}

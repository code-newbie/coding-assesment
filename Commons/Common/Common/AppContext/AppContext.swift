//
//  AppContext.swift
//  Common
//
//  Created by Ilhammalik on 28/05/20.
//  Copyright © 2020 Ilhammalik. All rights reserved.
//

import Foundation

// MARK: - Config Keys
/// Usage: Define this to help you maintain
/// `key` in `info.plist`
public enum ConfigKeys: String {
    case appEnv = "AppEnvironment"
    case baseUrl = "BaseURL"
    case appName = "CFBundleName"
    case basePath = "BasePath"
    case clientId = "ClientID"
    case clientSecret = "ClientSecret"
    case isEnableNetworkLogger = "EnableNetworkLogger"
    case isEnableUntrustBaseUrl = "EnableUntrustBaseUrl"
    case isEnableProtectiveScreen = "EnableProtectiveScreen"
    
    //appd setup
    case appdKey = "APPDKey"
    case collectorURL = "APPDCollectorURL"
    case screenshotURL = "APPScreenshotURL"
    case isAPPDLoggingEnable = "APPDLoggingEnable"
    case isAPPDScreeshotEnable = "APPDScreenshotEnable"
}

public class AppContext {
    
    public init() { }
    
    public static var instance: AppContext {
        return AppContext()
    }
    /// This method allow to read `Bundle`
    /// Read configuration for `.xconfig`
    /// whenever variable defines in `.xconfig`
    /// it can be read using this function
    /// and don't forget to defined variable into `.plist`
    public func infoForKey(_ key: String, defaultValue: String = "") -> String {
        let dictionary = Bundle.main.infoDictionary?["Config"] as? NSDictionary
        if let value = (dictionary?[key] as? String)?.replacingOccurrences(of: "\\", with: "") {
            return value
        } else {
            return defaultValue
        }
    }
}

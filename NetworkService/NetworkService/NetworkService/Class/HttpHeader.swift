//
//  HttpHeader.swift
//  NetworkService
//
//  Created by Ilhammalik on 05/09/20.
//

import UIKit
import Common

public enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case language = "Accept-Language"
    case requestId = "X-Request-ID"
    case platform = "X-Platform"
    case clientVersion = "X-Client-Version"
    case deviceId = "X-Device-ID"
    case channelId = "X-Channel-ID"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case local = "Locale"
    case xDeviceToken = "X-Device-Token"
    case xClientId = "X-Client-ID"
    case xClientSecret = "X-Client-Secret"
    case xScope = "X-Scope"
    case xGrantType = "X-Grant-Type"
    
    static func getCommonHeader() -> [String:String] {
        var commonHeader = [
            HTTPHeaderField.language.rawValue: LanguageManager.shared.getCurrentStoreLanguageHTTPHeader(),
            HTTPHeaderField.requestId.rawValue: UUID().uuidString,
            HTTPHeaderField.platform.rawValue: "ios",
            HTTPHeaderField.clientVersion.rawValue: UIApplication.appVersion ?? "",
            HTTPHeaderField.deviceId.rawValue: SettingContext.shared.deviceId ?? "",
            HTTPHeaderField.channelId.rawValue: "EVE",
            HTTPHeaderField.contentType.rawValue: HttpContentType.json.rawValue
        ]
        if let accessToken = SettingContext.shared.accessToken, !accessToken.isEmpty {
            commonHeader[HTTPHeaderField.authentication.rawValue] = accessToken
        }
        
        return commonHeader
    }
    
    static func getAnonymousHeader() -> [String: String] {
        var header = HTTPHeaderField.getCommonHeader()
        let clientId = AppContext.instance.infoForKey(ConfigKeys.clientId.rawValue,
                                                      defaultValue: "94c4e528-76d1-493b-80ca-972513918668")
        let clientSecret = AppContext.instance.infoForKey(ConfigKeys.clientSecret.rawValue,
        defaultValue: "83682f6b-a296-466b-9ec5-1357c96230c2")
        header[HTTPHeaderField.xClientId.rawValue] = clientId
        header[HTTPHeaderField.xClientSecret.rawValue] = clientSecret
        header[HTTPHeaderField.xScope.rawValue] = "anonymous"
        header[HTTPHeaderField.xGrantType.rawValue] = "client_credentials"
        
        return header
    }
}

public enum HttpContentType: String {
    case json = "application/json"
}

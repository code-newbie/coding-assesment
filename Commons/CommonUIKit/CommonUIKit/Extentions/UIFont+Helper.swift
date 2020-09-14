//
//  UIFont+Helper.swift
//  CommonUIKit
//
//  Created by ILHAM on 12/09/20.
//

import Foundation
import UIKit

public enum RegisterFontError: Error {
    case invalidFontFile
    case fontPathNotFound
    case initFontError
    case registerFailed
}

extension UIFont {
    private class DummyClass {}
    
    static func register(fileNameString: String, type: String) throws {
        let frameworkBundle = Bundle(for: DummyClass.self)
        guard let resourceBundleURL = frameworkBundle.path(forResource: fileNameString, ofType: type) else {
            throw RegisterFontError.fontPathNotFound
        }
        guard let fontData = NSData(contentsOfFile: resourceBundleURL),    let dataProvider = CGDataProvider.init(data: fontData) else {
            throw RegisterFontError.invalidFontFile
        }
        guard let fontRef = CGFont.init(dataProvider) else {
            throw RegisterFontError.initFontError
        }
        var errorRef: Unmanaged<CFError>?
        guard CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) else {
            throw RegisterFontError.registerFailed
        }
    }
}

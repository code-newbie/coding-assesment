//
//  CommonUIFont.swift
//  CommonUIKit
//
//  Created by ILHAM on 12/09/20.
//

import Foundation
import UIKit

public class CommonUIFont {
    public static let shared = CommonUIFont()
    
    init () {
        let fontFaces = [
            CommonString.interphasesBold,
            CommonString.interphasesDemiBold,
            CommonString.interphasesExtraBold,
            CommonString.interphasesMedium,
            CommonString.interphasesRegular
        ]
        
        do {
            for fontName in fontFaces {
                try UIFont.register(fileNameString: fontName, type: CommonString.fontType)
                Log.print("\(CommonString.fontLoaded) \(fontName)")
            }
        } catch {
            Log.print("\(CommonString.fontError) \(error)")
        }
    }
    
    func getFont(_ CommonFontIdentifiable: CommonUIFontIdentifiable) -> UIFont {
        let fontComponent = CommonFontIdentifiable.getFontComponent()
        
        if let font = UIFont(name: fontComponent.fontName.rawValue,
                             size: fontComponent.fontSize) {
            return font
        } else {
            return UIFont.systemFont(ofSize: fontComponent.fontSize)
        }
    }
    
    public func getBodyFont(_ typeSize: CommonUIFontBodySize) -> UIFont {
        return getFont(typeSize)
    }
}

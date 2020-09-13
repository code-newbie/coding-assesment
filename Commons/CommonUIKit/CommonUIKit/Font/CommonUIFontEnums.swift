//
//  CommonUIFontEnums.swift
//  CommonUIKit
//
//  Created by ILHAM on 12/09/20.
//

import Foundation
public enum CommonUIFontOption: String {
    case ttInterphasesRegular =  "TTInterphases-Regular"
    case ttInterphasesMedium = "TTInterphases-Medium"
    case ttInterphasesBold = "TTInterphases-Bold"
    case ttInterphasesDemiBold = "TTInterphases-DemiBold"
    case ttInterphasesExtraBold = "TTInterphases-ExtraBold"
}

protocol CommonUIFontIdentifiable {
    func getFontComponent() -> CommonUIFontComponent
}

public enum CommonUIFontBodySize: CommonUIFontIdentifiable {
    case paragraphLead
    case body2Lines
    case body
    case placeholder
    case note
    case button1
    case button2
    case amountInput
    
    func getFontComponent() -> CommonUIFontComponent {
        switch self {
        case .paragraphLead:
            return CommonUIFontComponent(fontName: .ttInterphasesBold,
                                          fontSize: CommonUIConstant.fontSize5, spaceSize: CommonUIConstant.spaceSize6)
        case .body2Lines:
            return CommonUIFontComponent(fontName: .ttInterphasesRegular,
                                          fontSize: CommonUIConstant.fontSize3, spaceSize: CommonUIConstant.spaceSize2)
        case .body:
            return CommonUIFontComponent(fontName: .ttInterphasesRegular,
                                          fontSize: CommonUIConstant.fontSize3, spaceSize: CommonUIConstant.spaceSize3)
        case .placeholder:
            return CommonUIFontComponent(fontName: .ttInterphasesRegular,
                                      fontSize: CommonUIConstant.fontSize4, spaceSize: CommonUIConstant.spaceSize4)
        case .note:
            return CommonUIFontComponent(fontName: .ttInterphasesRegular,
                                          fontSize: CommonUIConstant.fontSize1, spaceSize: CommonUIConstant.spaceSize1)
        case .button1:
            return CommonUIFontComponent(fontName: .ttInterphasesBold,
                                          fontSize: CommonUIConstant.fontSize3, spaceSize: CommonUIConstant.spaceSize3)
        case .button2:
            return CommonUIFontComponent(fontName: .ttInterphasesBold,
                                          fontSize: CommonUIConstant.fontSize2, spaceSize: CommonUIConstant.spaceSize3)
        case .amountInput:
            return CommonUIFontComponent(fontName: .ttInterphasesDemiBold,
                                          fontSize: CommonUIConstant.fontSize7, spaceSize: CommonUIConstant.spaceSize8)
        }
    }
}


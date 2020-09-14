//
//  Language.swift
//  Common
//
//  Created by Ilhammalik on 05/09/20.
//

import Foundation
public struct LanguagePack: Codable {
    let content: Content
    let languagePackId: String
}

struct Content: Codable {
    let en, id: [String: String]
}

struct LanguagePackLastModified: Codable {
    let lastModified: String
}

protocol XIBLocalizable {
    var xibLocalizedKey: String? { get set }
}

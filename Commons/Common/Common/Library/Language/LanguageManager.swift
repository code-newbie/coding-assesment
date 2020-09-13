//
//  LanguageManager.swift
//  Common
//
//  Created by Ilhammalik on 05/09/20.
//

import Foundation
import i18next
import RxSwift

public enum Language: String {
    case en
    case id
    
    public var value: String {
        switch self {
        case .en:
            return "en-ID"
        default:
            return "id-ID"
        }
    }
}

public protocol LanguageManagerProtocol {
    func initiateLanguagePack()
    func getDeviceLanguage() -> String
    func getCurrentStoreLanguage() -> String
    func setResourceStore(with languageModel: LanguagePack)
    func fetchJsonFromBundle() -> LanguagePack?
    func setStoreLanguage(language: Language)
    func setLanguagePackId(id: String)
    func getLanguagePackId() -> String
    func compareLastModifiedDates(initialDate: String, latestDate: String, dateFormat: String) -> Bool
    func getI18nStringValue(of i18nKey: String) -> String
}

public class LanguageManager: LanguageManagerProtocol {
    
    struct Constants {
        static let jsonFileName = "LanguagePack"
        static let jsonExtension = "json"
        static let dateFormat = "yyyy-MM-dd'T'HH:mm:ss'.'SSSZZZZZ"
        static let bundleErrorMessage = "Failed to fetch language pack JSON from bundle."
    }
    
    private let i18n = I18Next()
    private let i18nOptions = I18NextOptions()
    private var disposeBag = DisposeBag()
    
    private var languagePackId: String = ""
    
    public static let shared: LanguageManager = {
        var manager = LanguageManager()
        manager.setup()
        return manager
    }()
    
    // MARK: - Private methods
    
    private init() {}
    
    private func setup() {
        if let selectedLanguage = SettingContext.shared.selectedLanguage {
            i18nOptions.lang = selectedLanguage
        } else {
            i18nOptions.lang = Language.id.rawValue
        }
        i18nOptions.fallbackLang = Language.id.rawValue
    }
    
    /**
     Transform initial dictionary format to dictionary format that is accepted
     in i18next library resource store
     
     - Returns: Formatted dictionary to be set as resource in i18next library store
     */
    private func transformDictionary(dictionary: [String: Any]) -> [String: Any] {
        var transformedDictionary = [String: Any]()
        var translations = [String: Any]()
        
        for (lang, str) in dictionary {
            translations["translation"] = str as? [String: String]
            transformedDictionary[lang] = translations
        }
        
        return transformedDictionary
    }
    
    // MARK: - Exposed methods
    public func initiateLanguagePack() {
        if let bundledLanguagePack = fetchJsonFromBundle() {
            self.setResourceStore(with: bundledLanguagePack)
        }
    }
    
    /**
     Get user device locale language
     
     - Returns: User device locale language
     */
    public func getDeviceLanguage() -> String {
        let locale = Locale.current
        guard let deviceLanguage = locale.languageCode else { return "" }
        return deviceLanguage
    }
    
    /**
     Get i18next library current stored language
     
     - Returns: Current stored language
     */
    public func getCurrentStoreLanguage() -> String {
        let storeLanguage = i18nOptions.lang
        return storeLanguage ?? Language.id.rawValue
    }
    
    /**
     Get i18next library current stored language
     
     - Returns: Current stored language for HTTP Header
     */
    public func getCurrentStoreLanguageHTTPHeader() -> String {
        return getCurrentStoreLanguage() + "-ID"
    }
    
    /**
     Set i18next library resource store language
     
     - Parameter languageModel: Language struct from service
     */
    public func setResourceStore(with languageModel: LanguagePack) {
        guard let dictionary = languageModel.dictionary else { return }
        guard let contentDictionary = dictionary["content"] as? [String: Any] else { return }
        let transformedContentDictionary = transformDictionary(dictionary: contentDictionary)
        
        // Save transfomed dictionary into library store
        i18nOptions.resourcesStore = transformedContentDictionary
        self.setLanguagePackId(id: languageModel.languagePackId)
        
        // Store language pack back to file if there is an update to it
        if getCurrentStoreLanguage() != languageModel.languagePackId {
            writeToBundleJsonFile(languagePack: languageModel)
        }
        
        i18n.load(options: i18nOptions.asDictionary()) { error in
            guard let i18nError = error else { return }
            print("i18n Error: ", i18nError)
        }
    }
    
    private func getBundleJsonFileUrl() -> URL? {
        return Bundle(for: LanguageManager.self).url(forResource: Constants.jsonFileName,
        withExtension: Constants.jsonExtension)
    }
    
    private func writeToBundleJsonFile(languagePack: LanguagePack) {
        if let fileUrl = self.getBundleJsonFileUrl() {
            let languageJsonEncoded = try? JSONEncoder().encode(languagePack)
            try? languageJsonEncoded?.write(to: fileUrl)
        }
    }
    
    /**
     Fetch language JSON from local stored .json in bundle
     
     - Returns: Language model
     */
    public func fetchJsonFromBundle() -> LanguagePack? {
        if let fileUrl = self.getBundleJsonFileUrl() {
            do {
                let data = try Data(contentsOf: fileUrl)
                let decoder = JSONDecoder()
                let json = try decoder.decode(LanguagePack.self, from: data)
                return json
            } catch let jsonError {
                print("JsonError: ", jsonError)
            }
        }
        return nil
    }
    
    /**
     Set i18next library store language
     
     - Parameter language: Language to use for i18next library store
     */
    public func setStoreLanguage(language: Language) {
        i18nOptions.lang = language.rawValue
        SettingContext.shared.selectedLanguage = language.rawValue
        i18n.load(options: i18nOptions.asDictionary()) { error in
            guard let i18nError = error else { return }
            print("i18n Error: ", i18nError)
        }
    }
    
    /**
     Set current language pack id
     
     - Parameter id: Current language pack id
     */
    public func setLanguagePackId(id: String) {
        self.languagePackId = id
    }
    
    /**
     Get current language pack id
     
     - Returns: Current language pack id
     */
    public func getLanguagePackId() -> String {
        return self.languagePackId
    }
    
    /**
     Comparison between last modified dates, if latest date is greater than initial date
     
     - Parameters:
     - initialDate: Initial modified date string
     - LatestDate: Latest modified date string
     - dateFormat: Date format to be converted into for comparison
     
     - Returns: true or false
     */
    public func compareLastModifiedDates(initialDate: String,
                                         latestDate: String,
                                         dateFormat: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        guard let initialDateObject = dateFormatter.date(from: initialDate) else {
            return true
        }
        
        guard let latestDateObject = dateFormatter.date(from: latestDate) else {
            return true
        }
        
        return latestDateObject > initialDateObject
    }
    
    /**
     Get localization text from i18next library
     - Parameter of: Localization text key
     - Returns: Localization text value or text key if value is not found
     */
    public func getI18nStringValue(of i18nKey: String) -> String {
        let key = i18n.exists(i18nKey)
        if key {
            return i18n.t(i18nKey)
        } else {
            return i18nKey
        }
    }
    
    /// Get localization text from i18next library with interpolation
    /// - Parameters:
    ///   - i18nKey: Localization text key
    ///   - variables: dictionary for interpolation
    /// - Returns: Localization text value or text key if value is not found
    public func getI18nStringValue(of i18nKey: String, with variables: [String:String]) -> String {
        let key = i18n.exists(i18nKey)
        if key {
            return i18n.t(i18nKey, variables: variables)
        } else {
            return i18nKey
        }
    }
}

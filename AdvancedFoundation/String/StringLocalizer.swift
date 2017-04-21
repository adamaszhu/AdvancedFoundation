/**
 * StringLocalizer localizes a string.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 15/04/2017
 */
public extension String {
    
    /**
     * The default localization file.
     */
    private static let defaultLocalizationFile = "Localizable"
    
    /**
     * Localize a string within the class using a localization file in the main bundle.
     * - parameter filename: The string file used to localize the string.
     * - returns: The localized string.
     */
    public func localize(withLocalizationFile filename: String = defaultLocalizationFile) -> String {
        return NSLocalizedString(self, tableName: filename, comment: "")
    }
    
    /**
     * Localize a string using the the class name as the localization file within the bundle of a class.
     * - parameter anyClass: The class used to find the localization file.
     * - returns: The localized string.
     */
    public func localize(forClass anyClass: AnyClass) -> String {
        let bundle = Bundle(for: anyClass)
        return NSLocalizedString(self, tableName: String(describing: anyClass), bundle: bundle, comment: "")
    }
    
    /**
     * Localize a string using the localization file as the class name within current framework.
     * - parameter anyType: Any structure or class used to find the localization file.
     * - returns: The localized string.
     */
    func localizeWithinFramework(forType anyType: Any) -> String {
        let bundle = Bundle(for: Logger.self)
        return NSLocalizedString(self, tableName: String(describing: anyType), bundle: bundle, comment: "")
    }
    
}

import Foundation


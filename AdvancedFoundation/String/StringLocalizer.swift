/**
 * StringLocalizer is used to localize a string within the class.
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
     * Localize a string within the class using the main bundle.
     * - parameter filename: The string file used to localize the string.
     * - returns: The localized string.
     */
    public func localize(withLocalizationFile filename: String = defaultLocalizationFile) -> String {
        return NSLocalizedString(self, tableName: filename, comment: "")
    }
    
    /**
     * Localize a string using the localization file as the class name within the bundle of a class.
     * - parameter objectClass: The class used to find the localization file.
     * - returns: The localized string.
     */
    public func localize(forClass objectClass: AnyClass) -> String {
        let bundle = Bundle(for: objectClass)
        return NSLocalizedString(self, tableName: String(describing: objectClass), bundle: bundle, comment: "")
    }
    
    /**
     * Localize a string using the localization file as the class name within current framework.
     * - parameter any: Any structure or class used to find the localization file.
     * - returns: The localized string.
     */
    func localizeWithinFramework(forAny any: Any) -> String {
        let bundle = Bundle(for: Logger.self)
        return NSLocalizedString(self, tableName: String(describing: any), bundle: bundle, comment: "")
    }
    
}

import Foundation


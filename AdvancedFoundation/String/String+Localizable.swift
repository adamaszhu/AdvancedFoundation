/// String+Localizable localizes a string.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 23/03/2019
public extension String {
    
    /// The default localization file.
    static let defaultLocalizationFilename = "Localizable"
    
    /// Localize a string within the class using a localization file in the main bundle.
    ///
    /// - Parameter filename: The string file used to localize the string.
    /// - Returns: The localized string.
    func localizedString(withLocalizationFile filename: String = defaultLocalizationFilename) -> String {
        NSLocalizedString(self, tableName: filename, comment: .empty)
    }
    
    /// Localize a string using the the class name as the localization file within the bundle of a class.
    ///
    /// - Parameter anyClass: The class used to find the localization file.
    /// - Returns: The localized string.
    func localizedString(for anyClass: AnyClass) -> String {
        let bundle = Bundle(for: anyClass)
        return NSLocalizedString(self, tableName: String(describing: anyClass), bundle: bundle, comment: .empty)
    }
    
    /// Localize a string using the localization file as the class name within current framework.
    ///
    /// - Parameter type: Any structure or class used to find the localization file.
    /// - Returns: The localized string.
    internal func localizedInternalString(forType type: Any) -> String {
        let bundle = Bundle(for: Logger.self)
        return NSLocalizedString(self, tableName: String(describing: type), bundle: bundle, comment: .empty)
    }
}

import Foundation

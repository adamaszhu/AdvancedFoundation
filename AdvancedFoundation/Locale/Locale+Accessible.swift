/// Access locales
///
/// - author: Adamas
/// - version: 1.10.0
/// - date: 11/08/2023
public extension Locale {

    /// Create a locale based on the language and region
    /// - Parameters:
    ///   - language: The language
    ///   - region: The region
    init(language: AdvancedFoundation.Language,
         region: AdvancedFoundation.Region) {
        let identifier = String(
            format: Self.identifierPattern,
            language.rawValue,
            region.rawValue)
        self.init(identifier: identifier)
    }

    /// Create a locale based on the language
    /// - Parameter language: The language
    init(language: AdvancedFoundation.Language) {
        let identifier = String(
            format: Self.identifierPattern,
            language.rawValue,
            language.defaultRegion.rawValue)
        self.init(identifier: identifier)
    }
}

/// Constants
private extension Locale {

    /// Standard
    static let identifierPattern = "%@_%@"
}

import Foundation

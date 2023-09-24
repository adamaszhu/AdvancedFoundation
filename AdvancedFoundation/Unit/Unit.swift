/// Unit defines what a unit should have
///
/// - author: Adamas
/// - version: 1.9.8
/// - date: 22/08/2023
public protocol Unit: CaseIterable {

    /// The key of a unit
    var key: String { get }
}

public extension Unit {

    /// The full name of the unit
    var name: String {
        key.localizedInternalString(forType: Self.self)
    }

    /// Plural name
    var pluralName: String {
        localizedString(withSuffix: Self.pluralKeySuffix)
    }

    /// The abbr of the unit
    var abbr: String {
        localizedString(withSuffix: Self.abbrKeySuffix)
    }

    /// The abbr plural of the unit
    var pluralAbbr: String {
        localizedString(withSuffix: Self.pluralAbbrKeySuffix)
    }

    /// Get a localized string with the provided key suffix.
    /// - Parameter suffix: The key suffix
    /// - Returns: The localized string. Default to name if no localized string is there
    private func localizedString(withSuffix suffix: String) -> String {
        let key = key + suffix
        let string = key.localizedInternalString(forType: (any Unit).self)
        return string == key ? name : string
    }
}

/// Constants
private extension Unit {
    static var pluralKeySuffix: String { "Plural" }
    static var abbrKeySuffix: String { "Abbr" }
    static var pluralAbbrKeySuffix: String { "PluralAbbr" }
}

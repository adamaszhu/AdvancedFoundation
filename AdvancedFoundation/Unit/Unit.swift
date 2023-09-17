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

    /// The abbr of the unit
    var abbr: String {
        (key + Self.abbrKeySuffix).localizedInternalString(forType: Self.self)
    }
}

/// Constants
private extension Unit {
    static var abbrKeySuffix: String { "Abbr" }
}

/// Currencies
///
/// - author: Adamas
/// - version: 1.9.10
/// - date: 02/09/2023
public enum Currency: String {
    case australianDollar
    case chineseYuan
    case dollar
}

public extension Currency {

    /// The name of the currency
    var name: String {
        rawValue.localizedInternalString(forType: Self.self)
    }

    /// The symbol of the currency
    var symbol: String {
        (rawValue + Self.symbolKeySuffix).localizedInternalString(forType: Self.self)
    }
}

/// Constants
private extension Currency {
    static var symbolKeySuffix: String { "Symbol" }
}

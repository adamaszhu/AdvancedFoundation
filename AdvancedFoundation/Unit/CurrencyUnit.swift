/// Currency units
///
/// - author: Adamas
/// - version: 1.9.8
/// - date: 22/08/2023
public enum CurrencyUnit: String {
    case australianDollar
    case chineseYuan
    case dollar
}

extension CurrencyUnit: Unit {

    public var key: String {
        rawValue
    }
}

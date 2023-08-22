/// Time units
///
/// - author: Adamas
/// - version: 1.9.8
/// - date: 22/08/2023
public enum TimeUnit: String {
    case millisecond
    case second
    case minute
    case hour
    case day
    case month
    case year
}

extension TimeUnit: Unit {

    public var key: String {
        rawValue
    }
}

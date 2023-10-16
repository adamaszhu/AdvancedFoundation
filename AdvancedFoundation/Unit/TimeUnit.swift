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

    public var minUnit: TimeUnit { .millisecond }

    public var standardUnit: (amount: Double, unit: TimeUnit) {
        switch self {
        case .millisecond:
            return (0.001, .second)
        case .second:
            return (1, .second)
        case .minute:
            return (60, .second)
        case .hour:
            return (60 * 60, .second)
        case .day:
            return (1, .day)
        case .month:
            return (30, .day)
        case .year:
            return (365, .day)
        }
    }

    public var key: String {
        rawValue
    }
}

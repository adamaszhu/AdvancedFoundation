/// Count units
///
/// - author: Adamas
/// - version: 1.9.8
/// - date: 22/08/2023
public enum CountUnit: String {
    case each
    case package
    case capsule
    case dose
    case can
    case bottle
    case tablet
}

extension CountUnit: Unit {

    public var equivalentMinUnit: (amount: Double, unit: CountUnit) {
        (1, self)
    }

    public var key: String {
        rawValue
    }
}

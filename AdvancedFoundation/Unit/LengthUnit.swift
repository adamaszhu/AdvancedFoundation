/// Length units
///
/// - author: Adamas
/// - version: 1.9.8
/// - date: 22/08/2023
public enum LengthUnit: String {
    case centimeter
    case meter
    case kilometer
}

extension LengthUnit: Unit {

    public var standardUnit: (amount: Double, unit: LengthUnit) {
        switch self {
        case .centimeter:
            return (0.01, .meter)
        case .meter:
            return (1, .meter)
        case .kilometer:
            return (1000, .meter)
        }
    }

    public var key: String {
        rawValue
    }
}

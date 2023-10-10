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

    public var equivalentMinUnit: (amount: Double, unit: LengthUnit) {
        switch self {
        case .centimeter:
            return (1, .centimeter)
        case .meter:
            return (100, .centimeter)
        case .kilometer:
            return (1000 * 100, .centimeter)
        }
    }

    public var key: String {
        rawValue
    }
}

/// Volume units
///
/// - author: Adamas
/// - version: 1.9.8
/// - date: 22/08/2023
public enum VolumeUnit: String {
    case milliliter
    case liter
}

extension VolumeUnit: Unit {

    public var standardUnit: (amount: Double, unit: VolumeUnit) {
        switch self {
        case .milliliter:
            return (0.001, .liter)
        case .liter:
            return (1, .liter)
        }
    }

    public var key: String {
        rawValue
    }
}

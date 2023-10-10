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

    public var equivalentMinUnit: (amount: Double, unit: VolumeUnit) {
        switch self {
        case .milliliter:
            return (1, .milliliter)
        case .liter:
            return (1000, .milliliter)
        }
    }

    public var key: String {
        rawValue
    }
}

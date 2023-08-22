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

    public var key: String {
        rawValue
    }
}

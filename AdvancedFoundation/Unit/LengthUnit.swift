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

    public var key: String {
        rawValue
    }
}

/// Weight units
///
/// - author: Adamas
/// - version: 1.9.8
/// - date: 22/08/2023
public enum WeightUnit: String {
    case gram
    case kilogram
}

extension WeightUnit: Unit {

    public var key: String {
        rawValue
    }
}

/// Count units
///
/// - author: Adamas
/// - version: 1.9.8
/// - date: 22/08/2023
public enum CountUnit: String {
    case each
    case package
}

extension CountUnit: Unit {

    public var key: String {
        rawValue
    }
}

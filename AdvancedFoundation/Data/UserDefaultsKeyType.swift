/// UserDefaultsKeyType defines the type of an user default managed attribute.
///
/// - author: Adamas
/// - version: 1.8.0
/// - date: 11/04/2022
public protocol UserDefaultsKeyType {

    associatedtype Value

    /// The user defaults key.
    var key: String { get }

    /// The default value of the attribute.
    var defaultValue: Value { get }
}

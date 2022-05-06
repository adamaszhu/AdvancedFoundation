/// The behaviors that a user default should confirm to.
///
/// - author: Adamas
/// - version: 1.8.0
/// - date: 11/04/2022
public protocol UserDefaultsType {

    /// Subscription
    ///
    /// - Parameter key: The key.
    /// - Returns: The value
    subscript<Value>(_: String) -> Value? { get set }

    /// Subscription
    ///
    /// - Parameter key: A user default key.
    /// - Returns: The value
    subscript<Key: UserDefaultsKeyType>(_: Key) -> Key.Value { get set }
}

/// UserDefaults+Accessable is used to provide convenient way to access user defaults.
///
/// - author: Adamas
/// - version: 1.8.0
/// - date: 11/04/2022
extension UserDefaults: UserDefaultsType {

    public subscript<Value>(_ key: String) -> Value? {
        get {
            object(forKey: key) as? Value
        }
        set {
            if let newValue = newValue {
                setValue(newValue, forKey: key)
            } else {
                removeObject(forKey: key)
            }
        }
    }

    public subscript<Key: UserDefaultsKeyType>(_ key: Key) -> Key.Value {
        get {
            let value: Key.Value? = self[key.key]
            return value ?? key.defaultValue
        }
        set {
            self[key.key] = newValue as Key.Value?
        }
    }
}

import Foundation

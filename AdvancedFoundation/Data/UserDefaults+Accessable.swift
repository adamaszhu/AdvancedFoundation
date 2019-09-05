/// UserDefaults+Accessable is used to provide convenient way to access user defaults.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 02/09/2019
public extension UserDefaults {
    
    /// Subscription
    ///
    /// - Parameter key: The key.
    /// - Returns: The value
    subscript<T>(key: String) -> T? {
        get {
            return object(forKey: key) as? T
        }
        set {
            setValue(newValue, forKey: key)
        }
    }
}

import Foundation

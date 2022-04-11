/// The action that a setting manager should confirm to.
///
/// - author: Adamas
/// - version: 1.8.0
/// - date: 11/04/2022
public protocol SettingManagerType {

    /// Subscription
    ///
    /// - Parameter key: A user default key.
    /// - Returns: The value
    subscript<Key: UserDefaultsKeyType>(_: Key) -> Key.Value { get set }

    /// Load the default setting values in a user defaults.
    /// - Parameters:
    ///   - bundle: The bundle where the setting plist file is.
    ///   - userDefaults: The user defaults that should accept the default setting values.
    /// - Returns: Result of the loading action.
    static func loadDefaultSettings(from bundle: Bundle,
                                    into userDefaults: UserDefaults) -> Bool
}

/// SettingManager provides the access to the app setting menu.
///
/// - author: Adamas
/// - version: 1.8.0
/// - date: 11/04/2022
public final class SettingManager: SettingManagerType {

    /// The user defaults object.
    private var userDefaults: UserDefaultsType

    /// Create a setting manager using a user defaults.
    /// - Parameter userDefaults: The user defaults object to be used.
    public init(userDefaults: UserDefaultsType) {
        self.userDefaults = userDefaults
    }

    public subscript<Key: UserDefaultsKeyType>(_ key: Key) -> Key.Value {
        get {
            userDefaults[key]
        }
        set {
            userDefaults[key] = newValue
        }
    }

    public static func loadDefaultSettings(from bundle: Bundle,
                                           into userDefaults: UserDefaults) -> Bool {
        guard let url = bundle.url(forResource: settingFileName,
                                   withExtension: settingFileExtension,
                                   subdirectory: settingFileBundle),
            let plist = NSDictionary(contentsOf: url) as? [String: Any],
            let preferences = plist[Self.preferenceSpecifiersKey] as? [[String: Any]] else {
            return false
        }
        preferences.forEach { preference in
            if let key = preference[valueNamekey] as? String,
                let value = preference[defaultValueKey],
                userDefaults.value(forKey: key) == nil {
                userDefaults[key] = value
            }
        }
        return true
    }
}

/// Constants
private extension SettingManager {

    /// The root key of a setting item.
    static let valueNamekey = "Key"

    /// The default value key of a setting item.
    static let defaultValueKey = "DefaultValue"

    /// The key for all preference items.
    static let preferenceSpecifiersKey = "PreferenceSpecifiers"

    /// The name of the setting menu file.
    static let settingFileName = "Root"

    /// The suffix of the setting menu file.
    static let settingFileExtension = "plist"

    /// The path from the setting bundle to the plist file.
    static let settingFileBundle = "Settings.bundle"
}

import Foundation

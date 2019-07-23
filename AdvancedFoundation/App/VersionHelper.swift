/// VersionHelper compares the version of the app. The version should be as the format of 1.2.3 where the first number will be changed if the style of the application is changed, the second number will be changed if some main functions are changed and the third number will be changed whenever errors or functions are fixed or changed.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 23/03/2019
final class VersionHelper {
    
    /// The shared helper that presents current version. It will be nil if the version cannot be retrieved.
    public static let shared: VersionHelper? = {
        let appInfoAccessor = AppInfoAccessor.shared
        guard let version = appInfoAccessor.version, let bundleName = appInfoAccessor.bundleName else {
            return nil
        }
        return VersionHelper(version: version, versionFlag: "\(VersionHelper.versionFlagPrefix)\(bundleName)")
    }()
    
    /// Return the grand version number.
    public var grandVersion: Int? {
        return VersionHelper.versionComponents(inVersion: version)?.first
    }
    
    /// Whether current version flag has been settled in the user default or not.
    public var hasVersionFlag: Bool {
        guard let storedVersion = userDefaults.string(forKey: versionFlag) else {
            return false
        }
        return storedVersion == version
    }
    
    /// The version binded to the helper.
    private let version: String
    
    /// The flag used to identify whether the version is newly installed or not.
    private let versionFlag: String
    
    /// The UserDefaults used to store the flag.
    private let userDefaults: UserDefaults
    
    /// Compare current version to the given version.
    ///
    /// - Parameter version: The given version.
    /// - Returns: 1 if current version is larger. 0 if current version equals the given version. -1 if current version is smaller. nil if there has been an error. Nil will be returned if one of the versions is not formatted.
    public func compareCurrentVersion(toVersion version: String) -> Int? {
        return VersionHelper.compareVersion(self.version, toVersion: version)
    }
    
    /// Create current version flag in the user default, indicating that current version has been opened once.
    public func createVersionFlag() {
        userDefaults.setValue(version, forKey: versionFlag)
    }
    
    /// Delete current version flag in the user default.
    public func deleteVersionFlag() {
        userDefaults.removeObject(forKey: versionFlag)
        userDefaults.synchronize()
    }
    
    /// Initialize the helper.
    ///
    /// - Parameters:
    ///   - version: The version binded to the helper.
    ///   - versionFlag: The flag used to identify whether the version has been launched before or not.
    ///   - userDefaults: The UserDefaults used to store the flag.
    init?(version: String, versionFlag: String, userDefaults: UserDefaults = UserDefaults.standard) {
        guard VersionHelper.versionComponents(inVersion: version) != nil else {
            return nil
        }
        self.userDefaults = userDefaults
        self.version = version
        self.versionFlag = versionFlag
    }
    
    /// Parse version numbers from the given version string. Such as converting "1.0" to [1,0] or "1.0.3.0" to [1,0,3,0].
    ///
    /// - Parameter version: The version string.
    /// - Returns: An array containing integer version numbers. Nil will be returned if the version is not formatted.
    private static func versionComponents(inVersion version: String) -> [Int]? {
        let versionComponents = version.components(separatedBy: VersionHelper.versionSeperator)
        var parsedVersionComponents = [Int]()
        for versionComponent in versionComponents {
            guard let parsedVersionComponent = Int(versionComponent) else {
                Logger.standard.logError(VersionHelper.versionFormatError, withDetail: version)
                return nil
            }
            parsedVersionComponents.append(parsedVersionComponent)
        }
        return parsedVersionComponents
    }
    
    /// Compare two versions.
    ///
    /// - Parameters:
    ///   - firstVersion: The first version.
    ///   - secondVersion: The second version.
    /// - Returns: 1 if the first version is larger. 0 if versions equals to each other. -1 if the first version is smaller. nil if one of the versions is not correct. Nil will be returned if one of the versions is not formatted.
    private static func compareVersion(_ firstVersion: String, toVersion secondVersion: String) -> Int? {
        guard var firstVersionComponents = versionComponents(inVersion: firstVersion), var secondVersionComponents = versionComponents(inVersion: secondVersion) else {
            return nil
        }
        // Make the component amount of two list to be equal.
        while firstVersionComponents.count > secondVersionComponents.count {
            secondVersionComponents.append(0)
        }
        while firstVersionComponents.count < secondVersionComponents.count {
            firstVersionComponents.append(0)
        }
        for index in 0 ..< firstVersionComponents.count {
            if firstVersionComponents[index] < secondVersionComponents[index] {
                return -1
            }
            if firstVersionComponents[index] > secondVersionComponents[index] {
                return 1
            }
        }
        return 0
    }
}

/// Constants
private extension VersionHelper {
    
    /// The prefix of the version flag to be saved.
    static let versionFlagPrefix = "v"
    static let versionSeperator = "."
    
    /// System error.
    static let versionFormatError = "The version is not well formatted."
}

import Foundation


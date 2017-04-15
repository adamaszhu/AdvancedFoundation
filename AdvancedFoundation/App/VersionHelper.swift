/**
 * VersionHelper is used to compare the version of the app. The version should be as the format of 1.2.3 where the first number will be changed if the style of the application is changed, the second number will be changed if some main functions are changed and the third number will be changed whenever errors or functions are fixed or changed.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 12/04/2017
 */
public class VersionHelper: AnyObject {
    
    /**
     * The default helper that presents current version. It will be nil if the version cannot be retrieved.
     */
    public static let standard: VersionHelper? = {
        if AppInfo.version == nil {
            return nil
        }
        return VersionHelper(forVersion: AppInfo.version!)
    }()

    /**
     * The key format settled in the default user, which is used to identify whether the version is newly installed or not.
     */
    private static let versionKeyPattern = "v%@"
    
    /**
     * System error.
     */
    private static let versionFormatError = "The version is not well formatted."

    /**
     * The version binded to the helper.
     */
    private var version: String
    
    /**
     * Initialize the helper.
     * - parameter version: The version binded to the helper.
     */
    public init(forVersion version: String) {
        self.version = version
    }

    /**
     * Compare current version to the given version.
     * - parameter version: The given version.
     * - returns: 1 if current version is larger. 0 if current version equals the given version. -1 if current version is smaller. nil if there has been an error. Nil will be returned if one of the versions is not formatted.
     */
    public func compareToVersion(_ version: String) -> Int? {
        return VersionHelper.compareVersion(self.version, toVersion: version)
    }

    /**
     * Check whether current version flag has been settled in the user default or not.
     * - returns: Whether the flag has been settled or not. Nil will be returned if the flag cannot be created.
     */
    public func checkVersionFlag() -> Bool? {
        let userDefaults = UserDefaults.standard
        if AppInfo.bundleName == nil {
            return nil
        }
        let versionKey = String(format: VersionHelper.versionKeyPattern, AppInfo.bundleName!)
        let storedAppVersion = userDefaults.string(forKey: versionKey)
        if storedAppVersion == nil {
            return false
        }
        return storedAppVersion == version
    }
    
    /**
     * Create current version flag in the user default, indicating that current version has been opened once.
     */
    public func createVersionFlag() {
        let userDefaults = UserDefaults.standard
        if AppInfo.bundleName == nil {
            return
        }
        let versionKey = String(format: VersionHelper.versionKeyPattern, AppInfo.bundleName!)
        userDefaults.setValue(version, forKey: versionKey)
    }
    
    /**
     * Delete current version flag in the user default.
     */
    public func deleteVersionFlag() {
        let userDefaults = UserDefaults.standard
        if AppInfo.bundleName == nil {
            return
        }
        let versionKey = String(format: VersionHelper.versionKeyPattern, AppInfo.bundleName!)
        userDefaults.removeObject(forKey: versionKey)
        userDefaults.synchronize()
    }
    
    /**
     * Parse version numbers from the given version string. Such as converting "1.0" to [1,0] or "1.0.3.0" to [1,0,3,0].
     * - parameter version: The version string.
     * - returns: An array containing integer version numbers. Nil will be returned if the version is not formatted.
     */
    private static func parseVersion(_ version: String) -> Array<Int>? {
        let versionComponents = version.components(separatedBy: ".")
        var parsedVersionComponents = Array<Int>()
        var parsedVersionComponent: Int?
        for versionComponent in versionComponents {
            parsedVersionComponent = Int(versionComponent)
            if parsedVersionComponent == nil {
                Logger.logError(versionFormatError, withDetail: version)
                return nil
            }
            parsedVersionComponents.append(parsedVersionComponent!)
        }
        return parsedVersionComponents
    }
    
    /**
     * Compare two versions.
     * - parameter version: The given version.
     * - returns: 1 if the first version is larger. 0 if versions equals to each other. -1 if the first version is smaller. nil if one of the versions is not correct. Nil will be returned if one of the versions is not formatted.
     */
    private static func compareVersion(_ firstVersion: String, toVersion secondVersion: String) -> Int? {
        var firstVersionComponents = parseVersion(firstVersion)
        var secondVersionComponents = parseVersion(secondVersion)
        if (firstVersionComponents == nil) || (secondVersionComponents == nil) {
            return nil
        }
        // COMMENT: Make the component amount of two list to be equal.
        while firstVersionComponents!.count > secondVersionComponents!.count {
            secondVersionComponents!.append(0)
        }
        while firstVersionComponents!.count < secondVersionComponents!.count {
            firstVersionComponents!.append(0)
        }
        for index in 0 ..< firstVersionComponents!.count {
            if firstVersionComponents![index] < secondVersionComponents![index] {
                return -1
            }
            if firstVersionComponents![index] > secondVersionComponents![index] {
                return 1
            }
        }
        return 0
    }
    
}

import Foundation


/**
 * AppInfoAccessor provides the information about the app.
 * - author: Adamas
 * - version: 1.0.1
 * - date: 12/04/2017
 */
public class AppInfoAccessor {
    
    /**
     * The singleton instance in the system.
     */
    public static let shared: AppInfoAccessor = AppInfoAccessor()
    
    /**
     * System error.
     */
    private static let bundleNameError = "The bundle name cannot be retrieved."
    private static let currentVersionError = "The version cannot be retrieved."
    
    /**
     * Dictionary key.
     */
    private static let bundleNameKey = "CFBundleName"
    private static let versionKey = "CFBundleShortVersionString"
    
    /**
     * The name of current bundle. It will be nil if the bundle name cannot be retireved.
     */
    public var bundleName: String? {
        guard let name = bundle.infoDictionary?[AppInfoAccessor.bundleNameKey] as? String else {
            Logger.standard.logError(AppInfoAccessor.bundleNameError)
            return nil
        }
        return name
    }
    
    /**
     * The short version string of the app, which is like "1.2.3". It will be nil if the version cannot be retrieved.
     */
    public var version: String? {
        guard let version = bundle.infoDictionary?[AppInfoAccessor.versionKey] as? String else {
            Logger.standard.logError(AppInfoAccessor.currentVersionError)
            return nil
        }
        return version
    }
    
    /**
     * The bundle of the app.
     */
    private let bundle: Bundle
    
    /**
     * Don't allow the class to be instanced.
     */
    init(bundle: Bundle = Bundle.main) {
        self.bundle = bundle
    }
    
}

import Foundation


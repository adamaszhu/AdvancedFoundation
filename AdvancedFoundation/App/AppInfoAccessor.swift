/**
 * AppInfoAccessor provides the information about the app.
 * - author: Adamas
 * - version: 1.0.0
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
    private let bundleNameError = "The bundle name cannot be retrieved."
    private let currentVersionError = "The version cannot be retrieved."
    
    /**
     * Dictionary key.
     */
    private let bundleNameKey = "CFBundleName"
    private let versionKey = "CFBundleShortVersionString"
    
    /**
     * The name of current bundle. It will be nil if the bundle name cannot be retireved.
     */
    public var bundleName: String? {
        guard let name = bundle.infoDictionary?[bundleNameKey] as? String else {
            Logger.standard.logError(bundleNameError)
            return nil
        }
        return name
    }
    
    /**
     * The short version string of the app, which is like "1.2.3". It will be nil if the version cannot be retrieved.
     */
    public var version: String? {
        guard let version = bundle.infoDictionary?[versionKey] as? String else {
            Logger.standard.logError(currentVersionError)
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


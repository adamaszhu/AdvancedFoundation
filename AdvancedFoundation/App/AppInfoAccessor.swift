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
    public let bundleName: String? = {
        let bundle = Bundle.main
        guard let name = bundle.infoDictionary?[bundleNameKey] as? String else {
            Logger.standard.logError(bundleNameError)
            return nil
        }
        return name
    }()
    
    /**
     * The short version string of the app, which is like "1.2.3". It will be nil if the version cannot be retrieved.
     */
    public let version: String? = {
        let bundle = Bundle.main
        guard let version = bundle.infoDictionary?[versionKey] as? String else {
            Logger.standard.logError(currentVersionError)
            return nil
        }
        return version
    }()
    
    /**
     * Don't allow the class to be instanced.
     */
    private init() { }
    
}

import Foundation


/**
 * AppInfo provide the information about the app.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 12/04/2017
 */
public class AppInfo {
    
    /**
     * System error.
     */
    private static let bundleNameError = "The bundle name cannot be retrieved."
    private static let currentVersionError = "The version cannot be retrieved."

    /**
     * The name of current bundle. It will be nil if the bundle name cannot be retireved.
     */
    public static let bundleName: String? = {
        let bundle = Bundle.main
        let name = bundle.infoDictionary?["CFBundleName"] as? String
        if name == nil {
            Logger.logError(bundleNameError)
        }
        return name
    }()

    /**
     * The short version string of the app, which is like "1.2.3". It will be nil if the version cannot be retrieved.
     */
    public static let version: String? = {
        let bundle = Bundle.main
        let version = bundle.infoDictionary?["CFBundleShortVersionString"] as? String
        if version == nil {
            Logger.logError(currentVersionError)
        }
        return version
    }()
    
}

import Foundation

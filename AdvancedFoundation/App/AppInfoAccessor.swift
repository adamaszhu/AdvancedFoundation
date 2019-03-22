/// AppInfoAccessor provides the information about the app.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 23/03/2019
open class AppInfoAccessor {
    
    /// The singleton instance in the system.
    public static let shared = AppInfoAccessor()
    
    /// The name of current bundle. It will be nil if the bundle name cannot be retireved.
    public var bundleName: String? {
        guard let name = bundle.infoDictionary?[AppInfoAccessor.bundleNameKey] as? String else {
            Logger.standard.log(error: AppInfoAccessor.bundleNameError)
            return nil
        }
        return name
    }
    
    /// The name being displayed in the device. It will be nil if the display name cannot be retireved.
    public var displayName: String? {
        guard let name = bundle.infoDictionary?[AppInfoAccessor.displayNameKey] as? String else {
            Logger.standard.log(error: AppInfoAccessor.displayNameError)
            return nil
        }
        return name
    }
    
    /// The short version string of the app, which is like "1.2.3". It will be nil if the version cannot be retrieved.
    public var version: String? {
        guard let version = bundle.infoDictionary?[AppInfoAccessor.versionKey] as? String else {
            Logger.standard.log(error: AppInfoAccessor.currentVersionError)
            return nil
        }
        return version
    }
    
    /// The build number of the app, which is anything defined by the user. It will be nil if the build number cannot be retrieved.
    public var buildNumber: String? {
        guard let buildNumber = bundle.infoDictionary?[kCFBundleVersionKey as String] as? String else {
            Logger.standard.log(error: AppInfoAccessor.buildNumberError)
            return nil
        }
        return buildNumber
    }
    
    /// The preferred language.
    public var preferredLanguage: String? {
        guard let preferredLocale = Locale.preferredLanguages.first else {
            return nil
        }
        // 3 includes the dash and two charactors country code
        return String(preferredLocale.dropLast(3))
    }
    
    /// The current region.
    public var region: String? {
        guard let preferredLocale = Locale.preferredLanguages.first else {
            return nil
        }
        return preferredLocale.components(separatedBy: String.dash).last
    }
    
    /// The bundle of the app.
    private let bundle: Bundle
    
    /// The initializer.
    ///
    /// - Parameter bundle: The bundle of the app.
    init(bundle: Bundle = Bundle.main) {
        self.bundle = bundle
    }
}

/// Constants
private extension AppInfoAccessor {
    
    /// System errors.
    static let bundleNameError = "The bundle name cannot be retrieved."
    static let displayNameError = "The display name cannot be retrieved."
    static let currentVersionError = "The version cannot be retrieved."
    static let buildNumberError = "The build number cannot be retrieved."
    
    /// Dictionary keys.
    static let bundleNameKey = "CFBundleName"
    static let displayNameKey = "CFBundleDisplayName"
    static let versionKey = "CFBundleShortVersionString"
}

import Foundation


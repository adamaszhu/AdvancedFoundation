/// Bundle+Accessable retrieves the current bundle
///
/// - author: Adamas
/// - version: 1.9.2
/// - date: 27/03/2023
extension Bundle {

    /// Returns the resource bundle associated with the current Swift module.
    static var current: Bundle = {

        let candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,

            // Bundle should be present here when the package is linked into a framework.
            Bundle(for: BundleFinder.self).resourceURL,

            // For command-line tools.
            Bundle.main.bundleURL,
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + bundleSuffix)
            if let bundle = bundlePath.flatMap(Bundle.init) {
                return bundle
            }
        }
        return Bundle(for: BundleFinder.self)
    }()
}

/// Constants
private extension Bundle {
    static var bundleName: String { "AdvancedFoundation_AdvancedFoundation" }
    static var bundleSuffix: String { ".bundle" }
}

/// Class used to find the bundle
private class BundleFinder {}

import Foundation

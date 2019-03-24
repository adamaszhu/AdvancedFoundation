/// Bundle+Localizable defines the swizzling method for changing language.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 23/03/2019
public extension Bundle {
    
    /// The language that all resources should use.
    public static var currentLanguage = AppInfoAccessor.shared.preferredLanguage
    
    /// Swizzle the localizeString method
    public static func switchLanguage() {
        let originSelector = #selector(localizedString(forKey:value:table:))
        let targetSelector = #selector(dynamicLocalizedString(forKey:value:table:))
        guard let originMethod = class_getInstanceMethod(Bundle.self, originSelector), let targetMethod = class_getInstanceMethod(Bundle.self, targetSelector) else {
            Logger.standard.logError(Bundle.swizzleMethodError)
            return
        }
        method_exchangeImplementations(originMethod, targetMethod);
    }
    
    /// The method used to replace localizeString
    @objc private func dynamicLocalizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        var bundle: Bundle?
        if let path = Bundle.main.path(forResource: Bundle.currentLanguage, ofType: Bundle.projectType) {
            bundle = Bundle(path: path)
        } else if let path = Bundle.main.path(forResource: Bundle.baseProject, ofType: Bundle.projectType) {
            bundle = Bundle(path: path)
        }
        return bundle?.dynamicLocalizedString(forKey: key, value: value, table: tableName) ?? key
    }
}

/// Constants
private extension Bundle {
    
    /// Project constants
    static let baseProject = "Base"
    static let projectType = "lproj"
    
    /// System errors.
    static let swizzleMethodError = "Bundle function localizedString cannot be swizzled."
}

import Foundation

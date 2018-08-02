/// Bundle+Localizable defines the swizzling method for changing language.
///
/// - author: Adamas
/// - version: 1.4.0
/// - date: 02/08/2018
public extension Bundle {
    
    /// The language that all resources should use.
    public static var currentLanguage = AppInfoAccessor.shared.preferredLanguage
    
    /// Project constants
    private static let baseProject = "Base"
    private static let projectType = "lproj"
    
    /// System errors.
    private static let swizzleMethodError = "Bundle function localizedString cannot be swizzled."
    
    /// Swizzle the localizeString method
    public static func supportLanguageSwitching() {
        let originSelector = #selector(localizedString(forKey:value:table:))
        let targetSelector = #selector(dynamicLocalizedString(forKey:value:table:))
        guard let originMethod = class_getInstanceMethod(Bundle.self, originSelector), let targetMethod = class_getInstanceMethod(Bundle.self, targetSelector) else {
            Logger.standard.log(error: Bundle.swizzleMethodError)
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

import Foundation

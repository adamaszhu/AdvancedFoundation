/// URL+Accessible provides additional supports towards web urls.
///
/// - version: 1.6.0
/// - date: 16/09/2019
/// - author: Adamas
public extension URL {
    
    /// URL parameters
    var parameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems else {
            return nil
        }
        return queryItems.reduce(into: [String: String]()) { result, item in
            result[item.name] = item.value
        }
    }
}

import Foundation

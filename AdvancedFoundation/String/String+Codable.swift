/// Encode strings.
///
/// - author: Adamas
/// - version: 1.8.0
/// - date: 29/04/2022
public extension String {

    /// Base 64 encoded string.
    var base64EncodedString: String? {
        data(using: .utf8)?.base64EncodedString()
    }

    /// URL encoded string.
    var urlEncodedString: String? {
        var characterSet = CharacterSet.urlQueryAllowed
        characterSet.remove(charactersIn: Self.urlSupportedCharacters)
        return addingPercentEncoding(withAllowedCharacters: characterSet)
    }
}

/// Constants
private extension String {

    /// Enabled url characters
    static let urlSupportedCharacters = "!*'();:@&=+$,/?%#[]"
}

import Foundation

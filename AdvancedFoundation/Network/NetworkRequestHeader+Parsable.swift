/// NetworkRequestHeader+Parsable converts the request header to a dictionary.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 02/04/2019
extension NetworkRequestHeader {
    
    /// Convert the header to a dictionary.
    var dictionary: [String: String] {
        var dictionary = [String: String]()
        if let ifModifiedSince = ifModifiedSince {
            dictionary[NetworkRequestHeader.ifModifiedSinceHeader] = ifModifiedSince
        }
        if let ifNoneMatch = ifNoneMatch {
            dictionary[NetworkRequestHeader.ifNoneMatchHeader] = ifNoneMatch
        }
        if let contentType = contentType {
            dictionary[NetworkRequestHeader.contentTypeHeader] = contentType
        }
        if let contentLength = contentLength {
            dictionary[NetworkRequestHeader.contentLengthHeader] = String(contentLength)
        }
        return dictionary
    }
}

/// Constants
private extension NetworkRequestHeader {
    
    /// All header keys.
    static let ifModifiedSinceHeader = "If-Modified-Since"
    static let ifNoneMatchHeader = "If-None-Match"
    static let contentTypeHeader = "Content-Type"
    static let contentLengthHeader = "Content-Length"
}

import Foundation

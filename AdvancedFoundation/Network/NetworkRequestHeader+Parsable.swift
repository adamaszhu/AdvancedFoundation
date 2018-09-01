/// NetworkRequestHeader+Parsable converts the request header to a dictionary.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 13/07/2017
extension NetworkRequestHeader {
    
    /// All header keys.
    private static let ifModifiedSinceHeader = "If-Modified-Since"
    private static let ifNoneMatchHeader = "If-None-Match"
    private static let contentTypeHeader = "Content-Type"
    private static let contentLengthHeader = "Content-Length"
    
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

import Foundation

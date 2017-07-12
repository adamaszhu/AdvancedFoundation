/**
 * NetworkRequestHeader+Parser converts the request header to a dictionary.
 * - author: Adamas
 /// - version: 1.1.0
 /// - date: 13/07/2017
 */
extension NetworkRequestHeader {
    
    /**
     * All header keys.
     */
    private static let ifModifiedSinceHeader = "If-Modified-Since"
    private static let ifNoneMatchHeader = "If-None-Match"
    private static let contentTypeHeader = "Content-Type"
    private static let contentLengthHeader = "Content-Length"
    
    /**
     * Convert the header to a dictionary.
     * - returns: The dictionary
     */
    func convertToDictionary() -> Dictionary<String, String> {
        var dictionary = Dictionary<String, String>()
        if ifModifiedSince != nil {
            dictionary[NetworkRequestHeader.ifModifiedSinceHeader] = ifModifiedSince!
        }
        if ifNoneMatch != nil {
            dictionary[NetworkRequestHeader.ifNoneMatchHeader] = ifNoneMatch!
        }
        if contentType != nil {
            dictionary[NetworkRequestHeader.contentTypeHeader] = contentType!
        }
        if contentLength != nil {
            dictionary[NetworkRequestHeader.contentLengthHeader] = String(contentLength!)
        }
        return dictionary
    }
    
}

import Foundation

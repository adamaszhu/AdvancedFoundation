/**
 * NetworkRequestHeader+Parser converts the request header to a dictionary.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 07/05/2017
 */
extension NetworkRequestHeader {
    
    /**
     * All header keys.
     */
    private static let ifModifiedSinceHeader = "If-Modified-Since"
    private static let ifNoneMatchHeader = "If-None-Match"
    private static let contentTypeHeader = "Content-Type"
    
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
        return dictionary
    }
    
}

import Foundation

/**
 * NetworkRequestHeader includes the header information in a network request.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 05/05/2017
 */
public struct NetworkRequestHeader {
    
    var ifModifiedSince: String?
    var ifNoneMatch: String?
    var contentType: String?
    
    /**
     * Initialize the structure.
     * - parameter ifModifiedSince: The last date that the data has been modified on the server.
     * - parameter ifNoneMatch: If the tag doesn't match.
     * - parameter contentType: The type of the body.
     */
    public init(ifModifiedSince: String? = nil, ifNoneMatch: String? = nil, contentType: String? = nil) {
        self.ifModifiedSince = ifModifiedSince
        self.ifNoneMatch = ifNoneMatch
        self.contentType = contentType
    }
    
}

import Foundation

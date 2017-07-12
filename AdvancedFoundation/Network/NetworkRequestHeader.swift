/**
 * NetworkRequestHeader includes the header information in a network request.
 * - author: Adamas
 /// - version: 1.1.0
 /// - date: 13/07/2017
 */
public struct NetworkRequestHeader {
    
    /**
     * Whether the resource has been modified after this date, it should be retrieved from lastModified property of a response.
     */
    var ifModifiedSince: String?
    
    /**
     * Whether the resource has a specific tag or not, it should be retrieved from eTag property of a response.
     */
    var ifNoneMatch: String?
    
    /**
     * The type of the request content.
     */
    var contentType: String?
    
    /**
     * The content length of the request content.
     */
    var contentLength: Int?
    
    /**
     * Initialize the structure.
     * - parameter ifModifiedSince: The last date that the data has been modified on the server.
     * - parameter ifNoneMatch: If the tag doesn't match.
     * - parameter contentType: The type of the body.
     * - parameter contentLength: The length of the content.
     */
    public init(ifModifiedSince: String? = nil, ifNoneMatch: String? = nil, contentType: String? = nil, contentLength: Int? = nil) {
        self.ifModifiedSince = ifModifiedSince
        self.ifNoneMatch = ifNoneMatch
        self.contentType = contentType
        self.contentLength = contentLength
    }
    
}

import Foundation

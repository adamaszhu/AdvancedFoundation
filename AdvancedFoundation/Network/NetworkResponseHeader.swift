/**
 * NetworkResponseHeader includes the header information in a network response.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 05/05/2017
 */
public struct NetworkResponseHeader {
    
    /**
     * The content type of the response.
     */
    let contentType: String?
    
    /**
     * The content length of the response.
     */
    let contentLength: Int?
    
    /**
     * The data that the resource is modified, it is only obtainable if the server apply HTTP cache mechanism.
     */
    let lastModified: String?
    
    /**
     * The tag of the resource, it is only obtainable if the server apply HTTP cache mechanism.
     */
    let eTag: String?
    
    /**
     * Initialize the structure.
     * - parameter contentType: The content type of the HTTP body.
     * - parameter contentLength: The length of the HTTP body.
     * - parameter lastModified: Support the HTTP cache, which is the date of the modified timestamp.
     * - parameter eTag: The tag recorded about the responsed data.
     */
    init(contentType: String? = nil, contentLength: Int? = nil, lastModified: String? = nil, eTag: String? = nil) {
        self.contentType = contentType
        self.contentLength = contentLength
        self.lastModified = lastModified
        self.eTag = eTag
    }
    
}

import Foundation

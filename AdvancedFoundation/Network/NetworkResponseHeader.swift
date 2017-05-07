/**
 * NetworkResponseHeader includes the header information in a network response.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 05/05/2017
 */
public struct NetworkResponseHeader {
    
    let contentType: String
    let contentLength: String
    let lastModified: String?
    let eTag: String?
    
    /**
     * Initialize the structure.
     * - parameter contentType: The content type of the HTTP body.
     * - parameter contentLength: The length of the HTTP body.
     * - parameter lastModified: Support the HTTP cache, which is the date of the modified timestamp.
     * - parameter eTag: The tag recorded about the responsed data.
     */
    init(contentType: String, contentLength: String, lastModified: String? = nil, eTag: String? = nil) {
        self.contentType = contentType
        self.contentLength = contentLength
        self.lastModified = lastModified
        self.eTag = eTag
    }
    
}

import Foundation

/**
 * NetworkRequestHeader includes the header information in a network call.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 05/05/2017
 */
struct NetworkRequestHeader {
    
    let contentType: String = "Content-Type"
    let contentLength: String = "Content-Length"
    let lastModified: String = "Last-Modified"
    let eTag: String = "ETag"
    let ifModifiedSince: String = "If-Modified-Since"
    let ifNoneMatch: String = "If-None-Match"
    
    func toSomething() {
        // TODO: Implement this function
    }
}

import Foundation

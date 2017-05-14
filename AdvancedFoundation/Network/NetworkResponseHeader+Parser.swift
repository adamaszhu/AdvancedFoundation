/**
 * NetworkResponseHeader+Parser parses the header information in a response.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 07/05/2017
 */
extension NetworkResponseHeader {
    
    /**
     * All header keys.
     */
    private static let contentTypeHeader = "Content-Type"
    private static let contentLengthHeader = "Content-Length"
    private static let lastModifiedHeader = "Last-Modified"
    private static let eTagHeader = "Etag"
    
    /**
     * Parse the header of a url response.
     * - parameter response: The response.
     * - returns: The parsed header. Nil if the response is not a HTTP response.
     */
    public static func parse(_ response: URLResponse) -> NetworkResponseHeader? {
        guard let httpResponse = response as? HTTPURLResponse else {
            return nil
        }
        guard let contentType = httpResponse.allHeaderFields[NetworkResponseHeader.contentTypeHeader] as? String else {
            return nil
        }
        guard let contentLengthString = httpResponse.allHeaderFields[NetworkResponseHeader.contentLengthHeader] as? String else {
            return nil
        }
        guard let contentLength = Int(contentLengthString) else {
            return nil
        }
        let lastModified = httpResponse.allHeaderFields[NetworkResponseHeader.lastModifiedHeader] as? String
        let eTag = httpResponse.allHeaderFields[NetworkResponseHeader.eTagHeader] as? String
        return NetworkResponseHeader(contentType: contentType, contentLength: contentLength, lastModified: lastModified, eTag: eTag)
    }
    
}

import Foundation

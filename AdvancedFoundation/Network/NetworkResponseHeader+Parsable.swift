/// NetworkResponseHeader+Parsable parses the header information in a response.
///
/// - author: Adamas
/// - version: 1.1.8
/// - date: 08/12/2017
extension NetworkResponseHeader {
    
    /// All header keys.
    private static let contentTypeHeader = "Content-Type"
    private static let contentLengthHeader = "Content-Length"
    private static let lastModifiedHeader = "Last-Modified"
    private static let eTagHeader = "Etag"
    
    /// Error Message.
    private static let responseTypeError = "The response type is incorrect."
    
    /// Parse the header of a url response.
    ///
    /// - Parameter response: The response.
    init?(response: URLResponse) {
        guard let httpResponse = response as? HTTPURLResponse else {
            Logger.standard.logError(NetworkResponseHeader.responseTypeError)
            return nil
        }
        let contentType = httpResponse.allHeaderFields[NetworkResponseHeader.contentTypeHeader] as? String
        var contentLength: Int?
        if let contentLengthString = httpResponse.allHeaderFields[NetworkResponseHeader.contentLengthHeader] as? String {
            contentLength = Int(contentLengthString)
        }
        let lastModified = httpResponse.allHeaderFields[NetworkResponseHeader.lastModifiedHeader] as? String
        let eTag = httpResponse.allHeaderFields[NetworkResponseHeader.eTagHeader] as? String
        self.init(contentType: contentType, contentLength: contentLength, lastModified: lastModified, eTag: eTag)
    }
    
}

import Foundation

/// NetworkResponseHeader+Parsable parses the header information in a response.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 02/04/2019
extension NetworkResponseHeader {
    
    /// Parse the header of a url response.
    ///
    /// - Parameter response: The response.
    init?(response: URLResponse) {
        guard let httpResponse = response as? HTTPURLResponse else {
            Logger.standard.logError(Self.responseTypeError)
            return nil
        }
        let contentType = httpResponse.allHeaderFields[Self.contentTypeHeader] as? String
        var contentLength: Int?
        if let contentLengthString = httpResponse.allHeaderFields[Self.contentLengthHeader] as? String {
            contentLength = Int(contentLengthString)
        }
        let lastModified = httpResponse.allHeaderFields[Self.lastModifiedHeader] as? String
        let eTag = httpResponse.allHeaderFields[Self.eTagHeader] as? String
        self.init(contentType: contentType,
                  contentLength: contentLength,
                  lastModified: lastModified,
                  eTag: eTag)
    }
}

/// Constants 
private extension NetworkResponseHeader {
    
    /// All header keys.
    static let contentTypeHeader = "Content-Type"
    static let contentLengthHeader = "Content-Length"
    static let lastModifiedHeader = "Last-Modified"
    static let eTagHeader = "Etag"
    
    /// Error Message.
    static let responseTypeError = "The response type is incorrect."
}

import Foundation

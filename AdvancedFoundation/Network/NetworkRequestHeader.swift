/// NetworkRequestHeader includes the header information in a network request.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 02/04/2019
public struct NetworkRequestHeader {
    
    /// Whether the resource has been modified after this date, it should be retrieved from lastModified property of a response.
    var ifModifiedSince: String?
    
    /// Whether the resource has a specific tag or not, it should be retrieved from eTag property of a response.
    var ifNoneMatch: String?
    
    /// The type of the request content.
    var contentType: String?
    
    /// The content length of the request content.
    var contentLength: Int?
    
    /// Initialize the structure.
    ///
    /// - Parameters:
    ///   - ifModifiedSince: The last date that the data has been modified on the server.
    ///   - ifNoneMatch: If the tag doesn't match.
    ///   - contentType: The type of the body.
    ///   - contentLength: The length of the content.
    public init(ifModifiedSince: String? = nil,
                ifNoneMatch: String? = nil,
                contentType: String? = nil,
                contentLength: Int? = nil) {
        self.ifModifiedSince = ifModifiedSince
        self.ifNoneMatch = ifNoneMatch
        self.contentType = contentType
        self.contentLength = contentLength
    }
}

import Foundation

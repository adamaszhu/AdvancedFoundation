/// NetworkResponseHeader includes the header information in a network response.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 13/07/2017
public struct NetworkResponseHeader {
    
    /// The content type of the response.
    let contentType: String?
    
    /// The content length of the response.
    let contentLength: Int?
    
    /// The data that the resource is modified, it is only obtainable if the server apply HTTP cache mechanism.
    let lastModified: String?
    
    /// The tag of the resource, it is only obtainable if the server apply HTTP cache mechanism.
    let eTag: String?
    
}

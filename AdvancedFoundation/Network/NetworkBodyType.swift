/// NetworkBodyType represents the type of a HTTP body.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 13/07/2017
public enum NetworkBodyType: String {
    
    case json = "application/json"
    case text = "text/plain"
    case javascript = "application/javascript"
    case xml = "text/xml"
    case html = "text/html"
    case wwwForm = "application/x-www-form-urlencoded"
    case formData = "multipart/form-data; boundary=----FormData"
    
}
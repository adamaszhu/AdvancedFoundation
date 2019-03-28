/// JSONPath present a node in the json. It is similar to xPath in XML.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 26/03/2019
struct JSONPath {
    
    /// All JSON nodes in the path
    private (set) var nodes: [JSONNode]
    
    /// Whether the path is empty or not.
    var isEmpty: Bool {
        return nodes.count == 0
    }
    
    /// The first node in the path.
    var firstNode: JSONNode? {
        return nodes.first
    }
    
    /// Consume the first node in the path.
    ///
    /// - Returns: Whether the first node has been removed or not.
    @discardableResult
    mutating func removeFirstNode() -> Bool {
        guard !isEmpty else {
            return false
        }
        nodes.remove(at: 0)
        return true
    }
}

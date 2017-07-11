/**
 * JSONPath present a node in the json. It is similar to xPath in XML.
 * - author: Adamas
 * - version: 1.0.1
 * - date: 30/04/2017
 */
struct JSONPath {
    
    /**
     * System warning.
     */
    private static let removeFirstNodeWarning = "The path is empty."
    
    /**
     * Attributes.
     */
    private (set) var nodes: Array<JSONNode>
    
    /**
     * Whether the path is empty or not.
     */
    var isEmpty: Bool {
        return nodes.count == 0
    }
    
    /**
     * The first node in the path.
     */
    var firstNode: JSONNode? {
        return nodes.first
    }
    
    /**
     * Consume the first node in the path.
     */
    mutating func removeFirstNode() {
        guard !isEmpty else {
            Logger.standard.log(warning: JSONPath.removeFirstNodeWarning)
            return
        }
        nodes.remove(at: 0)
    }
    
}

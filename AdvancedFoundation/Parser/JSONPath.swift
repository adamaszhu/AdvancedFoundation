/**
 * JSONPath present a node in the json. It is similar to xPath in XML.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 30/04/2017
 */
struct JSONPath {
    
    var nodes: Array<JSONNode>
    
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
        if nodes.count == 0 {
            return nil
        }
        return nodes.first!
    }
    
    /**
     * Consume the first node in the path.
     */
    mutating func removeFirstNode() {
        if nodes.count == 0 {
            return
        }
        nodes.remove(at: 0)
    }
    
}

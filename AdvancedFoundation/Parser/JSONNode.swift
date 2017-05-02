/**
 * JSONNode represent a node in a json path.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 29/04/2017
 */
struct JSONNode {
    
    let name: String
    let index: Int?
    
    /**
     * Whether the node represent current node or not. Which is a dot character.
     */
    var isCurrentNode: Bool {
        return (name == ".") && (index  == nil)
    }
    
    /**
     * Initialize the JSONNode.
     * - parameter name: The name of the node.
     * - parameter index: The index of the array.
     */
    init(name: String, index: Int? = nil) {
        self.name = name
        self.index = index
    }
    
}

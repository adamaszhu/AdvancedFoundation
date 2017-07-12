/// JSONNode represent a node in a json path.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 12/07/2017
struct JSONNode {
    
    /// Node name
    let name: String

    /// Element index
    let index: Int?
    
    /// Whether the node represent current node or not. Which is a dot character.
    var isCurrentNode: Bool {
        return name == "."
    }
    
    /// Initialize the JSONNode.
    ///
    /// - Parameters:
    ///   - name: The name of the node.
    ///   - index: The index of the array.
    init(name: String, index: Int? = nil) {
        self.name = name
        self.index = index
    }
    
}

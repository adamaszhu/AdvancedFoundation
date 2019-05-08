/// JSONNode represent a node in a json path.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 23/03/2019
struct JSONNode {
    
    /// Whether the node represent current node or not. Which is a dot character.
    let isCurrentNode: Bool
    
    /// Node name
    let name: String

    /// Element index
    let index: Int?
    
    /// Initialize the JSONNode.
    ///
    /// - Parameters:
    ///   - name: The name of the node.
    ///   - index: The index of the array.
    init(name: String, index: Int? = nil) {
        self.name = name
        self.index = index
        isCurrentNode = name == .dot
    }
}

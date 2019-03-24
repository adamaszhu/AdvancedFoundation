/// JSONPath+Parsable parse a string to a JSON path.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 23/03/2019
extension JSONPath {
    
    /// Parse a string to a JSON path.
    ///
    /// - Parameter path: The string to be parsed.
    init?(path: String) {
        if path.isEmpty {
            self.init(nodes: [])
            return
        }
        var nodes = [JSONNode]()
        for nodeComponent in path.components(separatedBy: "/") {
            guard let node = JSONNode(path: nodeComponent) else {
                return nil
            }
            nodes.append(node)
        }
        self.init(nodes: nodes)
    }
}

import Foundation

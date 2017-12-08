/// JSONPath+Parser parse a string to a JSON path.
///
/// - author: Adamas
/// - version: 1.1.8
/// - date: 09/12/2017
extension JSONPath {
    
    /// Parse a string to a JSON path.
    ///
    /// - Parameter path: The string to be parsed.
    init?(path: String) {
        var nodes = [JSONNode]()
        if !path.isEmpty {
            for nodeComponent in path.components(separatedBy: "/") {
                guard let node = JSONNode(path: nodeComponent) else {
                    return nil
                }
                nodes.append(node)
            }
        }
        self.init(nodes: nodes)
    }
    
}

import Foundation

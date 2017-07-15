/// JSONPath+Parser parse a string to a JSON path.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 12/07/2017
extension JSONPath {
    
    /// Parse a string to a JSON path.
    ///
    /// - Parameter path: The string to be parsed.
    /// - Returns: The parsed path. Nil if the string is not well formatted.
    static func path(from path: String) -> JSONPath? {
        var nodes = [JSONNode]()
        guard !path.isEmpty else {
            return JSONPath(nodes: nodes)
        }
        for nodeComponent in path.components(separatedBy: "/") {
            guard let node = JSONNode.node(from: nodeComponent) else {
                return nil
            }
            nodes.append(node)
        }
        return JSONPath(nodes: nodes)
    }
    
}

import Foundation

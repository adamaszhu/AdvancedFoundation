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
    static func parse(path: String) -> JSONPath? {
        guard !path.isEmpty else {
            return JSONPath(nodes: [])
        }
        let nodes = path.components(separatedBy: "/").flatMap { nodeComponent in
            return JSONNode.parse(nodePath: nodeComponent)
        }
        return JSONPath(nodes: nodes)
    }
    
}

import Foundation

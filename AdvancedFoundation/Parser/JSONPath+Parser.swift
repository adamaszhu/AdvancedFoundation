/**
 * JSONPath+Parser parse a string to a JSON path.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 30/04/2017
 */
extension JSONPath {
    
    /**
     * Parse a string to a JSON path.
     * - parameter string: The string to be parsed.
     * - returns: The parsed path. Nil if the string is not well formatted.
     */
    static func parse(_ string: String) -> JSONPath? {
        var nodes = Array<JSONNode>()
        guard !string.isEmpty else {
            return JSONPath(nodes: nodes)
        }
        for nodeComponent in string.components(separatedBy: "/") {
            guard let node = JSONNode.parse(nodeComponent) else {
                return nil
            }
            nodes.append(node)
        }
        return JSONPath(nodes: nodes)
    }
    
}

import Foundation

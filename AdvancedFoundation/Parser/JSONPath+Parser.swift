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
    static func parseString(_ string: String) -> JSONPath? {
        var nodes = Array<JSONNode>()
        for nodeComponent in string.components(separatedBy: "/") {
            guard let node = JSONNode.parseString(nodeComponent) else {
                return nil
            }
            nodes.append(node)
        }
        return JSONPath(nodes: nodes)
    }
    
}

import Foundation

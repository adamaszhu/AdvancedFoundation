/**
 * JSONParser parses the data of a JSON structure.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 29/04/2017
 */
public class JSONParser {
    
    /**
     * System error.
     */
    private let pathError = "The path is invalid."
    
    /**
     * The content of the json file.
     */
    private var json: Any?
    
    /**
     * Initialize the parser.
     * - parameter data: The JSON data.
     */
    public init(withData data: Data) {
        do {
            json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
        } catch let error {
            Logger.standard.logError(error)
        }
    }
    
    /**
     * Initialize the parser.
     * - parameter string: The string data.
     */
    public convenience init(withString string: String) {
        // COMMENT: String should always be able to transfer to data.
        let data = string.data(using: .utf8)!
        self.init(withData: data)
    }
    
    /**
     * Get an array element.
     * - parameter path: The json path.
     * - parameter node: Current node.
     */
    public func getArray(atPath path: String, fromNode node: Any? = nil) -> Array<Any>? {
        return getNode(atPath: path, fromNode: node) as? Array<Any>
    }
    
    /**
     * Get a string element.
     * - parameter path: The json path.
     * - parameter element: Current element.
     */
    public func getString(atPath path: String, fromNode node: Any? = nil) -> String? {
        return getNode(atPath: path, fromNode: node) as? String
    }
    
    /**
     * Get a double element.
     * - parameter path: The json path.
     * - parameter element: Current element.
     */
    public func getDouble(atPath path: String, fromNode node: Any? = nil) -> Double? {
        return getNode(atPath: path, fromNode: node) as? Double
    }
    
    /**
     * Get a dictionary element.
     * - parameter path: The json path.
     * - parameter element: Current element.
     */
    public func getDictionary(atPath path: String, fromNode node: Any? = nil) -> Dictionary<String, Any>? {
        return getNode(atPath: path, fromNode: node) as? Dictionary<String, Any>
    }
    
    
    /**
     * Get a node.
     * - parameter path: The json path.
     * - parameter node: Current node.
     */
    private func getNode(atPath path: String, fromNode node: Any?) -> Any? {
        guard let jsonPath = JSONPath.parseString(path) else {
            return nil
        }
        return getNode(atPath: jsonPath, fromNode: node)
    }
    
    /**
     * Get the element at path.
     * - parameter path: The json path used to retrieve the element.
     * - parameter node: Current node node. If it is nil, the root node will be regarded as current node.
     * - returns: The element. Nil if it cannot be found.
     */
    private func getNode(atPath path: JSONPath, fromNode node: Any?) -> Any? {
        if json == nil {
            // COMMENT: JsonParser.InvalidJsonError. It should be logged in the constructor.
            return nil
        }
        // COMMENT: If the path is empty, the method shouldn't even be called.
        let pathNode = path.firstNode!
        if pathNode.isCurrentNode {
            // COMMENT: Return current node.
            return node ?? json
        }
        guard let currentNode = (node ?? json) as? Dictionary<String, AnyObject> else {
            // COMMENT: The node presented by the path doesn't exist.
            return nil
        }
        var newPath = path
        newPath.removeFirstNode()
        if newPath.isEmpty && (pathNode.index == nil) {
            // COMMENT: Return current node.
            return currentNode[pathNode.name]
        } else if newPath.isEmpty && (pathNode.index != nil) {
            // COMMENT: Return an element of current array node.
            return currentNode[pathNode.name] as? Array<Any>
        } else if !newPath.isEmpty && (pathNode.index == nil) {
            guard let dictionaryNode = currentNode[pathNode.name] as? Dictionary<String, Any> else {
                // COMMENT: The node name doesn't exist.
                return nil
            }
            return getNode(atPath: newPath, fromNode: dictionaryNode)
        } else {
            guard let arrayNode = currentNode[pathNode.name] as? Array<Any> else {
                // COMMENT: The node name doesn't exist.
                return nil
            }
            guard let subNode = arrayNode[pathNode.index!] as? Dictionary<String, Any> else {
                // COMMENT: The node name doesn't exist.
                return nil
            }
            return getNode(atPath: newPath, fromNode: subNode)
        }
    }
    
}

import Foundation

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
    private var json: Any
    
    /**
     * Initialize the parser.
     * - parameter data: The JSON data.
     */
    public init?(data: Data) {
        do {
            json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
        } catch let error {
            Logger.standard.logError(error)
            return nil
        }
    }
    
    /**
     * Initialize the parser.
     * - parameter string: The string data.
     */
    public convenience init?(string: String) {
        // COMMENT: String should always be able to transfer to data.
        let data = string.data(using: .utf8)!
        self.init(data: data)
    }
    
    /**
     * Get an array element.
     * - parameter path: The json path. Absolute path is equals to where the node is nil.
     * - parameter node: Current node.
     */
    public func getArray(atPath path: String, fromNode node: Any? = nil) -> Array<Any>? {
        return getNode(atPath: path, fromNode: node) as? Array<Any>
    }
    
    /**
     * Get a string element.
     * - parameter path: The json path. Absolute path is equals to where the node is nil.
     * - parameter element: Current element.
     */
    public func getString(atPath path: String, fromNode node: Any? = nil) -> String? {
        return getNode(atPath: path, fromNode: node) as? String
    }
    
    /**
     * Get a double element.
     * - parameter path: The json path. Absolute path is equals to where the node is nil.
     * - parameter element: Current element.
     */
    public func getDouble(atPath path: String, fromNode node: Any? = nil) -> Double? {
        return getNode(atPath: path, fromNode: node) as? Double
    }
    
    /**
     * Get a dictionary element.
     * - parameter path: The json path. Absolute path is equals to where the node is nil.
     * - parameter element: Current element.
     */
    public func getDictionary(atPath path: String, fromNode node: Any? = nil) -> Dictionary<String, Any>? {
        return getNode(atPath: path, fromNode: node) as? Dictionary<String, Any>
    }
    
    
    /**
     * Get a node.
     * - parameter path: The json path. Absolute path is equals to where the node is nil.
     * - parameter node: Current node.
     */
    private func getNode(atPath path: String, fromNode node: Any?) -> Any? {
        var realPath = path
        var realNode = node
        if path.hasPrefix("/") {
            realPath = realPath.removePrefix("/")!
            realNode = json
        }
        guard let jsonPath = JSONPath.parseString(realPath) else {
            return nil
        }
        guard !jsonPath.isEmpty else {
            return nil
        }
        return getNode(at: jsonPath, fromNode: realNode)
    }
    
    /**
     * Get the element at path.
     * - parameter path: The json path used to retrieve the element.
     * - parameter node: Current node node. If it is nil, the root node will be regarded as current node.
     * - returns: The element. Nil if it cannot be found.
     */
    private func getNode(at path: JSONPath, fromNode node: Any?) -> Any? {
        // COMMENT: If the path is empty, the method shouldn't even be called.
        let pathNode = path.firstNode!
        var realNode = node ?? json
        if !pathNode.isCurrentNode {
            // COMMENT: Get real current node from the dictionary node.
            guard let dictionaryNode = realNode as? Dictionary<String, AnyObject> else {
                // COMMENT: The node presented by the path doesn't exist.
                return nil
            }
            realNode = dictionaryNode[pathNode.name] as Any
        }
        if pathNode.index != nil {
            // COMMENT: Get real current node from the array node.
            guard let arrayNode = realNode as? Array<Any> else {
                // COMMENT: The node name doesn't exist.
                return nil
            }
            realNode = arrayNode[pathNode.index!]
        }
        var newPath = path
        newPath.removeFirstNode()
        return newPath.isEmpty ? realNode : getNode(at: newPath, fromNode: realNode)
    }
    
}

import Foundation

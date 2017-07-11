/**
 * JSONParser parses the data of a JSON structure.
 * - author: Adamas
 * - version: 1.0.1
 * - date: 29/04/2017
 */
public class JSONParser {
    
    /**
     * System error
     */
    private static let pathWarning = "The node presented by the path doesn't exist."
    
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
            Logger.standard.log(error)
            return nil
        }
    }
    
    /**
     * Initialize the parser.
     * - parameter string: The string data.
     */
    public convenience init?(string: String) {
        // String should always be able to transfer to data.
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
            realPath.remove(prefix: "/")
            realNode = json
        }
        guard let jsonPath = JSONPath.parse(realPath) else {
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
        guard let pathNode = path.firstNode else {
            Logger.standard.log(warning: JSONParser.pathWarning)
            return nil
        }
        var realNode = node ?? json
        if !pathNode.isCurrentNode {
            // Get real current node from the dictionary node.
            guard let dictionaryNode = realNode as? Dictionary<String, AnyObject> else {
                Logger.standard.log(warning: JSONParser.pathWarning, withDetail: path)
                return nil
            }
            realNode = dictionaryNode[pathNode.name] as Any
        }
        if let pathNodeIndex = pathNode.index {
            // Get real current node from the array node.
            guard let arrayNode = realNode as? Array<Any> else {
                Logger.standard.log(warning: JSONParser.pathWarning, withDetail: path)
                return nil
            }
            realNode = arrayNode[pathNodeIndex]
        }
        var path = path
        path.removeFirstNode()
        return path.isEmpty ? realNode : getNode(at: path, fromNode: realNode)
    }
    
}

import Foundation

/// JSONParser parses the data of a JSON structure.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 26/03/2019
public class JSONParser {
    
    /// The content of the json file.
    private var json: Any
    
    /// Initialize the parser.
    ///
    /// - Parameter data: The JSON data.
    public init?(data: Data) {
        do {
            json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
        } catch let error {
            Logger.standard.log(error)
            return nil
        }
    }
    
    /// Initialize the parser.
    ///
    /// - Parameter string: The string data.
    public convenience init?(string: String) {
        guard let data = string.data(using: .utf8) else {
            Logger.standard.logError(JSONParser.stringError)
            return nil
        }
        self.init(data: data)
    }
    
    /// Get an array element.
    ///
    /// - Parameters:
    ///   - path: The json path. Absolute path is equals to where the node is nil.
    ///   - node: Current node.
    /// - Returns: The array element. Nil if it cannot be found.
    public func array(atPath path: String, fromNode node: Any? = nil) -> [Any]? {
        return self.node(atPath: path, fromNode: node) as? [Any]
    }
    
    /// Get a string element.
    ///
    /// - Parameters:
    ///   - path: The json path. Absolute path is equals to where the node is nil.
    ///   - element: Current element.
    /// - Returns: The string element. Nil if it cannot be found.
    public func string(atPath path: String, fromNode node: Any? = nil) -> String? {
        return self.node(atPath: path, fromNode: node) as? String
    }
    
    /// Get a double element.
    ///
    /// - Parameters
    ///   - path: The json path. Absolute path is equals to where the node is nil.
    ///   - element: Current element.
    /// - Returns: The double element. Nil if it cannot be found.
    public func double(atPath path: String, fromNode node: Any? = nil) -> Double? {
        return self.node(atPath: path, fromNode: node) as? Double
    }
    
    /// Get a dictionary element.
    ///
    /// - Parameters:
    ///   - path: The json path. Absolute path is equals to where the node is nil.
    ///   - element: Current element.
    /// - Returns: The dictionary element. Nil if it cannot be found.
    public func dictionary(atPath path: String, fromNode node: Any? = nil) -> [String: Any]? {
        return self.node(atPath: path, fromNode: node) as? [String: Any]
    }
    
    /// Get a node.
    ///
    /// - Parameter
    ///   - path: The json path. Absolute path is equals to where the node is nil.
    ///   - node: Current node.
    /// - Returns: The element. Nil if it cannot be found.
    private func node(atPath path: String, fromNode node: Any?) -> Any? {
        var realPath = path
        var realNode = node
        if path.hasPrefix(.forwardSlash) {
            realPath.removePrefix(.forwardSlash)
            realNode = json
        }
        guard let jsonPath = JSONPath(path: realPath) else {
            return nil
        }
        return self.node(at: jsonPath, fromNode: realNode)
    }
    
    /// Get the element at path.
    ///
    /// - Parameters:
    ///   - path: The json path used to retrieve the element.
    ///   - node: Current node node. If it is nil, the root node will be regarded as current node.
    /// - Returns: The element. Nil if it cannot be found.
    private func node(at path: JSONPath, fromNode node: Any?) -> Any? {
        guard let pathNode = path.firstNode else {
            return nil
        }
        var realNode = node ?? json
        if !pathNode.isCurrentNode {
            // Get real current node from the dictionary node.
            guard let dictionaryNode = realNode as? [String: Any] else {
                return nil
            }
            realNode = dictionaryNode[pathNode.name] as Any
        }
        if let pathNodeIndex = pathNode.index {
            // Get real current node from the array node.
            guard let arrayNode = realNode as? [Any], let arrayElementNode = arrayNode.element(atIndex: pathNodeIndex) else {
                return nil
            }
            realNode = arrayElementNode
        }
        var path = path
        path.removeFirstNode()
        return path.isEmpty ? realNode : self.node(at: path, fromNode: realNode)
    }
}

/// Constants
private extension JSONParser {
    
    /// System error
    static let stringError = "The string cannot be convert to data."
}

import Foundation

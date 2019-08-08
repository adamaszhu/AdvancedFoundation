/// KeyedDecodingContainer+Decodable adds the ability to decode an array
///
/// - author: Adamas
/// - version: 1.6.0
/// - date: 30/03/2019
public extension KeyedDecodingContainer {
    
    
    /// Decode an array if presented
    ///
    /// - Parameter key: The coding key
    /// - Returns: An array of objects
    /// - Throws: `DecodingError.typeMismatch` if the encountered stored value is not an unkeyed container or a contained object doesn't match the object type.
    /// - throws: `DecodingError.valueNotFound` if the encountered encoded value is null, or of there are no more values to decode.
    func decodeArrayIfPresent<O: Decodable>(for key: K) throws -> [O]? {
        guard var unkeyedContainer = try? nestedUnkeyedContainer(forKey: key) else {
            // Exception should be thrown if the value is not an array. But there is no way to detect the existance of an array key.
            return nil
        }
        var array = [O]()
        while !unkeyedContainer.isAtEnd {
            let object = try unkeyedContainer.decode(O.self)
            array.append(object)
        }
        return array
    }
    
    /// Decode a value or object
    ///
    /// - Parameter key: The coding key
    /// - Returns: The value or object
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    func decodeIfPresent<O: Decodable>(for key: K) throws -> O? {
        switch O.self {
        case is Float.Type:
            return try decodeIfPresent(Float.self, forKey: key) as? O
        case is Double.Type:
            return try decodeIfPresent(Double.self, forKey: key) as? O
        case is Date.Type:
            return try decodeIfPresent(Date.self, forKey: key) as? O
        case is String.Type:
            return try decodeIfPresent(String.self, forKey: key) as? O
        case is Bool.Type:
            return try decodeIfPresent(Bool.self, forKey: key) as? O
        case is Int.Type:
            return try decodeIfPresent(Int.self, forKey: key) as? O
        case is Int8.Type:
            return try decodeIfPresent(Int8.self, forKey: key) as? O
        case is Int16.Type:
            return try decodeIfPresent(Int16.self, forKey: key) as? O
        case is Int32.Type:
            return try decodeIfPresent(Int32.self, forKey: key) as? O
        case is Int64.Type:
            return try decodeIfPresent(Int64.self, forKey: key) as? O
        case is UInt.Type:
            return try decodeIfPresent(UInt.self, forKey: key) as? O
        case is UInt8.Type:
            return try decodeIfPresent(UInt8.self, forKey: key) as? O
        case is UInt16.Type:
            return try decodeIfPresent(UInt16.self, forKey: key) as? O
        case is UInt32.Type:
            return try decodeIfPresent(UInt32.self, forKey: key) as? O
        case is UInt64.Type:
            return try decodeIfPresent(UInt64.self, forKey: key) as? O
        default:
            return try decodeIfPresent(O.self, forKey: key)
        }
    }
}

import Foundation

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
}

import Foundation

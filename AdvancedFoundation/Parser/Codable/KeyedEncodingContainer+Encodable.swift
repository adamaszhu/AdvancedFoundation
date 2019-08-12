/// KeyedEncodingContainer+Decodable adds the ability to encode an array
///
/// - author: Adamas
/// - version: 1.6.0
/// - date: 08/08/2019
public extension KeyedEncodingContainer {
    
    /// Encode an array if presented
    ///
    /// - Parameter key: The coding key
    /// - Returns: An array of objects
    /// - Throws: `DecodingError.typeMismatch` if the encountered stored value is not an unkeyed container or a contained object doesn't match the object type.
    /// - throws: `DecodingError.valueNotFound` if the encountered encoded value is null, or of there are no more values to decode.
    mutating func encodeArrayIfPresent<O: Encodable>(_ array: [O]?, for key: K) throws {
        var unkeyedContainer = nestedUnkeyedContainer(forKey: key)
        try array?.forEach { object in
            try unkeyedContainer.encode(object)
        }
    }
    
    /// Encode an array
    ///
    /// - Parameter key: The coding key
    /// - Returns: An array of objects
    /// - Throws: `DecodingError.typeMismatch` if the encountered stored value is not an unkeyed container or a contained object doesn't match the object type.
    /// - throws: `DecodingError.valueNotFound` if the encountered encoded value is null, or of there are no more values to decode.
    mutating func encodeArray<O: Encodable>(_ array: [O]?, for key: K) throws {
        if array == nil {
            try encode(array, forKey: key)
            return
        }
        try encodeArrayIfPresent(array, for: key)
    }
}

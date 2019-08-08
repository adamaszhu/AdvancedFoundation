/// CodableOperator defines the operator for coding action.
///
/// - author: Adamas
/// - version: 1.6.0
/// - date: 30/03/2019

/// The precedence for the operator
precedencegroup CodableKeyPrecedence {
    lowerThan: BitwiseShiftPrecedence
    higherThan: MultiplicationPrecedence
    associativity: left
    assignment: true
}

/// Decoding operator
infix operator ~>: CodableKeyPrecedence

/// Decode an array
///
/// - Parameters:
///   - container: The container
///   - key: The coding key
/// - Returns: An array of objects
/// - Throws: `DecodingError.typeMismatch` if the encountered stored value is not an unkeyed container or a contained object doesn't match the object type.
/// - throws: `DecodingError.valueNotFound` if the encountered encoded value is null, or of there are no more values to decode.
public func ~><O: Decodable, K: CodingKey>(container: KeyedDecodingContainer<K>, key: K) throws -> [O]? {
    return try container.decodeArrayIfPresent(for: key)
}

/// Get a keyed container using a coding key
///
/// - Parameters:
///   - decoder: The decoder
///   - keyType: The key type
/// - Returns: A keyed container
/// - throws: `DecodingError.typeMismatch` if the encountered stored value is
///   not a keyed container.
public func ~><K: CodingKey>(decoder: Decoder, keyType: K.Type) throws -> KeyedDecodingContainer<K> {
    return try decoder.container(keyedBy: keyType)
}

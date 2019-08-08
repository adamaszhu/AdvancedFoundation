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

/// Container retriever
infix operator ~>: CodableKeyPrecedence

/// Decoding operator
infix operator .>: CodableKeyPrecedence

/// Array decoding operator
infix operator ..>: CodableKeyPrecedence

/// Get a keyed container using a coding key
///
/// - Parameters:
///   - decoder: The decoder
///   - keyType: The key type
/// - Returns: A keyed container
/// - Throws: `DecodingError.typeMismatch` if the encountered stored value is
///   not a keyed container.
public func ~> <K: CodingKey>(decoder: Decoder, keyType: K.Type) throws -> KeyedDecodingContainer<K> {
    return try decoder.container(keyedBy: keyType)
}

/// Decode an array
///
/// - Parameters:
///   - container: The container
///   - key: The coding key
/// - Returns: An array of objects
/// - Throws: `DecodingError.typeMismatch` if the encountered stored value is not an unkeyed container or a contained object doesn't match the object type.
/// - Throws: `DecodingError.valueNotFound` if the encountered encoded value is null, or of there are no more values to decode.
public func ..> <O: Decodable, K: CodingKey>(container: KeyedDecodingContainer<K>, key: K) throws -> [O]? {
    return try container.decodeArrayIfPresent(for: key)
}

/// Decode a value or object
///
/// - Parameter:
///   - container: The container
///   - key: The coding key
/// - Returns: The value or object
/// - Throws: `DecodingError.typeMismatch` if the encountered encoded value
///   is not convertible to the requested type.
public func .> <O: Decodable, K: CodingKey>(container: KeyedDecodingContainer<K>, key: K) throws -> O? {
    return try container.decodeIfPresent(for: key)
}

/// CodableOperator defines the operator for coding action.
///
/// - author: Adamas
/// - version: 1.6.0
/// - date: 30/03/2019

/// The precedence for the operator
precedencegroup LeftCodableKeyPrecedence {
    lowerThan: BitwiseShiftPrecedence
    higherThan: MultiplicationPrecedence
    associativity: left
    assignment: true
}

/// The precedence for the operator
precedencegroup RightCodableKeyPrecedence {
    lowerThan: BitwiseShiftPrecedence
    higherThan: MultiplicationPrecedence
    associativity: right
    assignment: true
}

/// Coding container retriever
infix operator ~~>: LeftCodableKeyPrecedence

/// Decoding operator
infix operator *>: LeftCodableKeyPrecedence

/// Decoding operator
infix operator ?*>: LeftCodableKeyPrecedence

/// Array decoding operator
infix operator ?**>: LeftCodableKeyPrecedence

/// Key value combiner
infix operator <~~: RightCodableKeyPrecedence

/// Encoding operator
infix operator <*?: RightCodableKeyPrecedence

/// Array encoding operator
infix operator <**?: RightCodableKeyPrecedence

/// Get a keyed decoding container using a coding key
///
/// - Parameters:
///   - decoder: The decoder
///   - keyType: The key type
/// - Returns: A keyed container
/// - Throws: `DecodingError.typeMismatch` if the encountered stored value is
///   not a keyed container.
public func ~~> <K: CodingKey>(decoder: Decoder, keyType: K.Type) throws -> KeyedDecodingContainer<K> {
    return try decoder.container(keyedBy: keyType)
}

/// Decode a value or object
///
/// - Parameter:
///   - container: The container
///   - key: The coding key
/// - Returns: The value or object
/// - Throws: `DecodingError.typeMismatch` if the encountered encoded value
///   is not convertible to the requested type.
public func *> <O: Decodable, K: CodingKey>(container: KeyedDecodingContainer<K>, key: K) throws -> O {
    return try container.decode(for: key)
}

/// Decode a optional value or object
///
/// - Parameter:
///   - container: The container
///   - key: The coding key
/// - Returns: The value or object
/// - Throws: `DecodingError.typeMismatch` if the encountered encoded value
///   is not convertible to the requested type.
public func ?*> <O: Decodable, K: CodingKey>(container: KeyedDecodingContainer<K>, key: K) throws -> O? {
    return try container.decodeIfPresent(for: key)
}

/// Decode an array
///
/// - Parameters:
///   - container: The container
///   - key: The coding key
/// - Returns: An array of objects
/// - Throws: `DecodingError.typeMismatch` if the encountered stored value is not an unkeyed container or a contained object doesn't match the object type.
/// - Throws: `DecodingError.valueNotFound` if the encountered encoded value is null, or of there are no more values to decode.
public func ?**> <O: Decodable, K: CodingKey>(container: KeyedDecodingContainer<K>, key: K) throws -> [O]? {
    return try container.decodeArrayIfPresent(for: key)
}

/// Get a keyed encoding container using a coding key
///
/// - Parameters:
///   - encoder: The encoder
///   - keyType: The key type
/// - Returns: A keyed container
public func ~~> <K: CodingKey>(encoder: Encoder, keyType: K.Type) -> KeyedEncodingContainer<K> {
    return encoder.container(keyedBy: keyType)
}

/// Combine a coding key and a coding value
///
/// - Parameters:
///   - key: The coding key
///   - object: The coding value
/// - Returns: The coding pair
public func <~~ <O: Encodable, K: CodingKey>(key: K, value: O?) -> (key: K, value: O?) {
    return (key, value)
}

/// Encode a value
///
/// - Parameters:
///   - container: The encoding container
///   - pair: The key value pair that need to be encoded
/// - Throws: `EncodingError.invalidValue` if the given value is invalid in
///   the current context for this format.
public func <*? <O: Encodable, K: CodingKey>(container: KeyedEncodingContainer<K>, pair: (key: K, value: O?)) throws {
    var container = container
    return try container.encodeIfPresent(pair.value, forKey: pair.key)
}

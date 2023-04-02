/// PhraseUppercased is used to define a string that is phrase uppercased.
///
/// - author: Adamas
/// - version: 1.9.4
/// - date: 02/04/2023
@propertyWrapper
public struct PhraseUppercased {
    
    public init(wrappedValue initialValue: String) {
        self.wrappedValue = initialValue
    }
    
    public var wrappedValue: String
    
    public var projectedValue: String {
        wrappedValue.phraseUppercased
    }
}

import Foundation

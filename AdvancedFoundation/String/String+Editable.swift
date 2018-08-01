/// String+Editable provides additional functions for a string object.
///
/// - author: Adamas
/// - version: 1.3.0
/// - date: 13/08/2018
public extension String {
    
    /// Remove a specific suffix from the string.
    ///
    /// - Parameter suffix: The suffix to be removed.
    /// - Returns: Whether the suffix has been removed or not.
    @discardableResult
    public mutating func remove(suffix: String) -> Bool {
        guard hasSuffix(suffix) else {
            return false
        }
        let suffixBeginIndex = index(endIndex, offsetBy: -suffix.count)
        let suffixRange = Range<String.Index>(uncheckedBounds: (lower: suffixBeginIndex, upper: endIndex))
        removeSubrange(suffixRange)
        return true
    }
    
    /// Remove a specific prefix from the string.
    ///
    /// - Parameter prefix: The prefix to be removed.
    /// - Returns: Whether the prefix has been removed or not.
    @discardableResult
    public mutating func remove(prefix: String) -> Bool {
        guard hasPrefix(prefix) else {
            return false
        }
        let prefixEndIndex = index(startIndex, offsetBy: prefix.count)
        let prefixRange = Range<String.Index>(uncheckedBounds: (lower: startIndex, upper: prefixEndIndex))
        removeSubrange(prefixRange)
        return true
    }
    
    /// Get a string who is word uppercased. Like "apple banana" -> "Apple Banana"
    public var wordUppercased: String {
        var words = lowercased().components(separatedBy: .whitespacesAndNewlines)
        words = words.map { word in
            guard !word.isEmpty else {
                return word
            }
            var word = word
            let firstCharacter = String(word.removeFirst())
            return firstCharacter.uppercased() + word
        }
        var string = words.reduce(.empty) { (result, newString) in
            return result + newString + .space
        }
        string.removeLast()
        return string
    }
    
    /// Get a string who is phrase uppercased. Like "apple banana" -> "Apple banana"
    public var phraseUppercased: String {
        var string = lowercased()
        let firstCharacter = String(string.removeFirst())
        return firstCharacter.uppercased() + string
    }
    
}

import Foundation

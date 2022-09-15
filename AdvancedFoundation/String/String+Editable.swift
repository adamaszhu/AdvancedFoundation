/// String+Editable provides additional functions for a string object.
///
/// - author: Adamas
/// - version: 1.8.5
/// - date: 15/09/2022
public extension String {
    
    /// Remove a specific suffix from the string.
    ///
    /// - Parameter suffix: The suffix to be removed.
    /// - Returns: Whether the suffix has been removed or not.
    @discardableResult
    mutating func removeSuffix(_ suffix: String) -> Bool {
        guard hasSuffix(suffix) else {
            return false
        }
        let suffixBeginIndex = index(endIndex, offsetBy: -suffix.count)
        let suffixRange = Range<String.Index>(uncheckedBounds: (lower: suffixBeginIndex, upper: endIndex))
        removeSubrange(suffixRange)
        return true
    }
    
    /// Remove a specific suffix from the string and return the new string
    ///
    /// - Parameter suffix: The suffix to be removed.
    /// - Returns: The suffix removed string.
    func removingSuffix(_ suffix: String) -> String {
        var string = self
        string.removeSuffix(suffix)
        return string
    }
    
    /// Remove a specific prefix from the string.
    ///
    /// - Parameter prefix: The prefix to be removed.
    /// - Returns: Whether the prefix has been removed or not.
    @discardableResult
    mutating func removePrefix(_ prefix: String) -> Bool {
        guard hasPrefix(prefix) else {
            return false
        }
        let prefixEndIndex = index(startIndex, offsetBy: prefix.count)
        let prefixRange = Range<String.Index>(uncheckedBounds: (lower: startIndex, upper: prefixEndIndex))
        removeSubrange(prefixRange)
        return true
    }
    
    /// Remove a specific prefix from the string and return the new string
    ///
    /// - Parameter prefix: The prefix to be removed.
    /// - Returns: The prefix removed string.
    func removingPrefix(_ prefix: String) -> String {
        var string = self
        string.removePrefix(prefix)
        return string
    }

    /// Remove all spaces in a string
    /// - Returns: Whether spaces are removed or not
    @discardableResult
    mutating func removeSpaces() -> Bool {
        guard contains(String.space) else {
            return false
        }
        self = replacingOccurrences(of: String.space, with: String.empty)
        return true
    }

    /// Remove all spaces in a string and return a new string
    /// - Returns: The new string
    func removingSpaces() -> String {
        replacingOccurrences(of: String.space, with: String.empty)
    }

    /// Trim the string to a certain length
    /// - Parameter length: The new length
    /// - Returns: The new string
    func trimming(toLength length: Int) -> String {
        guard count > length else {
            return self
        }
        let index = self.index(startIndex, offsetBy: length)
        return String(self[..<index])
    }
    
    /// Get a string who is word uppercased. Like "apple banana" -> "Apple Banana"
    var wordUppercased: String {
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
    var phraseUppercased: String {
        var string = lowercased()
        let firstCharacter = String(string.removeFirst())
        return firstCharacter.uppercased() + string
    }
}

import Foundation

/// String+Helper provides additional functions for a string object.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 11/07/2017
public extension String {
    
    /// System warnings.
    private static let prefixExistanceWarning = "The prefix doesn't exist in the string."
    private static let suffixExistanceWarning = "The suffix doesn't exist in the string."
    
    /// Remove a specific suffix from the string.
    ///
    /// - Parameter suffix: The suffix to be removed.
    public mutating func remove(suffix: String) {
        guard hasSuffix(suffix) else {
            Logger.standard.logWarning(String.suffixExistanceWarning, withDetail: suffix)
            return
        }
        let suffixBeginIndex = index(endIndex, offsetBy: -suffix.characters.count)
        let suffixRange = Range<String.Index>(uncheckedBounds: (lower: suffixBeginIndex, upper: endIndex))
        removeSubrange(suffixRange)
    }
    
    /// Remove a specific prefix from the string.
    ///
    /// - Parameter prefix: The prefix to be removed.
    public mutating func remove(prefix: String) {
        guard hasPrefix(prefix) else {
            Logger.standard.logWarning(String.prefixExistanceWarning, withDetail: prefix)
            return
        }
        let prefixEndIndex = index(startIndex, offsetBy: prefix.characters.count)
        let prefixRange = Range<String.Index>(uncheckedBounds: (lower: startIndex, upper: prefixEndIndex))
        removeSubrange(prefixRange)
    }
    
}

import Foundation

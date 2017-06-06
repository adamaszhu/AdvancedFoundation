/**
 * String+Helper provides additional functions for a string object.
 * - author: Adamas
 * - version: 1.0.1
 * - date: 20/04/2017
 */
public extension String {
    
    /**
     * System warning.
     */
    private static let prefixWarning = "The prefix doesn't exist in the string."
    private static let suffixWarning = "The suffix doesn't exist in the string."
    
    /**
     * Remove a specific suffix from the string.
     * - parameter suffix: The suffix to be removed.
     * - returns: The suffix removed string. Nil if the suffix doesn't exist in the original string.
     */
    public func removeSuffix(_ suffix: String) -> String? {
        guard hasSuffix(suffix) else {
            Logger.standard.logWarning(String.suffixWarning, withDetail: suffix)
            return nil
        }
        let suffixBeginIndex = index(endIndex, offsetBy: -suffix.characters.count)
        return substring(to: suffixBeginIndex)
    }
    
    /**
     * Remove a specific prefix from the string.
     * - parameter prefix: The prefix to be removed.
     * - returns: The prefix removed string. Nil if the prefix doesn't exist in the original string.
     */
    public func removePrefix(_ prefix: String) -> String? {
        guard hasPrefix(prefix) else {
            Logger.standard.logWarning(String.prefixWarning, withDetail: prefix)
            return nil
        }
        let prefixEndIndex = index(startIndex, offsetBy: prefix.characters.count)
        return substring(from: prefixEndIndex)
    }
    
}

import Foundation

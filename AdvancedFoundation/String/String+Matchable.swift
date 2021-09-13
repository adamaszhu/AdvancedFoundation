/// Defines operators for doing regex operations.
///
/// - author: Adamas
/// - version: 1.7.0
/// - date: 28/07/2021
public extension String {
    
    /// Get all sub strings that matches a given regex.
    /// - Parameter string: The whole string where the match will happen
    /// - Returns: All matching sub strings
    func allMatches(in string: String) -> [String] {
        let regularExpression: NSRegularExpression
        do {
            regularExpression = try NSRegularExpression(pattern: self)
        } catch {
            Logger.standard.log(error)
            return []
        }
        let range = NSRange(location:0, length: string.count)
        return regularExpression.matches(in: string, range: range)
            .compactMap { match in
                if let range = Range(match.range, in: string) {
                    return String(string[range])
                } else {
                    return nil
                }
            }
    }
}

/// Compare a string to a regex.
///
/// - Parameters:
///   - string: The string to be compared.
///   - pattern: The regex to be used
/// - Returns: Whether the regex can be found in the string or not.
public func ~=(regex: String, string: String) -> Bool {
    let result = string.range(of: regex, options: .regularExpression)
    return result != nil
}

import Foundation

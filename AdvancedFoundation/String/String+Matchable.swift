/// Defines operators for doing regex operations.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 20/05/2019

/// Compare a string to a regex.
///
/// - Parameters:
///   - string: The string to be compared.
///   - pattern: The regex to be used
/// - Returns: Whether the regex can be found in the string or not.
public func ~=(regex: String, string: String) -> Bool {
    let regularExpression: NSRegularExpression
    do {
        regularExpression = try NSRegularExpression(pattern: regex)
    } catch let error {
        Logger.standard.log(error)
        return false
    }
    let range = NSRange(location:0, length: string.count)
    return regularExpression.firstMatch(in: string, range: range) != nil
}

import Foundation

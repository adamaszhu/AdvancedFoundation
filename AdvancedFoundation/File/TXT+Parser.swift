/// TXT+Parser provides the ability to convert a string to a TXT object.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 17/07/2017
public extension TXT {
    
    /// Parse TXT from the content.
    ///
    /// - Parameter content: The content containing txt.
    /// - Returns: The txt object.
    public static func txt(from content: String) -> TXT {
        let lines = content.components(separatedBy: .newlines).flatMap { line in
            // Skip comments.
            return line.hasPrefix("//") ? nil : line
        }
        return TXT(lines: lines)
    }
    
}

import Foundation

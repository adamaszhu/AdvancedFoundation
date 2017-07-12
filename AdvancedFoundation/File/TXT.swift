/// TXT provides support for a text file.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 12/07/2017
public class TXT {
    
    /// The content of the text.
    public private(set) var lines: [String]
    
    /// Initialize the helper.
    ///
    /// - Parameter content: The content of the text file.
    public init(content: String) {
        lines = TXT.lines(in: content)
    }
    
    /// Parse lines from the content.
    ///
    /// - Parameter content: The content containing lines.
    /// - Returns: A list of line.
    private static func lines(in content: String) -> [String] {
        let lines = content.components(separatedBy: .newlines)
        return lines.flatMap { line in
            // Skip comments.
            return line.hasPrefix("//") ? nil : line
        }
    }
    
}

import Foundation

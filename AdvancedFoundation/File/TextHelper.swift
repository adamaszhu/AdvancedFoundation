/// TextHelper provides support for a text file.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 12/07/2017
public class TextHelper {
    
    /// The content of the text.
    public private(set) var lines: [String]
    
    /// The content of the text file.
    private var content: String
    
    /// Initialize the helper.
    ///
    /// - Parameter content: The content of the text file.
    public init(content: String) {
        self.content = content
        lines = []
        parseLines()
    }
    
    /// Parse lines from the content.
    private func parseLines() {
        let lines = content.components(separatedBy: CharacterSet.newlines)
        for line in lines {
            // Skip comments.
            if !line.hasPrefix("//") {
                self.lines.append(line)
            }
        }
    }
    
}

import Foundation

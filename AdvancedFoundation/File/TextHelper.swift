/**
 * TextHelper provides support for a text file.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 29/04/2017
 */
public class TextHelper {
    
    /**
     * The content of the text.
     */
    public private(set) var lines: Array<String>
    
    /**
     * The content of the text file.
     */
    private var content: String
    
    /**
     * Initialize the helper.
     * - parameter content: The content of the text file.
     */
    public init(withContent content: String) {
        self.content = content
        lines = []
        parseLines()
    }
    
    /**
     * Parse lines from the content.
     */
    private func parseLines() {
        let lines = content.components(separatedBy: CharacterSet.newlines)
        for line in lines {
            // COMMENT: Skip comments.
            if !line.hasPrefix("//") {
                self.lines.append(line)
            }
        }
    }
    
}

import Foundation

/// TXT+Parsable provides the ability to convert a string to a TXT object.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 23/03/2019
public extension TXT {
    
    /// Parse TXT from the content.
    ///
    /// - Parameter content: The content containing txt.
    init(content: String) {
        let lines = content
            .components(separatedBy: .newlines)
            .filter { !$0.hasPrefix(.comment) }
        self.init(lines: lines)
    }
}

import Foundation

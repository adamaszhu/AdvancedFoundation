/// TXT+Parser provides the ability to convert a string to a TXT object.
///
/// - author: Adamas
/// - version: 1.1.8
/// - date: 08/12/2017
public extension TXT {
    
    /// Parse TXT from the content.
    ///
    /// - Parameter content: The content containing txt.
    public init(content: String) {
        let lines = content.components(separatedBy: .newlines).compactMap {
            // Skip comments.
            return $0.hasPrefix("//") ? nil : $0
        }
        self.init(lines: lines)
    }
    
}

import Foundation

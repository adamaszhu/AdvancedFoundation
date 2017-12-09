/// CSV+Parser parses a string to a csv object.
///
/// - author: Adamas
/// - version: 1.2.0
/// - date: 08/12/2017
public extension CSV {
    
    /// Parse the content to a two dimention array.
    ///
    /// - Parameter content: The content containing the csv.
    public init(content: String) {
        let txt = TXT(content: content)
        var table = [[String]]()
        txt.lines.forEach {
            let parsedLine = $0.replacingOccurrences(of: String.tab, with: String.empty)
            table.append(parsedLine.components(separatedBy: String.comma))
        }
        self.init(table: table)
    }
    
}

import Foundation

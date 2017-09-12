/// CSV+Parser parses a string to a csv object.
///
/// - author: Adamas
/// - version: 1.1.3
/// - date: 07/09/2017
public extension CSV {
    
    /// Parse the content to a two dimention array.
    ///
    /// - Parameter content: The content containing the csv.
    /// - Returns: The csv.
    public static func csv(from content: String) -> CSV {
        let txt = TXT.txt(from: content)
        var table = [[String]]()
        txt.lines.forEach {
            let parsedLine = $0.replacingOccurrences(of: "\t", with: "")
            table.append(parsedLine.components(separatedBy: ","))
        }
        return .init(table: table)
    }
    
}

import Foundation

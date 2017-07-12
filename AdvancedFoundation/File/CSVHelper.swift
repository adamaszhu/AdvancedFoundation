/// CSVHelper provides support for a csv file.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 12/07/2017
final public class CSVHelper: TextHelper {
    
    /// The content of the csv.
    public private(set) var csvContent: [[String]]
    
    // TODO: Add change function to a csv
    
    /// Parse the content to a two dimention array.
    private func parseCSV() {
        for line in lines {
            let parsedLine = line.replacingOccurrences(of: "\t", with: "")
            csvContent.append(parsedLine.components(separatedBy: ","))
        }
    }
    
    public override init(content: String) {
        csvContent = []
        super.init(content: content)
        parseCSV()
    }
    
}

import Foundation

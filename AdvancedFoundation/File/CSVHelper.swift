/**
 * CSVHelper provides support for a csv file.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 29/04/2017
 */
public class CSVHelper: TextHelper {
    
    /**
     * The content of the csv.
     */
    public private(set) var csvContent: Array<Array<String>>
    
    // TODO: Add change function to a csv
    
    /**
     * Parse the content to a two dimention array.
     */
    private func parseCSV() {
        var parsedLine: String
        for line in lines {
            parsedLine = line.replacingOccurrences(of: "\t", with: "")
            csvContent.append(parsedLine.components(separatedBy: ","))
        }
    }
    
    /**
     * TextHelper
     */
    public override init(withContent content: String) {
        csvContent = []
        super.init(withContent: content)
        parseCSV()
    }
    
}

import Foundation

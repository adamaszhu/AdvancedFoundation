/**
 * FormData+Parser parses a form data to a data object, which can be put into a network request.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 08/05/2017
 */
extension FormData {
    
    /**
     * The boundary of the form. If this is changed, then the NetworkBodyType should be changed as well.
     */
    static let boundary = "----FormData"
    
    /**
     * Convert the form data to a data object.
     * - returns: The data.
     */
    public func convertToData() -> Data {
        var data = Data()
        // COMMENT: The seperator data cannot be nil.
        let startSeperator = ("--\(FormData.boundary)\r\n").data(using: .utf8)!
        let endSeperator = ("--\(FormData.boundary)--\r\n").data(using: .utf8)!
        for field in fields {
            data.append(startSeperator)
            data.append(field.convertToData())
        }
        data.append(endSeperator)
        return data
    }
    
}

import Foundation

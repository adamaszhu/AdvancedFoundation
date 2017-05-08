/**
 * WWWForm+Parser parses a www form to a data object, which can be put into a network request.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 08/05/2017
 */
extension WWWForm {
    
    /**
     * The boundary of the form.
     */
    static let boundary = "----WWWForm"
    
    public func convertToData() -> Data {
        var data = Data()
        // COMMENT: The seperator data cannot be nil.
        let startSeperator = ("--\(WWWForm.boundary)\r\n").data(using: .utf8)!
        let endSeperator = ("--\(WWWForm.boundary)--\r\n").data(using: .utf8)!
        for field in fields {
            data.append(startSeperator)
            data.append(field.convertToData())
        }
        data.append(endSeperator)
        return data
    }
    
}

import Foundation

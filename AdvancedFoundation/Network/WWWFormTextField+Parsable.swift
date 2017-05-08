/**
 * WWWFormTextField+Parsable implements how a text field should be convert to a data.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 08/05/2017
 */
extension WWWFormTextField: WWWFormFieldParsable {
    
    /**
     * WWWFormFieldParsable
     */
    public func convertToData() -> Data {
        var data = Data()
        let field = "Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n\(value)"
        // COMMENT: The data converted from a string cannot be nil.
        data.append(field.data(using: .utf8)!)
        data.append("\r\n".data(using: .utf8)!)
        return data
    }
    
}

import Foundation

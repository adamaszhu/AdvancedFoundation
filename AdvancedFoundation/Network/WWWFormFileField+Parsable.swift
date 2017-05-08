/**
 * WWWFormFileField+Parsable implements how a file field should be convert to a data.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 08/05/2017
 */
extension WWWFormFileField: WWWFormFieldParsable {
    
    /**
     * WWWFormFieldParsable
     */
    public func convertToData() -> Data {
        var data = Data()
        let fileInfo = FileInfoAccessor.init(withPath: path)
        let filename = fileInfo.filename
        let mimeType = fileInfo.mimeType ?? ""
        let field = "Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(filename)\"\r\nContent-Type:\(mimeType)\r\n\r\n"
        // COMMENT: The data converted from a string cannot be nil.
        data.append(field.data(using: .utf8)!)
        data.append(content)
        data.append("\r\n".data(using: .utf8)!)
        return data
    }
    
}

import Foundation

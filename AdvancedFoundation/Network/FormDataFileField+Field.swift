/// FormDataFileField+Field implements how a file field should be convert to a data.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 13/07/2017
extension FormDataFileField: FormDataField {
    
    var data: Data {
        var data = Data()
        let fileInfo = FileInfoAccessor.init(path: path)
        let filename = fileInfo.filename
        let mimeType = fileInfo.mimeType ?? ""
        let field = "Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(filename)\"\r\nContent-Type: \(mimeType)\r\n\r\n"
        // The data converted from a string cannot be nil.
        data.append(field.data(using: .utf8)!)
        data.append(content)
        data.append("\r\n".data(using: .utf8)!)
        return data
    }
    
}

import Foundation

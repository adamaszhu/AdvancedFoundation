/// FormDataTextField+Field implements how a text field should be convert to a data.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 13/07/2017
extension FormDataTextField: FormDataField {
    
    var data: Data {
        var data = Data()
        let field = "Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n\(value)"
        // The data converted from a string cannot be nil.
        data.append(field.data(using: .utf8)!)
        data.append("\r\n".data(using: .utf8)!)
        return data
    }
    
}

import Foundation

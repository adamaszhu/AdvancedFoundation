/// FormDataTextField+Field implements how a text field should be convert to a data.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 13/07/2017
extension FormDataTextField: FormDataField {
    
    /// System error
    private static let dataFormatError = "The string cannot be converted into data."
    
    /// The pattern of the prefix data of a file field.
    private static let fieldPrefixPattern = "Content-Disposition: form-data; name=\"%@\"\r\n\r\n%@"
    
    /// The pattern of the suffix data of a file field.
    private static let fieldSuffix = "\r\n"
    
    var data: Data {
        var data = Data()
        guard let fieldPrefix = String(format: FormDataTextField.fieldPrefixPattern, name, value).data(using: .utf8), let fieldSuffix = "\r\n".data(using: .utf8) else {
            Logger.standard.logInfo(FormDataTextField.dataFormatError)
            return data
        }
        data.append(fieldPrefix)
        data.append(fieldSuffix)
        return data
    }
    
}

import Foundation

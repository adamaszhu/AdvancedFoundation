/// FormDataFileField+Field implements how a file field should be convert to a data.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 13/07/2017
extension FormDataFileField: FormDataField {
    
    /// System error
    private static let dataFormatError = "The string cannot be converted into data."
    
    /// The pattern of the prefix data of a file field.
    private static let fieldPrefixPattern = "Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\nContent-Type: %@\r\n\r\n"
    
    /// The pattern of the suffix data of a file field.
    private static let fieldSuffix = "\r\n"
    
    var data: Data {
        var data = Data()
        let fileInfo = FileInfoAccessor(path: path)
        let filename = fileInfo.filename
        let mimeType = fileInfo.mimeType
        guard let fieldPrefix = String(format: FormDataFileField.fieldPrefixPattern, name, filename, mimeType).data(using: .utf8), let fieldSuffix = FormDataFileField.fieldSuffix.data(using: .utf8) else {
            Logger.standard.logError(FormDataFileField.dataFormatError)
            return data
        }
        data.append(fieldPrefix)
        data.append(content)
        data.append(fieldSuffix)
        return data
    }
    
}

import Foundation

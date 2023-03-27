/// FormDataFileField+Field implements how a file field should be convert to a data.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 02/04/2019
extension FormDataFileField: FormDataField {
    
    var data: Data {
        var data = Data()
        let fileInfo = FileInfoAccessor(path: path)
        let filename = fileInfo.filename
        let mimeType = fileInfo.mimeType
        guard let fieldPrefix = String(format: Self.fieldPrefixPattern, name, filename, mimeType)
            .data(using: .utf8),
                let fieldSuffix = Self.fieldSuffix.data(using: .utf8) else {
            Logger.standard.logError(Self.dataFormatError)
            return data
        }
        data.append(fieldPrefix)
        data.append(content)
        data.append(fieldSuffix)
        return data
    }
}

/// Constants
private extension FormDataFileField {
    
    /// System error
    static let dataFormatError = "The string cannot be converted into data."
    
    /// The pattern of the prefix data of a file field.
    static let fieldPrefixPattern = "Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\nContent-Type: %@\r\n\r\n"
    
    /// The pattern of the suffix data of a file field.
    static let fieldSuffix = "\r\n"
}

import Foundation

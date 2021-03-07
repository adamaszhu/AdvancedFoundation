/// FormDataTextField+Field implements how a text field should be convert to a data.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 02/04/2019
extension FormDataTextField: FormDataField {
    
    var data: Data {
        var data = Data()
        guard let fieldPrefix = String(format: Self.fieldPrefixPattern, name, value).data(using: .utf8), let fieldSuffix = Self.fieldSuffix.data(using: .utf8) else {
            Logger.standard.logInfo(Self.dataFormatError)
            return data
        }
        data.append(fieldPrefix)
        data.append(fieldSuffix)
        return data
    }
}

/// Constants
private extension FormDataTextField {
    
    /// System error
    private static let dataFormatError = "The string cannot be converted into data."
    
    /// The pattern of the prefix data of a file field.
    private static let fieldPrefixPattern = "Content-Disposition: form-data; name=\"%@\"\r\n\r\n%@"
    
    /// The pattern of the suffix data of a file field.
    private static let fieldSuffix = "\r\n"
}

import Foundation

/// FormData+Parsable parses a form data to a data object, which can be put into a network request.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 02/04/2019
extension FormData {
    
    /// Convert the form data to a data object.
    var data: Data {
        var data = Data()
        guard let startSeperator = FormData.startSeperator.data(using: .utf8), let endSeperator = FormData.endSeperator.data(using: .utf8) else {
            Logger.standard.logError(FormData.dataFormatError)
            return data
        }
        fields.forEach {
            data.append(startSeperator)
            data.append($0.data)
        }
        data.append(endSeperator)
        return data
    }
}

/// Constants
private extension FormData {
    
    /// System error
    static let dataFormatError = "The string cannot be converted into data."
    
    /// The boundary of the form. If this is changed, then the NetworkBodyType should be changed as well.
    static let boundary = "----FormData"
    
    /// The start seperator.
    static let startSeperator = "--\(FormData.boundary)\r\n"
    
    /// The end seperator.
    static let endSeperator = "--\(FormData.boundary)--\r\n"
}

import Foundation

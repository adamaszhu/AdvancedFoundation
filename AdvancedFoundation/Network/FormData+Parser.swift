/// FormData+Parser parses a form data to a data object, which can be put into a network request.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 13/07/2017
extension FormData {
    
    /// System error
    private static let dataFormatError = "The string cannot be converted into data."
    
    /// The boundary of the form. If this is changed, then the NetworkBodyType should be changed as well.
    private static let boundary = "----FormData"
    
    /// The start seperator.
    private static let startSeperator = "--\(FormData.boundary)\r\n"
    
    /// The end seperator.
    private static let endSeperator = "--\(FormData.boundary)--\r\n"
    
    /// Convert the form data to a data object.
    var data: Data {
        var data = Data()
        guard let startSeperator = FormData.startSeperator.data(using: .utf8), let endSeperator = FormData.endSeperator.data(using: .utf8) else {
            Logger.standard.log(error: FormData.dataFormatError)
            return data
        }
        fields.forEach { field in
            data.append(startSeperator)
            data.append(field.data)
        }
        data.append(endSeperator)
        return data
    }
    
}

import Foundation

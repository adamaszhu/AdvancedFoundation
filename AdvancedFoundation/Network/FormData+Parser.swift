/// FormData+Parser parses a form data to a data object, which can be put into a network request.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 13/07/2017
extension FormData {
    
    /// The boundary of the form. If this is changed, then the NetworkBodyType should be changed as well.
    private static let boundary = "----FormData"
    
    /// Convert the form data to a data object.
    var data: Data {
        var data = Data()
        // The seperator data cannot be nil.
        let startSeperator = ("--\(FormData.boundary)\r\n").data(using: .utf8)!
        let endSeperator = ("--\(FormData.boundary)--\r\n").data(using: .utf8)!
        fields.forEach { field in
            data.append(startSeperator)
            data.append(field.data)
        }
        data.append(endSeperator)
        return data
    }
    
}

import Foundation

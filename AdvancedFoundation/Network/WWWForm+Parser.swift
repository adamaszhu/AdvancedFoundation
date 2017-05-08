extension WWWForm: WWWFormParser {
    
    static let boundary = "----WWWForm"
    
    public func convertToData() -> Data {
                let data = Data()
        // COMMENT: The seperator data cannot be nil.
                let startSeperator = ("--\(WWWForm.boundary)\r\n").data(using: .utf8)!
                let endSeperator = ("--\(WWWForm.boundary)--\r\n").data(using: .utf8)!
        //        for key in valueList.keys {
        //            body.append(seperator)
        //            if valueList[key]!.isKind(of: Data) {
        //                // COMMENT: The value is a file.
        //                let data = valueList[key]! as! Data
        //                let fileInfo = FileInfoAccessor(withPath: key)
        //                let filename = fileInfo.filename == nil ? "" : fileInfo.filename!
        //                let mimeType = fileInfo.mimeType == nil ? "" : fileInfo.mimeType!
        //                let field = "Content-Disposition: form-data; name=\"" + filename + "\"; filename=\"" + key + "\"\r\nContent-Type:" + mimeType + "\r\n\r\n"
        //                body.append(field.data(using: String.Encoding.utf8)!)
        //                body.append(data)
        //            } else if valueList[key]!.isKind(of: NSString) {
        //                // COMMENT: The value is a string.
        //                let value = valueList[key]! as! String
        //                let field = "Content-Disposition: form-data; name=\"" + key + "\"\r\n\r\n" + value
        //                body.append(field.data(using: String.Encoding.utf8)!)
        //            } else {
        //                // TODO: Deal with other variable type.
        //            }
        //            body.append("\r\n".data(using: String.Encoding.utf8)!)
        //        }
        //        body.append(endSeperator)
        return Data()
    }
    
}

import Foundation

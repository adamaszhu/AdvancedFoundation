enum APIMocker: String {
    
    case server = "http://adamaszhu.com:3000/api/test"
    case mocker = "http://api"
    
    /// The expected header
    var header: NetworkRequestHeader {
        switch self {
        case .server:
            return NetworkRequestHeader()
        default:
            return NetworkRequestHeader(ifNoneMatch: "Success")
        }
    }
    
    /// The expected form data
    var formData: FormData {
        switch self {
        case .server:
            return FormData(fields: [])
        default:
            let textField = FormDataTextField(name: "Text", value: "Test")
            let fileField = FormDataFileField(name: "File", content: Data(), path: "File")
            return FormData(fields: [textField, fileField])
        }
    }
    
    /// The expected body {
    var body: Data {
        switch self {
        case .server:
            return Data()
        default:
            return "Test".data(using: .utf8)!
        }
    }
}

import Foundation
@testable import AdvancedFoundation

enum ResponseMocker {
    
    case success
    case fail
    
    static func validateHeader(_ header: Dictionary<String, String>?) -> ResponseMocker {
        let header = header ?? [:]
        let expectedHeader = APIMocker.mocker.header.dictionary
        for field in expectedHeader {
            if field.value != header[field.key] {
                return .fail
            }
        }
        return .success
    }
    
    func response(forURL url: URL) -> HTTPURLResponse {
        switch self {
        case .success:
            return HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: ["Etag": "Success"])!
        default:
            return HTTPURLResponse(url: url, statusCode: 400, httpVersion: nil, headerFields: nil)!
        }
    }
    
    var data: Data {
        switch self {
        case .success:
            return "Success".data(using: .utf8)!
        default:
            return "Fail".data(using: .utf8)!
        }
    }
    
}

import Foundation
@testable import AdvancedFoundation

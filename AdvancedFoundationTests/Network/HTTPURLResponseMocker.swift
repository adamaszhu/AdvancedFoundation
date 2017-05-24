class HTTPURLResponseMocker {
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    var successResponse: HTTPURLResponse {
        return HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: ["Etag": "Success"])!
    }
    
    var failResponse: HTTPURLResponse {
        return HTTPURLResponse(url: url, statusCode: 400, httpVersion: nil, headerFields: nil)!
    }
    
    var successData: Data {
        return "Success".data(using: .utf8)!
    }
    
    var failData: Data {
        return "Fail".data(using: .utf8)!
    }
    
}

import Foundation

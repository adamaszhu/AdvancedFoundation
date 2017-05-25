class URLSessionUploadTaskMocker: URLSessionUploadTask {
    
    var delegate: (URLSessionDataDelegate & URLSessionTaskDelegate)?
    let session: URLSession
    let request: URLRequest
    let body: Data
    
    init(session: URLSession, request: URLRequest, body: Data) {
        self.session = session
        self.body = body
        self.request = request
    }
    
    override var originalRequest: URLRequest? {
        return request
    }
    
    override func resume() {
        guard (request.url?.absoluteString == APIMocker.mocker.rawValue) && (request.httpMethod == NetworkRequestType.post.rawValue)  else {
            delegate?.urlSession?(session, task: self, didCompleteWithError: ErrorMocker.api)
            return
        }
        let responseMocker = ResponseMocker.validateHeader(request.allHTTPHeaderFields)
        delegate?.urlSession?(session, dataTask: self, didReceive: responseMocker.response(forURL: request.url!), completionHandler: { _ in })
        delegate?.urlSession?(session, dataTask: self, didReceive: responseMocker.data)
        delegate?.urlSession?(session, task: self, didCompleteWithError: nil)
    }
    
    override func cancel() {
    }
    
}

import Foundation
@testable import AdvancedFoundation

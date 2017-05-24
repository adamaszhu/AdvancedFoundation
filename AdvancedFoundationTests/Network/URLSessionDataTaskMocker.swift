class URLSessionDataTaskMocker: URLSessionDataTask {
    
    var delegate: (URLSessionDataDelegate & URLSessionTaskDelegate)?
    let session: URLSession
    let request: URLRequest
    
    init(session: URLSession, request: URLRequest) {
        self.session = session
        self.request = request
    }
    
    override var originalRequest: URLRequest? {
        return request
    }
    
    override func resume() {
        if request.url?.absoluteString != APIMocker.mocker.rawValue {
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

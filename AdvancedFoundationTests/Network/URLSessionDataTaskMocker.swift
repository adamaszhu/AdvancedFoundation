class URLSessionDataTaskMocker: URLSessionDataTask {
    
    @objc var sessionDelegate: (URLSessionDataDelegate & URLSessionTaskDelegate)?
    @objc let session: URLSession
    @objc let request: URLRequest
    
    @objc init(session: URLSession, request: URLRequest) {
        self.session = session
        self.request = request
    }
    
    private func mockGetResponse() {
        let responseMocker = ResponseMocker.validateHeader(request.allHTTPHeaderFields)
        sessionDelegate?.urlSession?(session, dataTask: self, didReceive: responseMocker.response(forURL: request.url!), completionHandler: { _ in })
        sessionDelegate?.urlSession?(session, dataTask: self, didReceive: responseMocker.data)
        sessionDelegate?.urlSession?(session, task: self, didCompleteWithError: nil)
    }
    
    private func mockFormDataPostResponse() {
        if request.httpBody?.count == APIMocker.mocker.formData.data.count {
            let responseMocker = ResponseMocker.validateHeader(request.allHTTPHeaderFields)
            sessionDelegate?.urlSession?(session, dataTask: self, didReceive: responseMocker.response(forURL: request.url!), completionHandler: { _ in })
            sessionDelegate?.urlSession?(session, dataTask: self, didReceive: responseMocker.data)
            sessionDelegate?.urlSession?(session, task: self, didCompleteWithError: nil)
        } else {
            sessionDelegate?.urlSession?(session, task: self, didCompleteWithError: ErrorMocker.body)
        }
    }
    
    private func mockPostResponse() {
        if request.httpBody?.count == APIMocker.mocker.body.count {
            let responseMocker = ResponseMocker.validateHeader(request.allHTTPHeaderFields)
            sessionDelegate?.urlSession?(session, dataTask: self, didReceive: responseMocker.response(forURL: request.url!), completionHandler: { _ in })
            sessionDelegate?.urlSession?(session, dataTask: self, didReceive: responseMocker.data)
            sessionDelegate?.urlSession?(session, task: self, didCompleteWithError: nil)
        } else {
            sessionDelegate?.urlSession?(session, task: self, didCompleteWithError: ErrorMocker.body)
        }
    }
    
    private func mockDeleteResponse() {
        let responseMocker = ResponseMocker.validateHeader(request.allHTTPHeaderFields)
        sessionDelegate?.urlSession?(session, dataTask: self, didReceive: responseMocker.response(forURL: request.url!), completionHandler: { _ in })
        sessionDelegate?.urlSession?(session, dataTask: self, didReceive: responseMocker.data)
        sessionDelegate?.urlSession?(session, task: self, didCompleteWithError: nil)
    }
    
    override var originalRequest: URLRequest? {
        return request
    }
    
    override func resume() {
        guard request.url?.absoluteString == APIMocker.mocker.rawValue else {
            sessionDelegate?.urlSession?(session, task: self, didCompleteWithError: ErrorMocker.api)
            return
        }
        if request.httpMethod == NetworkRequestType.get.rawValue {
            mockGetResponse()
        } else if (request.httpMethod == NetworkRequestType.post.rawValue) && (request.value(forHTTPHeaderField: "Content-Type") == NetworkBodyType.formData.rawValue) {
            mockFormDataPostResponse()
        } else if request.httpMethod == NetworkRequestType.post.rawValue {
            mockPostResponse()
        } else if request.httpMethod == NetworkRequestType.delete.rawValue {
            mockDeleteResponse()
        }
    }
    
    override func cancel() {}
}

import Foundation
@testable import AdvancedFoundation

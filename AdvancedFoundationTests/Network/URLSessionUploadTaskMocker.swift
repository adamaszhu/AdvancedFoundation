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
    
    override func cancel() {
    }
    
}

import Foundation

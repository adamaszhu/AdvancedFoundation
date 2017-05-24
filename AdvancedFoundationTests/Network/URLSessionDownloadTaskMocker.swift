class URLSessionDownloadTaskMocker: URLSessionDownloadTask {
    
    var delegate: (URLSessionDataDelegate & URLSessionTaskDelegate & URLSessionDownloadDelegate)?
    let session: URLSession
    let request: URLRequest
    
    init(session: URLSession, request: URLRequest) {
        self.session = session
        self.request = request
    }
    
    override var originalRequest: URLRequest? {
        return request
    }
    
    override func cancel() {
    }
    
}

import Foundation

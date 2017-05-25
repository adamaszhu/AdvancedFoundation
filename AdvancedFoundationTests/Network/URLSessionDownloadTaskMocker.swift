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
    
    override func resume() {
        if request.url?.absoluteString != APIMocker.mocker.rawValue {
            delegate?.urlSession?(session, task: self, didCompleteWithError: ErrorMocker.api)
            return
        }
        let fileHelper = FileHelper(path: "Test")
        let data = "Test".data(using: .utf8)!
        _ = fileHelper.create(with: data)
        delegate?.urlSession?(session, downloadTask: self, didWriteData: Int64(data.count), totalBytesWritten: Int64(data.count), totalBytesExpectedToWrite: Int64(data.count))
        delegate?.urlSession(session, downloadTask: self, didFinishDownloadingTo: URL(fileURLWithPath: "Test"))
        delegate?.urlSession?(session, task: self, didCompleteWithError: nil)
    }
    
    override func cancel() {
    }
    
}

import Foundation
@testable import AdvancedFoundation

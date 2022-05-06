class URLSessionMocker: URLSession {
    
    @objc var urlSessionDelegate: URLSessionDelegate?
    
    override func dataTask(with request: URLRequest) -> URLSessionDataTask {
        let dataTaskMocker = URLSessionDataTaskMocker(session: self, request: request)
        dataTaskMocker.sessionDelegate = urlSessionDelegate as? (URLSessionDataDelegate & URLSessionTaskDelegate)
        return dataTaskMocker
    }
    
    override func uploadTask(with request: URLRequest, from bodyData: Data) -> URLSessionUploadTask {
        let uploadTask = URLSessionUploadTaskMocker(session: self, request: request, body: bodyData)
        uploadTask.sessionDelegate = urlSessionDelegate as? (URLSessionDataDelegate & URLSessionTaskDelegate)
        return uploadTask
    }
    
    override func downloadTask(with request: URLRequest) -> URLSessionDownloadTask {
        let downloadTaskMocker = URLSessionDownloadTaskMocker(session: self, request: request)
        downloadTaskMocker.sessionDelegate = urlSessionDelegate as? (URLSessionDataDelegate & URLSessionTaskDelegate & URLSessionDownloadDelegate)
        return downloadTaskMocker
    }
}

import Foundation

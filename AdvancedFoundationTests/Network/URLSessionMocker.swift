class URLSessionMocker: URLSession {
    
    var urlSessionDelegate: URLSessionDelegate?
    
    override func dataTask(with request: URLRequest) -> URLSessionDataTask {
        let dataTaskMocker = URLSessionDataTaskMocker()
        dataTaskMocker.delegate = urlSessionDelegate as? (URLSessionDataDelegate & URLSessionTaskDelegate)
        return dataTaskMocker
    }
    
    override func uploadTask(with request: URLRequest, from bodyData: Data) -> URLSessionUploadTask {
        let uploadTask = URLSessionUploadTaskMocker()
        uploadTask.delegate = urlSessionDelegate as? (URLSessionDataDelegate & URLSessionTaskDelegate)
        return uploadTask
    }
    
    override func downloadTask(with request: URLRequest) -> URLSessionDownloadTask {
        let downloadTaskMocker = URLSessionDownloadTaskMocker()
        downloadTaskMocker.delegate = urlSessionDelegate as? (URLSessionDataDelegate & URLSessionTaskDelegate & URLSessionDownloadDelegate)
        return downloadTaskMocker
    }
    
}

import Foundation

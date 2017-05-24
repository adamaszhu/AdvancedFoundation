class URLSessionDownloadTaskMocker: URLSessionDownloadTask {
    
    var delegate: (URLSessionDataDelegate & URLSessionTaskDelegate & URLSessionDownloadDelegate)?
    
}

import Foundation

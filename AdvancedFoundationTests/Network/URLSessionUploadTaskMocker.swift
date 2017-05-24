class URLSessionUploadTaskMocker: URLSessionUploadTask {
    
    var delegate: (URLSessionDataDelegate & URLSessionTaskDelegate)?
    
}

import Foundation

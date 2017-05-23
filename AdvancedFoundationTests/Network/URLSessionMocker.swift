class URLSessionMocker: URLSession {
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let dataTaskMocker = URLSessionDataTaskMocker()
        
        return dataTaskMocker
    }
    
}

import Foundation

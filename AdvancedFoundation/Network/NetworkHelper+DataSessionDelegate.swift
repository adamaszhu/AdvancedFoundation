/// NetworkHelper+DataSessionDelegate delegates the action for a data task.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 07/04/2019
extension NetworkHelper: URLSessionDataDelegate {
    
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        guard let task = task(of: dataTask) else {
            dataTask.cancel()
            return
        }
        appendData(data, toCacheOf: task)
    }
    
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        guard let task = task(of: dataTask) else {
            dataTask.cancel()
            return
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            removeTask(task)
            Logger.standard.logError(NetworkHelper.responseTypeError)
            dispatchError(for: task, withMessage: NetworkHelper.serverError)
            return
        }
        guard 200 ..< 400 ~= httpResponse.statusCode else {
            removeTask(task)
            Logger.standard.logError(NetworkHelper.serverSideError)
            dispatchError(for: task, withMessage: NetworkHelper.serverError)
            return
        }
        guard let header = NetworkResponseHeader(response: response) else {
            removeTask(task)
            Logger.standard.logError(NetworkHelper.responseHeaderError)
            dispatchError(for: task, withMessage: NetworkHelper.serverError)
            return 
        }
        DispatchQueue.main.async { [unowned self] in
            self.delegate?.networkHelper(self, withIdentifier: task.identifier, didReceive: header, withStatusCode: httpResponse.statusCode)
        }
        let shouldContinue = delegate?.networkHelperShouldReceiveData(self, withIdentifier: task.identifier)
        if shouldContinue == false {
            // Only the response is required.
            removeTask(task)
            completionHandler(.cancel)
        } else {
            completionHandler(.allow)
        }
    }
}

/// Constants
private extension NetworkHelper {
    
    /// System error.
    static let serverSideError = "The server cannot deal with the request."
    static let responseTypeError = "The response is not a http url response."
    static let responseHeaderError = "The response doesn't have a valid header."
    
    /// User error.
    static let serverError = "ServerError"
}

import Foundation

/// NetworkHelper+DataSessionDelegate delegates the action for a data task.
///
/// - author: Adamas
/// - version: 1.1.3
/// - date: 12/09/2017
extension NetworkHelper: URLSessionDataDelegate {
    
    /// System error.
    private static let serverSideError = "The server cannot deal with the request."
    private static let responseTypeError = "The response is not a http url response."
    private static let responseHeaderError = "The response doesn't have a valid header."
    
    /// User error.
    private static let serverError = "ServerError"
    
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        guard let task = task(of: dataTask) else {
            dataTask.cancel()
            return
        }
        append(data, toCacheOf: task)
    }
    
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        guard let task = task(of: dataTask) else {
            dataTask.cancel()
            return
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            remove(task)
            Logger.standard.log(error: NetworkHelper.responseTypeError)
            dispatchError(for: task, withMessage: NetworkHelper.serverError)
            return
        }
        guard (httpResponse.statusCode >= 200) && (httpResponse.statusCode < 400) else {
            remove(task)
            Logger.standard.log(error: NetworkHelper.serverSideError)
            dispatchError(for: task, withMessage: NetworkHelper.serverError)
            return
        }
        guard let header = NetworkResponseHeader.header(from: response) else {
            remove(task)
            Logger.standard.log(error: NetworkHelper.responseHeaderError)
            dispatchError(for: task, withMessage: NetworkHelper.serverError)
            return 
        }
        DispatchQueue.main.async { [unowned self] _ in
            self.networkHelperDelegate?.networkHelper(self, withIdentifier: task.identifier, didReceive: header, withStatusCode: httpResponse.statusCode)
        }
        let shouldContinue = networkHelperDelegate?.networkHelperShouldReceiveData(self, withIdentifier: task.identifier)
        if shouldContinue == false {
            // Only the response is required.
            remove(task)
            completionHandler(.cancel)
        } else {
            completionHandler(.allow)
        }
    }
    
}

import Foundation

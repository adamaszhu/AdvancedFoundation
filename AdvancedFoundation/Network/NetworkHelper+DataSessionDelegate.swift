/**
 * NetworkHelper+DataSessionDelegate delegates the action for a data task.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 06/05/2017
 */
extension NetworkHelper: URLSessionDataDelegate {
    
    /**
     * URLSessionDataDelegate
     */
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        guard let task = findTask(of: dataTask) else {
            dataTask.cancel()
            return
        }
        append(data, toCacheOf: task)
    }
    
    /**
     * URLSessionDataDelegate
     */
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        guard let task = findTask(of: dataTask) else {
            dataTask.cancel()
            return
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            remove(task)
            Logger.standard.logError(responseTypeError)
            dispatchError(for: task, withMessage: serverError)
            return
        }
        guard (httpResponse.statusCode >= 200) && (httpResponse.statusCode < 400) else {
            remove(task)
            Logger.standard.logError(serverSideError)
            dispatchError(for: task, withMessage: serverError)
            return
        }
        guard let header = NetworkResponseHeader.parse(response) else {
            remove(task)
            Logger.standard.logError(responseHeaderError)
            dispatchError(for: task, withMessage: serverError)
            return 
        }
        DispatchQueue.main.async{
            self.networkHelperDelegate?.networkHelper(self, withIdentifier: task.identifier, didReceive: header, withStatusCode: httpResponse.statusCode)
        }
        let shouldContinue = self.networkHelperDelegate?.networkHelperShouldReceiveData(self, withIdentifier: task.identifier)
        if shouldContinue == false {
            // COMMENT: Only the response is required.
            remove(task)
            completionHandler(.cancel)
        } else {
            completionHandler(.allow)
        }
    }
    
}

import Foundation

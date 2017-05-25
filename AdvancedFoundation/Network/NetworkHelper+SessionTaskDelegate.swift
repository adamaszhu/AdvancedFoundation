/**
 * NetworkHelper+SessionTaskDelegate delegates the action for a task.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 06/05/2017
 */
extension NetworkHelper: URLSessionTaskDelegate {
    
    /**
     * URLSessionTaskDelegate
     */
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        guard let networkTask = findTask(of: task) else {
            task.cancel()
            return
        }
        remove(networkTask)
        guard error == nil else {
            Logger.standard.logError(error!)
            dispatchError(for: networkTask, withMessage: internetError)
            return
        }
        DispatchQueue.main.async{
            switch networkTask.type {
            case .download:
                // COMMENT: The url has been returned.
                break
            case .upload, .data:
                self.networkHelperDelegate?.networkHelper(self, withIdentifier: networkTask.identifier, didReceive: networkTask.cache)
                break
            default:
                // COMMENT: The unsupport task won't be send.
                break
            }
        }
    }
    
}

import Foundation





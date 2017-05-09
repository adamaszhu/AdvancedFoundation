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
        guard let task = findTask(of: task) else {
            return
        }
        remove(task)
        guard error != nil else {
            Logger.standard.logError(error!)
            dispatchError(for: task, withMessage: internetError)
            return
        }
        DispatchQueue.main.async{
            switch task.type {
            case .download:
                // COMMENT: The url has been returned.
                break
            case .upload, .data:
                self.networkHelperDelegate?.networkHelper(self, withIdentifier: task.identifier, didReceiveData: task.cache)
                break
            default:
                // COMMENT: The unsupport task won't be send.
                break
            }
        }
    }
    
}

import Foundation





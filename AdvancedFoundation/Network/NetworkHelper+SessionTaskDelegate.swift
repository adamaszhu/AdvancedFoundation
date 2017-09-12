/// NetworkHelper+SessionTaskDelegate delegates the action for a task.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 13/07/2017
extension NetworkHelper: URLSessionTaskDelegate {
    
    /// User error
    private static let internetError = "InternetError"
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        guard let networkTask = self.task(of: task) else {
            task.cancel()
            return
        }
        remove(networkTask)
        if let error = error {
            Logger.standard.log(error)
            dispatchError(for: networkTask, withMessage: NetworkHelper.internetError)
            return
        }
        DispatchQueue.main.async { [unowned self] _ in
            switch networkTask.type {
            case .download:
                // The url has been returned.
                break
            case .upload, .data:
                self.networkHelperDelegate?.networkHelper(self, withIdentifier: networkTask.identifier, didReceive: networkTask.cache)
                break
            default:
                // The unsupport task won't be send.
                break
            }
        }
    }
    
}

import Foundation





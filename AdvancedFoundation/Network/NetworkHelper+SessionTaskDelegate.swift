/// NetworkHelper+SessionTaskDelegate delegates the action for a task.
///
/// - author: Adamas
/// - version: 1.9.2
/// - date: 28/03/2023
extension NetworkHelper: URLSessionTaskDelegate {
    
    public func urlSession(_ session: URLSession,
                           task: URLSessionTask,
                           didCompleteWithError error: Error?) {
        guard let networkTask = self.task(of: task) else {
            task.cancel()
            return
        }
        remove(networkTask)
        if let error = error {
            Logger.standard.log(error)
            dispatchError(for: networkTask, withMessage: Self.internetError)
            return
        }
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            switch networkTask.type {
            case .download:
                // The url has been returned.
                break
            case .upload, .data:
                self.delegate?.networkHelper(self,
                                             withIdentifier: networkTask.identifier,
                                             didReceive: networkTask.cache)
                break
            default:
                // The unsupport task won't be send.
                break
            }
        }
    }
}

/// Constants
private extension NetworkHelper {
    
    /// User error
    static let internetError = "InternetError"
}

import Foundation

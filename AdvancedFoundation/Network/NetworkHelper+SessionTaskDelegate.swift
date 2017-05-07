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
//            let networkHelperTask = findTask(task)
//            if networkHelperTask == nil {
//                logError(NetworkHelper.TaskExistanceError)
//                return
//            }
//            removeTask(networkHelperTask!)
//            if error != nil {
//                logError(error!.localizedDescription)
//                dispatchError(forTask: networkHelperTask!, withMessage: NetworkHelper.InternetError)
//                return
//            }
//            DispatchQueue.main.async{
//                switch networkHelperTask!.type {
//                case .download:
//                    // COMMENT: The url has been returned
//                    break
//                case .upload, .data:
//                    self.networkHelperDelegate?.networkHelper?(self, withIdentifier: networkHelperTask!.identifier, didReceiveData: networkHelperTask!.cache)
//                default:
//                    self.logError(NetworkHelper.TaskTypeError)
//                    self.networkHelperDelegate?.networkHelper(self, withIdentifier: networkHelperTask!.identifier, didCatchError: NetworkHelper.AppError.localizeInBundle(forClass: self.classForCoder))
//                }
//            }
        }
    
    
    
}

import Foundation





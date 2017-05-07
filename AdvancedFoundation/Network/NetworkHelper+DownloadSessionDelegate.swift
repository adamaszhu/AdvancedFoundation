/**
 * NetworkHelper+DownloadSessionDelegate delegates the action for a download task.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 06/05/2017
 */
extension NetworkHelper: URLSessionDownloadDelegate {
    
    /**
     * URLSessionDownloadDelegate.
     */
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
    }
    
    //    /**
    //     * - version: 0.1.6
    //     * - date: 08/09/2016
    //     */
    //    open func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
    //        let networkHelperTask = findTask(downloadTask)
    //        if networkHelperTask == nil {
    //            logError(NetworkHelper.TaskExistanceError)
    //            return
    //        }
    //        DispatchQueue.main.async{
    //            self.networkHelperDelegate?.networkHelper?(self, withIdentifier: networkHelperTask!.identifier, didDownloadPercentage: Double(totalBytesWritten) / Double(totalBytesExpectedToWrite))
    //        }
    //    }
    
    //    /**
    //     * - version: 0.1.6
    //     * - date: 08/09/2016
    //     */
    //    open func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo url: URL) {
    //        let networkHelperTask = findTask(downloadTask)
    //        if networkHelperTask == nil {
    //            logError(NetworkHelper.TaskExistanceError)
    //            return
    //        }
    //        let destinationPath = NetworkHelper.DocumentFolder + networkHelperTask!.identifier
    //        let result = fileHelper.copyFile(fromPath: url.path!, toPath: destinationPath)
    //        if result == true {
    //            DispatchQueue.main.async{
    //                self.networkHelperDelegate?.networkHelper?(self, withIdentifier: networkHelperTask!.identifier, didDownloadToURL: destinationPath)
    //            }
    //        } else {
    //            DispatchQueue.main.async{
    //                self.networkHelperDelegate?.networkHelper(self, withIdentifier: networkHelperTask!.identifier, didCatchError: NetworkHelper.FileMoveError)
    //            }        }
    //    }

    
}

import Foundation

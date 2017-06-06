/**
 * NetworkHelper+DownloadSessionDelegate delegates the action for a download task.
 * - author: Adamas
 * - version: 1.0.1
 * - date: 06/05/2017
 */
extension NetworkHelper: URLSessionDownloadDelegate {
    
    /**
     * URLSessionDownloadDelegate
     */
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let task = findTask(of: downloadTask) else {
            downloadTask.cancel()
            return
        }
        let destinationPath = "\(NetworkHelper.documentDirectory)/\(task.identifier)"
        let fileHelper = FileHelper(path: location.relativePath)
        if fileHelper.copy(toPath: destinationPath) != true {
            Logger.standard.logError(NetworkHelper.fileSystemError)
            dispatchError(for: task, withMessage: NetworkHelper.appError)
            return
        }
        DispatchQueue.main.async{
            self.networkHelperDelegate?.networkHelper(self, withIdentifier: task.identifier, didDownloadToURL: destinationPath)
        }
    }
    
    /**
     * URLSessionDownloadDelegate
     */
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        guard let task = findTask(of: downloadTask) else {
            downloadTask.cancel()
            return
        }
        DispatchQueue.main.async{
            self.networkHelperDelegate?.networkHelper(self, withIdentifier: task.identifier, didDownloadPercentage: Double(totalBytesWritten) / Double(totalBytesExpectedToWrite))
        }
    }
    
}

import Foundation

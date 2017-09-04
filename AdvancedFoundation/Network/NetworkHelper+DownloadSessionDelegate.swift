/// NetworkHelper+DownloadSessionDelegate delegates the action for a download task.
///
// - author: Adamas
/// - version: 1.1.0
/// - date: 13/07/2017
extension NetworkHelper: URLSessionDownloadDelegate {
    
    /// System error.
    private static let fileSystemError = "The downloaded file cannot be moved to the sandbox."
    
    /// User error.
    private static let appError = "AppError"
    
    /// System document directory. Which is used to store downloaded files.
    private static let documentDirectory = "Documents"
    
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let task = task(of: downloadTask) else {
            downloadTask.cancel()
            return
        }
        let destinationPath = "\(NetworkHelper.documentDirectory)/\(task.identifier)"
        let fileHelper = FileHelper(path: location.relativePath)
        if fileHelper.copy(toPath: destinationPath) != true {
            Logger.standard.log(error: NetworkHelper.fileSystemError)
            dispatchError(for: task, withMessage: NetworkHelper.appError)
            return
        }
        DispatchQueue.main.async {
            self.networkHelperDelegate?.networkHelper(self, withIdentifier: task.identifier, didDownloadToURL: destinationPath)
        }
    }
    
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        guard let task = task(of: downloadTask) else {
            downloadTask.cancel()
            return
        }
        DispatchQueue.main.async {
            self.networkHelperDelegate?.networkHelper(self, withIdentifier: task.identifier, didDownloadPercentage: Double(totalBytesWritten) / Double(totalBytesExpectedToWrite))
        }
    }
    
}

import Foundation

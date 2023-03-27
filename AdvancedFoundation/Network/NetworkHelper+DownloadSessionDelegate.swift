/// NetworkHelper+DownloadSessionDelegate delegates the action for a download task.
///
// - author: Adamas
/// - version: 1.9.2
/// - date: 28/03/2023
extension NetworkHelper: URLSessionDownloadDelegate {
    
    public func urlSession(_ session: URLSession,
                           downloadTask: URLSessionDownloadTask,
                           didFinishDownloadingTo location: URL) {
        guard let task = task(of: downloadTask) else {
            downloadTask.cancel()
            return
        }
        let destinationPath = Self.documentDirectory + task.identifier
        let fileHelper = FileHelper(path: location.relativePath)
        if fileHelper.copyItem(toPath: destinationPath) != true {
            Logger.standard.logError(Self.fileSystemError)
            dispatchError(for: task, withMessage: Self.appError)
            return
        }
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.delegate?.networkHelper(self,
                                         withIdentifier: task.identifier,
                                         didDownloadToURL: destinationPath)
        }
    }
    
    public func urlSession(_ session: URLSession,
                           downloadTask: URLSessionDownloadTask,
                           didWriteData bytesWritten: Int64,
                           totalBytesWritten: Int64,
                           totalBytesExpectedToWrite: Int64) {
        guard let task = task(of: downloadTask) else {
            downloadTask.cancel()
            return
        }
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.delegate?.networkHelper(self,
                                         withIdentifier: task.identifier,
                                         didDownloadPercentage: Double(totalBytesWritten) / Double(totalBytesExpectedToWrite))
        }
    }
}

/// Constants
private extension NetworkHelper {
    
    /// System error.
    static let fileSystemError = "The downloaded file cannot be moved to the sandbox."
    
    /// User error.
    static let appError = "AppError"
    
    /// System document directory. Which is used to store downloaded files.
    static let documentDirectory = "Documents"
}

import Foundation

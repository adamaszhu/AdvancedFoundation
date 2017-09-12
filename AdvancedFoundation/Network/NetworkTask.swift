/// NetworkTask is a customized task.
///
/// - author: Adamas
/// - version: 1.1.3
/// - date: 13/09/2017
struct NetworkTask {
    
    /// The task type of the task.
    var type: NetworkTaskType {
        if task is URLSessionDownloadTask {
            return .download
        }
        if task is URLSessionUploadTask {
            return .upload
        }
        if #available(iOS 9.0, *), task is URLSessionStreamTask {
            return .stream
        }
        // URLSessionTask is a data task.
        return .data
    }
    
    /// The id of the task.
    let identifier: String
    
    /// The task.
    let task: URLSessionTask
    
    /// The cache of the task.
    private (set) var cache: Data
    
    /// Initialize the object.
    ///
    /// - Parameters:
    ///   - task: The task object.
    ///   - idGenerator: The generator to generate the id.
    ///   - cache: The cache data.
    init(task: URLSessionTask, idGenerator: IDGenerator, cache: Data) {
        self.task = task
        identifier = idGenerator.uniqueID
        self.cache = cache
    }
    
    /// Append the data to the cache of the task.
    ///
    /// - Parameter data: The data to be appended.
    mutating func append(_ data: Data) {
        cache.append(data)
    }
    
    /// Cancel the task.
    func cancel() {
        task.cancel()
    }
    
}

import Foundation



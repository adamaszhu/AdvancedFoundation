/**
 * NetworkTask is a customized task.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 05/05/2017
 */
struct NetworkTask {
    
    /**
     * The cache of the task.
     */
    private (set) var cache: Data
    
    /**
     * The id of the task.
     */
    let identifier: String
    
    /**
     * The task.
     */
    let task: URLSessionTask
    
    /**
     * The task type of the task.
     */
    var type: NetworkTaskType {
        if task is URLSessionDownloadTask {
            return .download
        } else if task is URLSessionUploadTask {
            return .upload
        } else if task is URLSessionStreamTask {
            return .stream
        } else {
            // URLSessionTask is a data task.
            return .data
        }
    }
    
    /**
     * Initialize the object.
     * - parameter task: The task object.
     * - parameter idGenerator: The generator to generate the id.
     * - parameter cache: The cache data.
     */
    init(task: URLSessionTask, idGenerator: IDGenerator, cache: Data) {
        self.task = task
        identifier = idGenerator.newID
        self.cache = cache
    }
    
    /**
     * Append the data to the cache of the task.
     * - parameter data: The data to be appended.
     */
    mutating func append(_ data: Data) {
        cache.append(data)
    }
    
    /**
     * Cancel the task.
     */
    func cancel() {
        task.cancel()
    }
    
}

import Foundation



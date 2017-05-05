/**
 * NetworkTask is a customized task.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 05/05/2017
 */
class NetworkTask {
    
    /**
     * The cache of the task.
     */
    var cache: NSMutableData
    
    /**
     * The task type of the task.
     */
    var type: NetworkHelperTaskType {
        /**
         * - version: 0.0.1
         * - date: 09/06/2016
         */
        get {
            if task.isKind(of: URLSessionDownloadTask.self) {
                return NetworkHelperTaskType.download
            } else if task.isKind(of: URLSessionUploadTask.self) {
                return NetworkHelperTaskType.upload
            } else if task.isKind(of: URLSessionDataTask.self) {
                return NetworkHelperTaskType.data
            } else {
                return NetworkHelperTaskType.unknown
            }
        }
    }
    
    /**
     * The id of the task.
     */
    fileprivate (set) var identifier: String
    
    /**
     * The task.
     */
    fileprivate (set) var task: URLSessionTask
    
    /**
     * Initialize the object.
     * - version: 0.0.1
     * - date: 09/06/2016
     * - parameter task: The task object.
     */
    init(withTask task: URLSessionTask) {
        self.task = task
        identifier = IDGenerator.sharedGenerator.generateID()
        cache = NSMutableData()
        super.init()
    }
}

import Foundation



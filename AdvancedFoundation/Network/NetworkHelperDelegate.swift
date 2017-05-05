/**
 * NetworkHelperDelegate is used when a futher action need to be performed while receiving the network response.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 05/05/2017
 */
public protocol NetworkHelperDelegate {
    
    /**
     * Error catched during the operation.
     * - parameter identity: The id of the task.
     * - parameter error: The error message.
     */
    func networkHelper(_ networkHelper: NetworkHelper, withIdentity identity: String, didCatchError error: String)
    
    /**
     * Whether the task should continue receiving the data after the response or not.
     * - parameter identity: The id of the task.
     * - returns: Whether the task should continue receiving data or not.
     */
    func networkHelperShouldReceiveData(_ networkHelper: NetworkHelper, withIdentity identity: String) -> Bool
    
    /**
     * Receive the data from the server.
     * - parameter identity: The id of the task.
     * - parameter data: The data retrieved.
     */
     func networkHelper(_ networkHelper: NetworkHelper, withIdentity identity: String, didReceiveData data: Data)
    
    /**
     * Did download the data from the server.
     * - parameter identity: The id of the task.
     * - parameter url: The temp url.
     */
     func networkHelper(_ networkHelper: NetworkHelper, withIdentity identity: String, didDownloadToURL urlString: String)
    
    /**
     * Receive a response from the server including all the attributes
     * - parameter identity: The id of the task.
     * - parameter responseHeader: The attribute list in the header responsed.
     */
     func networkHelper(_ networkHelper: NetworkHelper, withIdentity identity: String, didReceiveResponse responseHeader: NetworkResponseHeader)
    
    /**
     * Receive how many percentage of the file.
     * - parameter identity: The id of the task.
     * - parameter percentage: The percentage received.
     */
    func networkHelper(_ networkHelper: NetworkHelper, withIdentity identity: String, didDownloadPercentage percentage: Double)
    
}

import Foundation


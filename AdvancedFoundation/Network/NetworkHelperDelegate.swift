/**
 * NetworkHelperDelegate is used when a futher action need to be performed while receiving the network response.
 * - author: Adamas
 /// - version: 1.1.0
 /// - date: 13/07/2017
 */
public protocol NetworkHelperDelegate {
    
    /**
     * Error catched during the operation.
     * - parameter identifier: The id of the task.
     * - parameter error: The error message.
     */
    func networkHelper(_ networkHelper: NetworkHelper, withIdentifier identifier: String, didCatchError error: String)
    
    /**
     * Whether the task should continue receiving the data after the response or not.
     * - parameter identifier: The id of the task.
     * - returns: Whether the task should continue receiving data or not.
     */
    func networkHelperShouldReceiveData(_ networkHelper: NetworkHelper, withIdentifier identifier: String) -> Bool
    
    /**
     * Receive the data from the server.
     * - parameter identifier: The id of the task.
     * - parameter data: The data retrieved.
     */
     func networkHelper(_ networkHelper: NetworkHelper, withIdentifier identifier: String, didReceive data: Data)
    
    /**
     * Did download the data from the server.
     * - parameter identifier: The id of the task.
     * - parameter url: The temp url.
     */
     func networkHelper(_ networkHelper: NetworkHelper, withIdentifier identifier: String, didDownloadToURL urlString: String)
    
    /**
     * Receive a response from the server including all the attributes
     * - parameter identifier: The id of the task.
     * - parameter header: The attribute list in the header responsed.
     * - parameter statusCode: The status code of the response.
     */
    func networkHelper(_ networkHelper: NetworkHelper, withIdentifier identifier: String, didReceive header: NetworkResponseHeader, withStatusCode statusCode: Int)
    
    /**
     * Receive how many percentage of the file.
     * - parameter identifier: The id of the task.
     * - parameter percentage: The percentage received.
     */
    func networkHelper(_ networkHelper: NetworkHelper, withIdentifier identifier: String, didDownloadPercentage percentage: Double)
    
}

import Foundation


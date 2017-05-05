/**
 * NetworkHelperDelegate+Optional implements the default action of some NetworkHelperDelegate actions.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 05/05/2017
 */
public extension NetworkHelperDelegate {
    
    /**
     * NetworkHelperDelegate.
     */
    func networkHelperShouldReceiveData(_ networkHelper: NetworkHelper, withIdentity identity: String) -> Bool {
        return true
    }
    
    /**
     * NetworkHelperDelegate.
     */
    func networkHelper(_ networkHelper: NetworkHelper, withIdentity identity: String, didReceiveData data: Data) { }
    
    /**
     * NetworkHelperDelegate.
     */
    func networkHelper(_ networkHelper: NetworkHelper, withIdentity identity: String, didDownloadToURL urlString: String) { }
    
    /**
     * NetworkHelperDelegate.
     */
    func networkHelper(_ networkHelper: NetworkHelper, withIdentity identity: String, didReceiveResponse responseHeader: NetworkResponseHeader) { }
    
    /**
     * NetworkHelperDelegate.
     */
    func networkHelper(_ networkHelper: NetworkHelper, withIdentity identity: String, didDownloadPercentage percentage: Double) { }
    
}

import Foundation


/// NetworkHelperDelegate+Optional implements the default action of some NetworkHelperDelegate actions.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 13/07/2017
public extension NetworkHelperDelegate {
    
    func networkHelperShouldReceiveData(_ networkHelper: NetworkHelper, withIdentifier identifier: String) -> Bool {
        return true
    }
    
    func networkHelper(_ networkHelper: NetworkHelper, withIdentifier identifier: String, didReceive data: Data) { }
    
    func networkHelper(_ networkHelper: NetworkHelper, withIdentifier identifier: String, didDownloadToURL url: String) { }
    
    func networkHelper(_ networkHelper: NetworkHelper, withIdentifier identifier: String, didReceive header: NetworkResponseHeader, withStatusCode statusCode: Int) { }
    
    func networkHelper(_ networkHelper: NetworkHelper, withIdentifier identifier: String, didDownloadPercentage percentage: Double) { }
    
}

import Foundation


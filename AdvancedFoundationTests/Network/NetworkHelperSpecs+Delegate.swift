extension NetworkHelperHelperSpecs: NetworkHelperDelegate {
    
    func networkHelper(_ networkHelper: NetworkHelper, withIdentifier identifier: String, didCatchError error: String) {
        results[identifier]?.error = error
    }
    
    func networkHelperShouldReceiveData(_ networkHelper: NetworkHelper, withIdentifier identifier: String) -> Bool {
        return results[identifier]?.shouldReceiveData ?? true
    }
    
    func networkHelper(_ networkHelper: NetworkHelper, withIdentifier identifier: String, didReceive data: Data) {
        results[identifier]?.data = data
    }
    
    func networkHelper(_ networkHelper: NetworkHelper, withIdentifier identifier: String, didDownloadToURL urlString: String) {
        results[identifier]?.url = urlString
    }
    
    func networkHelper(_ networkHelper: NetworkHelper, withIdentifier identifier: String, didReceive header: NetworkResponseHeader, withStatusCode statusCode: Int) {
        results[identifier]?.header = header
        results[identifier]?.statusCode = statusCode
    }
    
    func networkHelper(_ networkHelper: NetworkHelper, withIdentifier identifier: String, didDownloadPercentage percentage: Double) {
        results[identifier]?.percentage = percentage
    }
    
}

import AdvancedFoundation
import Foundation

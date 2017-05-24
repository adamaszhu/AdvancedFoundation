enum APIMocker: String {
    
    case server = "http://adamaszhu.com:3000/api/test"
    case mocker = "http://api"
    
    // COMMENT: The expected header
    var header: Dictionary<String, String> {
        switch self {
        case .server:
            return ["":""]
        default:
            return ["ifNoneMatch": "Success"]
        }
    }
    
}

import Foundation

enum APIMocker: String {
    
    case server = "http://adamaszhu.com:3000/api/test"
    case mocker = "http://api"
    
    // COMMENT: The expected header
    var header: NetworkRequestHeader {
        switch self {
        case .server:
            return NetworkRequestHeader()
        default:
            return NetworkRequestHeader(ifNoneMatch: "Success")
        }
    }
    
}

import Foundation
@testable import AdvancedFoundation

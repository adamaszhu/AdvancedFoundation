struct NetworkHelperSpecsTask {
    
    var error: String?
    var shouldReceiveData: Bool?
    var data: Data?
    var url: String?
    var header: NetworkResponseHeader?
    var statusCode: Int?
    var percentage: Double?
    
    init() {
    }
    
}

import AdvancedFoundation
import Foundation

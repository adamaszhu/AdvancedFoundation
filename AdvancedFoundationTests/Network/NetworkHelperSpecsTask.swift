struct NetworkHelperSpecsTask {
    
    var error: String?
    var shouldReceiveData: Bool?
    var data: Data?
    var url: String?
    var header: NetworkResponseHeader?
    var statusCode: Int?
    var percentage: Double?
    
    init() { }
    
    mutating func reset() {
        error = nil
        shouldReceiveData = nil
        data = nil
        url = nil
        header = nil
        statusCode = nil
        percentage = nil
    }
    
}

import AdvancedFoundation
import Foundation

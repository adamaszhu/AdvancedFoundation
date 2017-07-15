/// NetworkTask+Equatable provides comparison to two network objects.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 13/07/2017
extension NetworkTask: Equatable {
    
    static func ==(lhs: NetworkTask, rhs: NetworkTask) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
}

import Foundation

/// NetworkTask+Equatable provides comparison to two network objects.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 30/03/2019
extension NetworkTask: Equatable {
    
    static func ==(lhs: NetworkTask, rhs: NetworkTask) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

import Foundation

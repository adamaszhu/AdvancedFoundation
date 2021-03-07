/// Array+Accessable provides additional support to access the array.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 23/03/2019
public extension Array {
    
    /// Get the element at an index with index checking.
    ///
    /// - Parameter index: The index.
    /// - Returns: The element. Nil if the index is invalid.
    func element(atIndex index: Int) -> Element? {
        guard 0 ..< count ~= index else {
            Logger.standard.logError(Self.indexError, withDetail: index)
            return nil
        }
        return self[index]
    }
}

/// Constants
private extension Array {
    
    /// System error.
    static var indexError: String { "The index is out of rage." }
}

import Foundation

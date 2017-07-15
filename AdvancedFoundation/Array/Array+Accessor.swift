/// Array+Accessor provides additional support to access the array.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 11/07/2017
public extension Array {
    
    /// System error.
    private static var indexError: String { return "The index is out of rage." }
    
    /// Get the element at an index with index checking.
    ///
    /// - Parameter index: The index.
    /// - Returns: The element. Nil if the index is invalid.
    public func element(atIndex index: Int) -> Element? {
        guard index >= 0, index < count else {
            Logger.standard.log(error: Array.indexError, withDetail: index)
            return nil
        }
        return self[index]
    }
    
}

import Foundation

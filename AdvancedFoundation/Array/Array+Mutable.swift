/// Array+Mutable provides additional support to mutate the array.
///
/// - author: Adamas
/// - version: 1.9.19
/// - date: 13/10/2023
public extension Array where Element : Equatable {

    /// Remove duplicates in the array
    mutating func removeDuplicates() {
        for element in self {
            while let firstIndex = firstIndex(of: element),
                  let lastIndex = lastIndex(of: element),
                  firstIndex != lastIndex {
                remove(at: lastIndex)
            }
        }
    }

    /// Generate a new array with duplicates removed
    /// - Returns: A new array with duplicates removed
    func removingDuplicates() -> Self {
        var array = self
        array.removeDuplicates()
        return array
    }
}

import Foundation

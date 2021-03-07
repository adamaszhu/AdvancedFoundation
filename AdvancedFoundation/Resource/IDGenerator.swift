/// IDGenerator generates a unique id.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 23/03/2019
public class IDGenerator {
    
    /// The singleton instance.
    public static let standard = IDGenerator()
    
    /// Generate an unique identification.
    public var uniqueID: String {
        let newTimeSeed = Int(Date().timeIntervalSince1970)
        if newTimeSeed != timeSeed {
            iterator = 0
            timeSeed = newTimeSeed
        }
        let generatedID = String(format: Self.idPattern, timeSeed, iterator)
        iterator += 1
        return generatedID
    }
    
    /// Used as the base part of an identification. It is the seconds that have pasted since 1970.
    private var timeSeed: Int
    
    /// Used as the additional part of an identification.
    private var iterator: Int
    
    /// Initialize the object.
    public init() {
        timeSeed = 0
        iterator = 0
    }
}

/// Constants
private extension IDGenerator {
    
    /// ID pattern as "\(timeSeed)\(iterator)".
    static let idPattern = "%d%d"
}

import Foundation

/// IDGenerator generates a unique id.
///
/// - author: Adamas
/// - version: 1.1.3
/// - date: 12/09/2017
public class IDGenerator {
    
    /// The singleton instance.
    public static let standard: IDGenerator = .init()
    
    /// Generate an unique identification.
    public var uniqueID: String {
        let newTimeSeed = Int(Date().timeIntervalSince1970)
        if newTimeSeed != timeSeed {
            iterator = 0
            timeSeed = newTimeSeed
        }
        let generatedID = "\(timeSeed)\(iterator)"
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

import Foundation



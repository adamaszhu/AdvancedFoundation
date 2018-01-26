/// Date+Formatter provides additional format function for a date object.
///
/// - author: Adamas
/// - version: 1.2.2
/// - date: 27/01/2018
public extension Date {
    
    /// All localized string tag.
    private static let agoTag = "Ago"
    private static let laterTag = "Later"
    private static let spaceTag = "Space"
    private static let nowTag = "Now"
    
    /// Convert the time gap between the time specified and the current time to a simple time offset string. Such as "3 Hrs Ago".
    ///
    /// - Parameter shouldUseAbbreviation: Whether the time description should be abbreviation or not.
    /// - Returns: The time offset string.
    public func timeOffsetString(withAbbreviation shouldUseAbbreviation: Bool = false) -> String {
        let currentTimeInterval = Date().timeIntervalSince1970
        var timeOffset: Int
        if currentTimeInterval > timeIntervalSince1970 {
            timeOffset = Int(Date().timeIntervalSince1970 - timeIntervalSince1970)
        } else {
            // Add 1 second for the time used to execute the command.
            timeOffset = Int(Date().timeIntervalSince1970 - timeIntervalSince1970 - 1)
        }
        guard timeOffset != 0 else {
            return Date.nowTag.localizedInternalString(forType: Date.self)
        }
        var differTag = timeOffset > 0 ? Date.agoTag : Date.laterTag
        differTag = Date.spaceTag.localizedInternalString(forType: Date.self) + differTag.localizedInternalString(forType: Date.self)
        let timeString = NSNumber(value: timeOffset).timeString(withAbbreviation: shouldUseAbbreviation)
        let timeOffsetString = "\(timeString)\(differTag)"
        return timeOffsetString.trimmingCharacters(in: CharacterSet(charactersIn: .space))
    }
    
}

import Foundation



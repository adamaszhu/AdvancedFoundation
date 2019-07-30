/// Date+Formattable provides additional format function for a date object.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 23/03/2019
public extension Date {
    
    /// Common patterns.
    static let fullYearPattern = "yyyy"
    static let yearPattern = "yy"
    static let abbrMonthPattern = "MMM"
    static let monthPattern = "MM"
    static let dayPattern = "dd"
    static let time12HourPattern = "hh:mma"
    
    /// The object that only contains the date information of the origin object
    var date: Date {
        let datePattern = Date.dayPattern + Date.monthPattern + Date.yearPattern
        let string = self.string(withPattern: datePattern)
        guard let date = Date(string: string, pattern: datePattern) else {
            Logger.standard.logError(Date.patternError)
            return self
        }
        return date
    }
    
    /// Convert the time gap between the time specified and the current time to a simple time offset string. Such as "3 Hrs Ago".
    ///
    /// - Parameters:
    ///   - precision: How many units should be included.
    ///   - shouldUseAbbreviation: Whether the time description should be abbreviation or not.
    /// - Returns: The time offset string.
    func timeOffsetString(withPrecision precision: Int = Int.max, withAbbreviation shouldUseAbbreviation: Bool = false) -> String {
        guard precision > 0 else {
            Logger.standard.logError(Date.precisionError)
            return .empty
        }
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
        let timeString = abs(timeOffset).timeString(withPrecision: precision, withAbbreviation: shouldUseAbbreviation)
        let timeOffsetString = timeString + differTag
        return timeOffsetString.trimmingCharacters(in: CharacterSet(charactersIn: .space))
    }
    
    /// Format the date with a given pattern
    ///
    /// - Parameter pattern: The pattern
    /// - Returns: The formatted string
    func string(withPattern pattern: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = pattern
        return dateFormatter.string(from: self)
    }
    
    /// Initialize a date with a given string and a pattern
    ///
    /// - Parameters:
    ///   - string: The string
    ///   - pattern: The pattern
    init?(string: String, pattern: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = pattern
        if let date = dateFormatter.date(from: string) {
            self = date
        } else {
            return nil
        }
    }
}

/// Constants
private extension Date {
    
    /// All localized string tag.
    static let agoTag = "Ago"
    static let laterTag = "Later"
    static let spaceTag = "Space"
    static let nowTag = "Now"
    
    /// System errors.
    static let precisionError = "The precision should be at least one."
    static let patternError = "The pattern is incorrect."
}

import Foundation



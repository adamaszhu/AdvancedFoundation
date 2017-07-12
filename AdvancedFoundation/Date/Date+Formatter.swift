/// Date+Formatter provides additional format function for a date object.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 12/07/2017
public extension Date {
    
    /// All localized string tag.
    private static let agoTag = "Ago"
    private static let laterTag = "Later"
    private static let minuteTag = "Minute"
    private static let minutesTag = "Minutes"
    private static let secondTag = "Second"
    private static let secondsTag = "Seconds"
    private static let hourTag = "Hour"
    private static let hoursTag = "Hours"
    private static let dayTag = "Day"
    private static let daysTag = "Days"
    private static let monthTag = "Month"
    private static let monthsTag = "Months"
    private static let yearTag = "Year"
    private static let yearsTag = "Years"
    private static let abbrTag = "Abbr"
    private static let spaceTag = "Space"
    private static let nowTag = "Now"
    
    /// All unit in second.
    private static let yearLength = 365 * dayLength
    private static let monthLength = yearLength / 12
    private static let dayLength = 24 * hourLength
    private static let hourLength = 60 * minuteLength
    private static let minuteLength = 60 * secondLength
    private static let secondLength = 1
    
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
        if timeOffset == 0 {
            return Date.nowTag.localizedInternalString(forType: Date.self)
        }
        var differTag = timeOffset > 0 ? Date.agoTag : Date.laterTag
        differTag = Date.spaceTag.localizedInternalString(forType: Date.self) + differTag.localizedInternalString(forType: Date.self)
        timeOffset = abs(timeOffset)
        let year = timeOffset / Date.yearLength
        timeOffset = timeOffset - year * Date.yearLength
        let month = timeOffset / Date.monthLength
        timeOffset = timeOffset - month * Date.monthLength
        let day = timeOffset / Date.dayLength
        timeOffset = timeOffset - day * Date.dayLength
        let hour = timeOffset / Date.hourLength
        timeOffset = timeOffset - hour *  Date.hourLength
        let minute = timeOffset / Date.minuteLength
        let second = timeOffset - minute * Date.minuteLength
        let abbrTag = shouldUseAbbreviation ? Date.abbrTag : ""
        let yearTag = tag(forUnit: year, withSingleTag: Date.yearTag, withDoubleTag: Date.yearsTag, withAbbreviationTag: abbrTag)
        let monthTag = tag(forUnit: month, withSingleTag: Date.monthTag, withDoubleTag: Date.monthsTag, withAbbreviationTag: abbrTag)
        let dayTag = tag(forUnit: day, withSingleTag: Date.dayTag, withDoubleTag: Date.daysTag, withAbbreviationTag: abbrTag)
        let hourTag = tag(forUnit: hour, withSingleTag: Date.hourTag, withDoubleTag: Date.hoursTag, withAbbreviationTag: abbrTag)
        let minuteTag = tag(forUnit: minute, withSingleTag: Date.minuteTag, withDoubleTag: Date.minutesTag, withAbbreviationTag: abbrTag)
        let secondTag = tag(forUnit: second, withSingleTag: Date.secondTag, withDoubleTag: Date.secondsTag, withAbbreviationTag: abbrTag)
        return "\(yearTag)\(monthTag)\(dayTag)\(hourTag)\(minuteTag)\(secondTag)\(differTag)".trimmingCharacters(in: CharacterSet(charactersIn: " "))
    }
    
    /// Get the tag of a specific unit. Such as "2 Yrs" or "1 Year"
    ///
    /// - Parameters:
    ///   - unit: The unit amount, such as 1 or 2 years.
    ///   - singleTag: The single tag attached if the unit is 1.
    ///   - doubleTag: The double tag attached if the unit is more than 1.
    ///   - abbreviationTag: Whether the tag should use abbreviation or not.
    /// - Returns: The unit tag.
    private func tag(forUnit unit: Int, withSingleTag singleTag: String, withDoubleTag doubleTag: String, withAbbreviationTag abbreviationTag: String) -> String {
        guard unit != 0 else {
            return ""
        }
        var unitTag = unit == 1 ? singleTag : doubleTag
        unitTag = unitTag + abbreviationTag
        return Date.spaceTag.localizedInternalString(forType:Date.self) + "\(unit)" + Date.spaceTag.localizedInternalString(forType:Date.self) + unitTag.localizedInternalString(forType: Date.self)
    }
    
}

import Foundation



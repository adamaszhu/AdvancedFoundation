/**
 * DateFormatter is used to provide additional format function for a date object.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 15/04/2017
 */
public extension Date {
    
    /**
     * All localized string keys.
     */
    private static let ago = "Ago"
    private static let later = "Later"
    private static let minute = "Minute"
    private static let minutes = "Minutes"
    private static let second = "Second"
    private static let seconds = "Seconds"
    private static let hour = "Hour"
    private static let hours = "Hours"
    private static let day = "Day"
    private static let days = "Days"
    private static let month = "Month"
    private static let months = "Months"
    private static let year = "Year"
    private static let years = "Years"
    private static let abbr = "Abbr"
    private static let space = "Space"
    private static let now = "Now"
    
    /**
     * Convert the time gap between the time specified and the current time to a simple time offset string. Such as "3 Hrs Ago".
     * - parameter shouldUseAbbreviation: Whether the time description should be abbreviation or not.
     * - returns: The time offset string.
     */
    public func convertToTimeOffsetString(withAbbreviation shouldUseAbbreviation: Bool = false) -> String {
        // TODO: Calculate based on current year.
        let currentTimeInterval = Date().timeIntervalSince1970
        var timeOffset: Int
        if currentTimeInterval > timeIntervalSince1970 {
            timeOffset = Int(Date().timeIntervalSince1970 - timeIntervalSince1970)
        } else {
            // COMMENT: Add 1 second for the time used to execute the command.
            timeOffset = Int(Date().timeIntervalSince1970 - timeIntervalSince1970 - 1)
        }
        if timeOffset == 0 {
            return Date.now.localizeWithinFramework(forType: Date.self)
        }
        var differTag = timeOffset > 0 ? Date.ago : Date.later
        differTag = Date.space.localizeWithinFramework(forType: Date.self) + differTag.localizeWithinFramework(forType: Date.self)
        timeOffset = abs(timeOffset)
        let year = timeOffset / (365 * 24 * 60 * 60)
        timeOffset = timeOffset - year * 365 * 24 * 60 * 60
        let month = timeOffset / (365 * 24 * 60 * 60 / 12)
        timeOffset = timeOffset - month * 365 * 24 * 60 * 60 / 12
        let day = timeOffset / (24 * 60 * 60)
        timeOffset = timeOffset - day * 24 * 60 * 60
        let hour = timeOffset / (60 * 60)
        timeOffset = timeOffset - hour * 60 * 60
        let minute = timeOffset / 60
        let second = timeOffset - minute * 60
        let abbrTag = shouldUseAbbreviation ? Date.abbr : ""
        let yearTag = getTag(forUnit: year, withSingleTag: Date.year, withDoubleTag: Date.years, withAbbreviationTag: abbrTag)
        let monthTag = getTag(forUnit: month, withSingleTag: Date.month, withDoubleTag: Date.months, withAbbreviationTag: abbrTag)
        let dayTag = getTag(forUnit: day, withSingleTag: Date.day, withDoubleTag: Date.days, withAbbreviationTag: abbrTag)
        let hourTag = getTag(forUnit: hour, withSingleTag: Date.hour, withDoubleTag: Date.hours, withAbbreviationTag: abbrTag)
        let minuteTag = getTag(forUnit: minute, withSingleTag: Date.minute, withDoubleTag: Date.minutes, withAbbreviationTag: abbrTag)
        let secondTag = getTag(forUnit: second, withSingleTag: Date.second, withDoubleTag: Date.seconds, withAbbreviationTag: abbrTag)
        return "\(yearTag)\(monthTag)\(dayTag)\(hourTag)\(minuteTag)\(secondTag)\(differTag)".trimmingCharacters(in: CharacterSet(charactersIn: " "))
    }
    
    /**
     * Get the tag of a specific unit. Such as "2 Yrs" or "1 Year"
     * - parameter unit: The unit amount, such as 1 or 2 years.
     * - parameter singleTag: The single tag attached if the unit is 1.
     * - parameter doubleTag: The double tag attached if the unit is more than 1.
     * - parameter abbreviationTag: Whether the tag should use abbreviation or not.
     * - returns: The unit tag.
     */
    private func getTag(forUnit unit: Int, withSingleTag singleTag: String, withDoubleTag doubleTag: String, withAbbreviationTag abbreviationTag: String) -> String {
        if unit == 0 {
            return ""
        }
        var unitTag = unit == 1 ? singleTag : doubleTag
        unitTag = unitTag + abbreviationTag
        return Date.space.localizeWithinFramework(forType:Date.self) + "\(unit)" + Date.space.localizeWithinFramework(forType:Date.self) + unitTag.localizeWithinFramework(forType: Date.self)
    }
    
}

import Foundation



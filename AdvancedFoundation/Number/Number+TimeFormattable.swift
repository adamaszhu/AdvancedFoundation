/// Number+TimeFormattable is used to format a number into time span string.
///
/// - author: Adamas
/// - version: 1.3.0
/// - date: 06/07/2018
public extension NSNumber {
    
    /// System errors.
    private static let precisionError = "The precision should be at least one."
    
    /// All localized string tag.
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
    private static let spaceTag = "Space"
    private static let abbrTag = "Abbr"
    private static let nowTag = "0"
    
    /// All unit in second.
    private static let yearLength = 365 * dayLength
    private static let monthLength = yearLength / 12
    private static let dayLength = 24 * hourLength
    private static let hourLength = 60 * minuteLength
    private static let minuteLength = 60 * secondLength
    private static let secondLength = 1
    
    /// Convert the number into time span string. Such as "3 Hrs".
    ///
    /// - Parameters:
    ///   - precision: How many units should be included.
    ///   - shouldUseAbbreviation: Whether the time description should be abbreviation or not.
    /// - Returns: The time span string.
    public func timeString(withPrecision precision: Int = Int.max, withAbbreviation shouldUseAbbreviation: Bool = false) -> String {
        guard precision > 0 else {
            Logger.standard.log(error: NSNumber.precisionError)
            return .empty
        }
        var timeSpan = abs(intValue)
        guard timeSpan > 0 else {
            let spaceTag = NSNumber.spaceTag.localizedInternalString(forType: NSNumber.self)
            let abbrTag = shouldUseAbbreviation ? NSNumber.abbrTag : .empty
            var unitTag = NSNumber.secondTag + abbrTag
            unitTag = unitTag.localizedInternalString(forType: NSNumber.self)
            return NSNumber.nowTag + spaceTag + unitTag
        }
        let year = timeSpan / NSNumber.yearLength
        timeSpan = timeSpan - year * NSNumber.yearLength
        let month = timeSpan / NSNumber.monthLength
        timeSpan = timeSpan - month * NSNumber.monthLength
        let day = timeSpan / NSNumber.dayLength
        timeSpan = timeSpan - day * NSNumber.dayLength
        let hour = timeSpan / NSNumber.hourLength
        timeSpan = timeSpan - hour *  NSNumber.hourLength
        let minute = timeSpan / NSNumber.minuteLength
        let second = timeSpan - minute * NSNumber.minuteLength
        let abbrTag = shouldUseAbbreviation ? NSNumber.abbrTag : .empty
        let yearTag = NSNumber.tag(forUnit: year, withSingleTag: NSNumber.yearTag, withDoubleTag: NSNumber.yearsTag, withAbbreviationTag: abbrTag)
        let monthTag = NSNumber.tag(forUnit: month, withSingleTag: NSNumber.monthTag, withDoubleTag: NSNumber.monthsTag, withAbbreviationTag: abbrTag)
        let dayTag = NSNumber.tag(forUnit: day, withSingleTag: NSNumber.dayTag, withDoubleTag: NSNumber.daysTag, withAbbreviationTag: abbrTag)
        let hourTag = NSNumber.tag(forUnit: hour, withSingleTag: NSNumber.hourTag, withDoubleTag: NSNumber.hoursTag, withAbbreviationTag: abbrTag)
        let minuteTag = NSNumber.tag(forUnit: minute, withSingleTag: NSNumber.minuteTag, withDoubleTag: NSNumber.minutesTag, withAbbreviationTag: abbrTag)
        let secondTag = NSNumber.tag(forUnit: second, withSingleTag: NSNumber.secondTag, withDoubleTag: NSNumber.secondsTag, withAbbreviationTag: abbrTag)
        let tags = [yearTag, monthTag, dayTag, hourTag, minuteTag, secondTag].filter { !$0.isEmpty }
        // At least should leave one tag
        let dropAmount = max(0, tags.count - precision)
        let timeString = tags.dropLast(dropAmount).reduce(String.empty) { $0 + $1 }
        return timeString.trimmingCharacters(in: CharacterSet(charactersIn: .space))
    }
    
    /// Get the tag of a specific unit. Such as "2 Yrs" or "1 Year"
    ///
    /// - Parameters:
    ///   - unit: The unit amount, such as 1 or 2 years.
    ///   - singleTag: The single tag attached if the unit is 1.
    ///   - doubleTag: The double tag attached if the unit is more than 1.
    ///   - abbreviationTag: Whether the tag should use abbreviation or not.
    /// - Returns: The unit tag.
    private static func tag(forUnit unit: Int, withSingleTag singleTag: String, withDoubleTag doubleTag: String, withAbbreviationTag abbreviationTag: String) -> String {
        guard unit != 0 else {
            return .empty
        }
        let spaceTag = NSNumber.spaceTag.localizedInternalString(forType: NSNumber.self)
        var unitTag = unit == 1 ? singleTag : doubleTag
        unitTag = unitTag + abbreviationTag
        unitTag = unitTag.localizedInternalString(forType: NSNumber.self)
        return spaceTag + "\(unit)" + spaceTag + unitTag
    }
    
}

import Foundation

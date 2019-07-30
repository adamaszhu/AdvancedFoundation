/// Int+TimeFormattable is used to format a number into time span string.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 30/03/2019
public extension Int {
    
    /// Convert the number into time span string. Such as "3 Hrs".
    ///
    /// - Parameters:
    ///   - precision: How many units should be included.
    ///   - shouldUseAbbreviation: Whether the time description should be abbreviation or not.
    /// - Returns: The time span string.
    func timeString(withPrecision precision: Int = Int.max, withAbbreviation shouldUseAbbreviation: Bool = false) -> String {
        guard precision > 0 else {
            Logger.standard.logError(Int.precisionError)
            return .empty
        }
        var timeSpan = self
        guard timeSpan > 0 else {
            let spaceTag = Int.spaceTag.localizedInternalString(forType: Int.self)
            let abbrTag = shouldUseAbbreviation ? Int.abbrTag : .empty
            var unitTag = Int.secondTag + abbrTag
            unitTag = unitTag.localizedInternalString(forType: Int.self)
            return Int.nowTag + spaceTag + unitTag
        }
        let year = timeSpan / Int.yearLength
        timeSpan = timeSpan - year * Int.yearLength
        let month = timeSpan / Int.monthLength
        timeSpan = timeSpan - month * Int.monthLength
        let day = timeSpan / Int.dayLength
        timeSpan = timeSpan - day * Int.dayLength
        let hour = timeSpan / Int.hourLength
        timeSpan = timeSpan - hour *  Int.hourLength
        let minute = timeSpan / Int.minuteLength
        let second = timeSpan - minute * Int.minuteLength
        let abbrTag = shouldUseAbbreviation ? Int.abbrTag : .empty
        let yearTag = Int.tag(forUnit: year, withSingleTag: Int.yearTag, withDoubleTag: Int.yearsTag, withAbbreviationTag: abbrTag)
        let monthTag = Int.tag(forUnit: month, withSingleTag: Int.monthTag, withDoubleTag: Int.monthsTag, withAbbreviationTag: abbrTag)
        let dayTag = Int.tag(forUnit: day, withSingleTag: Int.dayTag, withDoubleTag: Int.daysTag, withAbbreviationTag: abbrTag)
        let hourTag = Int.tag(forUnit: hour, withSingleTag: Int.hourTag, withDoubleTag: Int.hoursTag, withAbbreviationTag: abbrTag)
        let minuteTag = Int.tag(forUnit: minute, withSingleTag: Int.minuteTag, withDoubleTag: Int.minutesTag, withAbbreviationTag: abbrTag)
        let secondTag = Int.tag(forUnit: second, withSingleTag: Int.secondTag, withDoubleTag: Int.secondsTag, withAbbreviationTag: abbrTag)
        let tags = [yearTag, monthTag, dayTag, hourTag, minuteTag, secondTag].filter { !$0.isEmpty }
        // At least should leave one tag
        let dropAmount = tags.count > precision ? tags.count - precision : 0
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
        let spaceTag = Int.spaceTag.localizedInternalString(forType: Int.self)
        var unitTag = unit == 1 ? singleTag : doubleTag
        unitTag = unitTag + abbreviationTag
        unitTag = unitTag.localizedInternalString(forType: Int.self)
        return spaceTag + String(unit) + spaceTag + unitTag
    }
}

/// Constants
private extension Int {
    
    /// System errors.
    static let precisionError = "The precision should be at least one."
    
    /// All localized string tag.
    static let minuteTag = "Minute"
    static let minutesTag = "Minutes"
    static let secondTag = "Second"
    static let secondsTag = "Seconds"
    static let hourTag = "Hour"
    static let hoursTag = "Hours"
    static let dayTag = "Day"
    static let daysTag = "Days"
    static let monthTag = "Month"
    static let monthsTag = "Months"
    static let yearTag = "Year"
    static let yearsTag = "Years"
    static let spaceTag = "Space"
    static let abbrTag = "Abbr"
    static let nowTag = "0"
    
    /// All unit in second.
    static let yearLength = 365 * dayLength
    static let monthLength = yearLength / 12
    static let dayLength = 24 * hourLength
    static let hourLength = 60 * minuteLength
    static let minuteLength = 60 * secondLength
    static let secondLength = 1
}

import Foundation

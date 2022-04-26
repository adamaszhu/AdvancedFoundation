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

    /// Default date formatter
    static let defaultDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Self.defaultLocaleIdentifier)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.amSymbol = Date.amSymbol.localizedInternalString(forType: Self.self)
        dateFormatter.pmSymbol = Date.pmSymbol.localizedInternalString(forType: Self.self)
        return dateFormatter
    }()
    
    /// The object that only contains the date information of the origin object
    var date: Date {
        let string = self.string(with: .fullDate)
        guard let date = Date(string: string, dateFormat: .fullDate) else {
            Logger.standard.logError(Self.patternError)
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
            Logger.standard.logError(Self.precisionError)
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
            return Self.nowTag.localizedInternalString(forType: Self.self)
        }
        var differTag = timeOffset > 0 ? Self.agoTag : Self.laterTag
        differTag = Self.spaceTag.localizedInternalString(forType: Self.self) + differTag.localizedInternalString(forType: Self.self)
        let timeString = abs(timeOffset).timeString(withPrecision: precision, withAbbreviation: shouldUseAbbreviation)
        let timeOffsetString = timeString + differTag
        return timeOffsetString.trimmingCharacters(in: CharacterSet(charactersIn: .space))
    }
    
    /// Format the date with a given pattern
    ///
    /// - Parameters:
    ///   - pattern: The pattern
    ///   - dateFormatter: The formatter to be used
    /// - Returns: The formatted string
    ///   - dateFormatter: The formatter to be used
    func string(withPattern pattern: String,
                dateFormatter: DateFormatter = Self.defaultDateFormatter) -> String {
        dateFormatter.dateFormat = pattern
        return dateFormatter.string(from: self)
    }

    /// Format the date with a given format
    ///
    /// - Parameters:
    ///   - dateFormat: The format
    ///   - dateFormatter: The formatter to be used
    /// - Returns: The formatted string
    func string(with dateFormat: DateFormatType,
                dateFormatter: DateFormatter = Self.defaultDateFormatter) -> String {
        string(withPattern: dateFormat.pattern,
               dateFormatter: dateFormatter)
    }
    
    /// Initialize a date with a given string and a pattern
    ///
    /// - Parameters:
    ///   - string: The string
    ///   - pattern: The pattern
    ///   - dateFormatter: The formatter to be used
    init?(string: String,
          pattern: String,
          dateFormatter: DateFormatter = Self.defaultDateFormatter) {
        dateFormatter.dateFormat = pattern
        if let date = dateFormatter.date(from: string) {
            self = date
        } else {
            return nil
        }
    }

    /// Initialize a date with a given string and a pattern
    ///
    /// - Parameters:
    ///   - string: The string
    ///   - dateFormat: The format
    ///   - dateFormatter: The formatter to be used
    init?(string: String,
          dateFormat: DateFormatType,
          dateFormatter: DateFormatter = Self.defaultDateFormatter) {
        self.init(string: string,
                  pattern: dateFormat.pattern,
                  dateFormatter: dateFormatter)
    }
}

/// Constants
private extension Date {
    
    /// All localized string tag.
    static let agoTag = "Ago"
    static let laterTag = "Later"
    static let spaceTag = "Space"
    static let nowTag = "Now"
    static let amSymbol = "AM"
    static let pmSymbol = "PM"

    /// Locale
    static let defaultLocaleIdentifier = "en_US_POSIX"
    
    /// System errors.
    static let precisionError = "The precision should be at least one."
    static let patternError = "The pattern is incorrect."
}

import Foundation

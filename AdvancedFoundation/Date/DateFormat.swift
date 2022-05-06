/// DateFormat defines the format of a date formatter.
///
/// - author: Adamas
/// - version: 1.8.0
/// - date: 26/04/2022
public protocol DateFormatType {

    /// The pattern that should be applied
    var pattern: String { get }
}

public enum DateFormat: String {
    case fullCalendarDate = "dd/MM/yyyy"
    case shortCalendarDate = "dd/MM/yy"
    case reversedDate = "yyyy-MM-dd"
    case fullDate = "dd MMMM yyyy"
    case abbrDate = "dd MMM yyyy"
    case expiryDate = "MM/yy"
    case formalDate = "MMM dd, yyyy"
    case utc = "yyyy-MM-dd'T'HH:mm:ss"
    case longUTC = "yyyy-MM-dd'T'HH:mm:ss.S"
    case zeroUTC = "yyyy-MM-dd'T'HH:mm:ssZ"
}

extension DateFormat: DateFormatType {

    public var pattern: String {
        rawValue
    }
}

import Foundation

/// Double+UnitFormattable provides format for unit strings.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 30/03/2019
public extension Double {
    
    /// The distance string presenting the distance.
    ///
    /// - Parameters:
    ///   - precision: The precision of the string.
    ///   - shouldUseAbbr: Whether the unit should be abbr or not.
    /// - Returns: The distance streen
    func distanceString(withPrecision precision: Int? = nil, withAbbr shouldUseAbbr: Bool = true) -> String {
        let stringPattern: String
        if let precision = precision {
            stringPattern = String(format: Self.stringPattern, precision)
        } else {
            stringPattern = Self.defaultPattern
        }
        let isMoreThanAKilometer = self >= Self.kilometer
        let unit = isMoreThanAKilometer ? self / Self.kilometer : self
        var unitTag: String
        switch (isMoreThanAKilometer, shouldUseAbbr, unit >= 2) {
        case (true, true, _):
            unitTag = Self.kilometerAbbrTag
        case (true, false, true):
            unitTag = Self.kilometersTag
        case (true, false, false):
            unitTag = Self.kilometerTag
        case (false, true, _):
            unitTag = Self.meterAbbrTag
        case (false, false, true):
            unitTag = Self.metersTag
        case (false, false, false):
            unitTag = Self.meterTag
        }
        unitTag = unitTag.localizedInternalString(forType: Self.self)
        let spaceTag = shouldUseAbbr ? String.empty : Self.spaceTag.localizedInternalString(forType: Self.self)
        return String(format: stringPattern, unit, spaceTag, unitTag)
    }
}

/// Constants
private extension Double {
    
    /// All localized string tag.
    static let spaceTag = "Space";
    static let meterTag = "Meter";
    static let metersTag = "Meters";
    static let kilometerTag = "Kilometer";
    static let kilometersTag = "Kilometers";
    static let meterAbbrTag = "MeterAbbr";
    static let kilometerAbbrTag = "KilometerAbbr";
    
    /// Patterns
    static let defaultPattern = "%f%@%@"
    static let stringPattern = "%%.%df%%@%%@"
    
    /// Units
    static let kilometer = 1000.0
}

import Foundation

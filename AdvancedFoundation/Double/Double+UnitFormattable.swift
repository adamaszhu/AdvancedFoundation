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
            stringPattern = String(format: Double.stringPattern, precision)
        } else {
            stringPattern = Double.defaultPattern
        }
        let isMoreThanAKilometer = self >= Double.kilometer
        let unit = isMoreThanAKilometer ? self / Double.kilometer : self
        var unitTag: String
        switch (isMoreThanAKilometer, shouldUseAbbr, unit >= 2) {
        case (true, true, _):
            unitTag = Double.kilometerAbbrTag
        case (true, false, true):
            unitTag = Double.kilometersTag
        case (true, false, false):
            unitTag = Double.kilometerTag
        case (false, true, _):
            unitTag = Double.meterAbbrTag
        case (false, false, true):
            unitTag = Double.metersTag
        case (false, false, false):
            unitTag = Double.meterTag
        }
        unitTag = unitTag.localizedInternalString(forType: Double.self)
        let spaceTag = shouldUseAbbr ? String.empty : Double.spaceTag.localizedInternalString(forType: Double.self)
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

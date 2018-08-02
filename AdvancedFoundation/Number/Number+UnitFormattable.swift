/// Number+UnitFormattable provides format for unit strings.
///
/// - author: Adamas
/// - version: 1.3.0
/// - date: 18/01/2018
public extension NSNumber {
    
    /// All localized string tag.
    private static let spaceTag = "Space";
    private static let meterTag = "Meter";
    private static let metersTag = "Meters";
    private static let kilometerTag = "Kilometer";
    private static let kilometersTag = "Kilometers";
    private static let meterAbbrTag = "MeterAbbr";
    private static let kilometerAbbrTag = "KilometerAbbr";
    
    /// Patterns
    private static let defaultPattern = "%f%@%@"
    private static let stringPattern = "%%.%df%%@%%@"
    
    /// Units
    private static let kilometer = 1000.0
    
    /// The distance string presenting the distance.
    ///
    /// - Parameters:
    ///   - precision: The precision of the string.
    ///   - shouldUseAbbr: Whether the unit should be abbr or not.
    /// - Returns: The distance streen
    public func distanceString(withPrecision precision: Int? = nil, withAbbr shouldUseAbbr: Bool = true) -> String {
        let stringPattern: String
        if let precision = precision {
            stringPattern = String(format: NSNumber.stringPattern, precision)
        } else {
            stringPattern = NSNumber.defaultPattern
        }
        let isMoreThanAKilometer = doubleValue >= NSNumber.kilometer
        let unit = isMoreThanAKilometer ? doubleValue / NSNumber.kilometer : doubleValue
        var unitTag: String
        switch (isMoreThanAKilometer, shouldUseAbbr, unit >= 2) {
        case (true, true, _):
            unitTag = NSNumber.kilometerAbbrTag
        case (true, false, true):
            unitTag = NSNumber.kilometersTag
        case (true, false, false):
            unitTag = NSNumber.kilometerTag
        case (false, true, _):
            unitTag = NSNumber.meterAbbrTag
        case (false, false, true):
            unitTag = NSNumber.metersTag
        case (false, false, false):
            unitTag = NSNumber.meterTag
        }
        unitTag = unitTag.localizedInternalString(forType: NSNumber.self)
        let spaceTag = shouldUseAbbr ? String.empty : NSNumber.spaceTag.localizedInternalString(forType: NSNumber.self)
        return String(format: stringPattern, unit, spaceTag, unitTag)
    }
    
}

import Foundation

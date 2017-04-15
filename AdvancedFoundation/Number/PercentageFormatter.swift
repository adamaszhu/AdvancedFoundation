/**
 * PercentageFormatter is used to format a number into a percentage format.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 14/04/2017
 */

public extension NSNumber {
    
    /**
     * System message.
     */
    private static let formatError = "The string doesn't have correct format."
    private static let precisionError = "The precision parameter is incorrect."
    
    /**
     * Print the number as a percentage. For example, 12.3%.
     * - parameter precision: The precision spedified. If it is nil, the original value will be returned.
     * - returns: The formatted string.
     */
    public func convertToPercentageString(withPrecision precision: Int? = nil) -> String? {
        if (precision != nil) && (precision! < 0) {
            Logger.logError(NSNumber.precisionError, withDetail: precision)
            return nil
        }
        let number = NSNumber(value: doubleValue * Double(100))
        let decimalString = number.convertToDecimalString(withPrecision: precision)
        if decimalString == nil {
            return nil
        }
        return decimalString! + "%"
    }
    
    /**
     * Read a percent string.
     * - parameter percentString: The string to be rendered.
     * - returns: The string.
     */
    public static func renderPercentageString(_ percentageString: String) -> NSNumber? {
        if !percentageString.contains("%") {
            Logger.logError(NSNumber.formatError, withDetail: percentageString)
            return nil
        }
        let formattedPercentageString = percentageString.replacingOccurrences(of: "%", with: "")
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        let number = formatter.number(from: formattedPercentageString)
        if number == nil {
            Logger.logError(NSNumber.formatError, withDetail: percentageString)
            return nil
        }
        return NSNumber(value: number!.doubleValue / Double(100))
    }
    
}


import Foundation

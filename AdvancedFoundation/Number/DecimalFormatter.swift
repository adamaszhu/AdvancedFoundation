/**
 * DecimalFormatter is used to format a number into a decimal format.
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
     * Print the decimal number with specific precision. For example, 12.3.
     * - parameter precision: The precision spedified. If it is nil, the original value will be returned.
     * - returns: The formatted string.
     */
    public func convertToDecimalString(withPrecision precision: Int? = nil) -> String? {
        if (precision != nil) && (precision! < 0) {
            Logger.logError(NSNumber.precisionError, withDetail: precision)
            return nil
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        if precision != nil {
            numberFormatter.maximumFractionDigits = precision!
            numberFormatter.roundingMode = .down
        }
        let decimalString = numberFormatter.string(from: self)
        if decimalString == nil {
            Logger.logError(NSNumber.formatError)
            return nil
        }
        return decimalString!
    }
    
}


import Foundation

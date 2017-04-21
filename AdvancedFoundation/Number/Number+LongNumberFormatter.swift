/**
 * Number+LongNumberFormatter is used to format a number into a long number string.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 14/04/2017
 */

public extension NSNumber {
    
    /**
     * System message.
     */
    private static let formatError = "The string doesn't have correct format."
    
    /**
     * Read a long number string.
     * - parameter longNumberString: The string to be rendered.
     * - returns: The number.
     */
    public static func renderLongNumberString(_ longNumberString: String) -> NSNumber? {
        // TODO: Validate the comma format.
        let formattedLongNumberString = longNumberString.replacingOccurrences(of: ",", with: "")
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        guard let number = formatter.number(from: formattedLongNumberString) else {
            Logger.standard.logError(formatError, withDetail: longNumberString)
            return nil
        }
        return number
    }
    
}


import Foundation

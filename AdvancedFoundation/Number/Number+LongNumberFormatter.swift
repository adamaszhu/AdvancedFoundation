/// Number+LongNumberFormatter is used to format a number into a long number string.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 12/07/2017
public extension NSNumber {
    
    /// System message.
    private static let numberFormatError = "The string doesn't have correct format."
    
    /// Symbols.
    private static let commaSymbol = ","
    
    /// Read a long number string.
    ///
    /// - Parameter longNumber: The string to be rendered.
    /// - Returns: The number.
    public static func number(fromLongNumber longNumber: String) -> NSNumber? {
        // TODO: Validate the comma format.
        let formattedLongNumberString = longNumber.replacingOccurrences(of: NSNumber.commaSymbol, with: "")
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        guard let number = formatter.number(from: formattedLongNumberString) else {
            Logger.standard.log(error: NSNumber.numberFormatError, withDetail: longNumber)
            return nil
        }
        return number
    }
    
}


import Foundation

/// Number+LongNumberFormattable is used to format a number into a long number string.
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
    @objc public convenience init?(longNumber: String) {
        // TODO: Validate the comma format.
        let formattedLongNumberString = longNumber.replacingOccurrences(of: NSNumber.commaSymbol, with: String.empty)
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        guard let number = formatter.number(from: formattedLongNumberString) else {
            Logger.standard.logError(NSNumber.numberFormatError, withDetail: longNumber)
            return nil
        }
        self.init(value: number.doubleValue)
    }
    
}


import Foundation

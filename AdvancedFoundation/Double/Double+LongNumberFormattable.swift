/// Double+LongNumberFormattable is used to format a number into a long number string.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 30/03/2019
public extension Double {
    
    /// Read a long number string.
    ///
    /// - Parameter longNumber: The string to be rendered.
    init?(longNumber: String) {
        // TODO: Validate the comma format.
        let formattedLongNumberString = longNumber.replacingOccurrences(of: Double.commaSymbol, with: String.empty)
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        guard let number = formatter.number(from: formattedLongNumberString) else {
            Logger.standard.logError(Double.numberFormatError, withDetail: longNumber)
            return nil
        }
        self = number.doubleValue
    }
}

private extension Double {
    
    /// System message.
    static let numberFormatError = "The string doesn't have correct format."
    
    /// Symbols.
    static let commaSymbol = ","
}

import Foundation

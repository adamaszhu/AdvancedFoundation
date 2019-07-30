/// Double+DecimalFormattable is used to format a number into a decimal format.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 30/03/2019
public extension Double {
    
    /// Print the decimal number with specific precision. For example, 12.3.
    ///
    /// - Parameter precision: The precision spedified. If it is nil, the original value will be returned.
    /// - Returns: The formatted string.
    func decimalString(withPrecision precision: Int? = nil) -> String? {
        if let positivePrecision = precision, positivePrecision < 0 {
            Logger.standard.logError(Double.precisionError, withDetail: precision)
            return nil
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        if let positivePrecision = precision {
            numberFormatter.maximumFractionDigits = positivePrecision
            numberFormatter.roundingMode = .down
        }
        guard let decimalString = numberFormatter.string(from: NSNumber(value: self)) else {
            Logger.standard.logError(Double.numberFormatError)
            return nil
        }
        return decimalString
    }
}

/// Constants
private extension Double {
    
    /// System message.
    static let numberFormatError = "The string doesn't have correct format."
    static let precisionError = "The precision parameter is incorrect."
}

import Foundation

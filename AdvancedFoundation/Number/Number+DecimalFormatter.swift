/// Number+DecimalFormatter is used to format a number into a decimal format.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 12/07/2017
public extension NSNumber {
    
    /// System message.
    private static let numberFormatError = "The string doesn't have correct format."
    private static let precisionError = "The precision parameter is incorrect."
    
    /// Print the decimal number with specific precision. For example, 12.3.
    ///
    /// - Parameter precision: The precision spedified. If it is nil, the original value will be returned.
    /// - Returns: The formatted string.
    public func decimalString(withPrecision precision: Int? = nil) -> String? {
        if let positivePrecision = precision, positivePrecision < 0 {
            Logger.standard.log(error: NSNumber.precisionError, withDetail: precision)
            return nil
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        if let positivePrecision = precision {
            numberFormatter.maximumFractionDigits = positivePrecision
            numberFormatter.roundingMode = .down
        }
        guard let decimalString = numberFormatter.string(from: self) else {
            Logger.standard.log(error: NSNumber.numberFormatError)
            return nil
        }
        return decimalString
    }
    
}


import Foundation

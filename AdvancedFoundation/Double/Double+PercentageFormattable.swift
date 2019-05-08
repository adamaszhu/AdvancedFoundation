/// Double+PercentageFormattable is used to format a number into a percentage format.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 30/03/2019
public extension Double {
    
    /// Print the number as a percentage. For example, 12.3%.
    ///
    /// - Rarameter precision: The precision spedified. If it is nil, the original value will be returned.
    /// - Returns: The formatted string.
    public func percentageString(withPrecision precision: Int? = nil) -> String? {
        if let positivePrecision = precision, positivePrecision < 0 {
            Logger.standard.logError(Double.precisionError, withDetail: precision)
            return nil
        }
        let number = self * 100
        guard let decimalString = number.decimalString(withPrecision: precision) else {
            return nil
        }
        return decimalString + Double.percentageSymbol
    }
    
    /// Read a percent string.
    ///
    /// - Parameter percentage: The string to be rendered.
    public init?(percentage: String) {
        guard percentage.contains(Double.percentageSymbol) else {
            Logger.standard.logError(Double.numberFormatError, withDetail: percentage)
            return nil
        }
        let formattedPercentageString = percentage.replacingOccurrences(of: Double.percentageSymbol, with: String.empty)
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        guard let number = formatter.number(from: formattedPercentageString) else {
            Logger.standard.logError(Double.numberFormatError, withDetail: percentage)
            return nil
        }
        self = number.doubleValue / 100
    }
    
}

/// Constants
private extension Double {
    
    /// System message.
    static let numberFormatError = "The string doesn't have correct format."
    static let precisionError = "The precision parameter is incorrect."
    
    /// Symbols.
    static let percentageSymbol = "%"
}


import Foundation

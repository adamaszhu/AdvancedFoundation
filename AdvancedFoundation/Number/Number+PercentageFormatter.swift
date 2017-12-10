/// Number+PercentageFormatter is used to format a number into a percentage format.
///
/// - author: Adamas
/// - version: 1.1.8
/// - date: 08/12/2017
public extension NSNumber {
    
    /// System message.
    private static let numberFormatError = "The string doesn't have correct format."
    private static let precisionError = "The precision parameter is incorrect."
    
    /// Symbols.
    private static let percentageSymbol = "%"
    
    /// Print the number as a percentage. For example, 12.3%.
    ///
    /// - Rarameter precision: The precision spedified. If it is nil, the original value will be returned.
    /// - Returns: The formatted string.
    public func percentageString(withPrecision precision: Int? = nil) -> String? {
        if let positivePrecision = precision, positivePrecision < 0 {
            Logger.standard.log(error: NSNumber.precisionError, withDetail: precision)
            return nil
        }
        let number = NSNumber(value: doubleValue * Double(100))
        guard let decimalString = number.decimalString(withPrecision: precision) else {
            return nil
        }
        return decimalString + NSNumber.percentageSymbol
    }
    
    /// Read a percent string.
    ///
    /// - Parameter percentage: The string to be rendered.
    @objc public convenience init?(percentage: String) {
        guard percentage.contains(NSNumber.percentageSymbol) else {
            Logger.standard.log(error: NSNumber.numberFormatError, withDetail: percentage)
            return nil
        }
        let formattedPercentageString = percentage.replacingOccurrences(of: NSNumber.percentageSymbol, with: String.empty)
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        guard let number = formatter.number(from: formattedPercentageString) else {
            Logger.standard.log(error: NSNumber.numberFormatError, withDetail: percentage)
            return nil
        }
        self.init(value: number.doubleValue / Double(100))
    }
    
}


import Foundation

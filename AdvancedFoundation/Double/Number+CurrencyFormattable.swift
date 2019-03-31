/// Number+CurrencyFormattable is used to format a number into currency string.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 30/03/2019
public extension NSNumber {
    
    /// System message.
    private static let numberFormatError = "The string doesn't have correct format."
    
    /// Symbols.
    public static let dollarSymbol = "$"
    private static let positiveSymbol = "+"
    private static let unlimitedSymbol = "∞"
    private static let dotSymbol = "."
    
    /// Print the number as a string using money format. For example, $1,000,000.00.
    ///
    /// - Parameter shouldDisplayCent: Whether the cent should be displayed or not.
    /// - Returns: The formatted string.
    @objc public func moneyString(withCent shouldDisplayCent: Bool = false, withCurrencySymbol currencySymbol: String = dollarSymbol) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.currencySymbol = currencySymbol
        numberFormatter.numberStyle = NumberFormatter.Style.currency
        guard var moneyString = numberFormatter.string(from: self) else {
            Logger.standard.logError(NSNumber.numberFormatError, withDetail: self)
            return nil
        }
        guard moneyString != "\(NSNumber.positiveSymbol)\(NSNumber.unlimitedSymbol)" else {
            return NSNumber.unlimitedSymbol
        }
        if !shouldDisplayCent && moneyString.contains(NSNumber.dotSymbol),
            let dotIndex = moneyString.range(of: NSNumber.dotSymbol)?.lowerBound {
            moneyString = .init(moneyString[..<dotIndex])
        }
        return moneyString
    }
    
}

/// Constants
private extension NSNumber {
    
}


import Foundation

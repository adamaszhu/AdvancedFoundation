/// Double+CurrencyFormattable is used to format a number into currency string.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 30/03/2019
public extension Double {
    
    /// Symbols.
    static let dollarSymbol = "$"
    
    /// Print the number as a string using money format. For example, $1,000,000.00.
    ///
    /// - Parameter shouldDisplayCent: Whether the cent should be displayed or not.
    /// - Returns: The formatted string.
    func moneyString(withCent shouldDisplayCent: Bool = false, withCurrencySymbol currencySymbol: String = dollarSymbol) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.currencySymbol = currencySymbol
        numberFormatter.numberStyle = NumberFormatter.Style.currency
        guard var moneyString = numberFormatter.string(from: NSNumber(value: self)) else {
            Logger.standard.logError(Self.numberFormatError, withDetail: self)
            return nil
        }
        guard moneyString != Self.positiveSymbol + Self.unlimitedSymbol else {
            return Self.unlimitedSymbol
        }
        if !shouldDisplayCent && moneyString.contains(Self.dotSymbol),
            let dotIndex = moneyString.range(of: Self.dotSymbol)?.lowerBound {
            moneyString = String(moneyString[..<dotIndex])
        }
        return moneyString.replacingOccurrences(of: Self.space, with: String.empty)
    }
}

/// Constants
private extension Double {
    
    /// System message.
    static let numberFormatError = "The string doesn't have correct format."

    /// The space between the customized currency symbol and the currency since iOS 13
    /// REF: https://developer.apple.com/forums/thread/124911
    static let space = " "
    
    /// Symbols.
    static let positiveSymbol = "+"
    static let unlimitedSymbol = "∞"
    static let dotSymbol = "."
}

import Foundation

/**
 * Number+CurrencyFormatter is used to format a number into currency string.
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
     * Symbols.
     */
    private static let dollarSymbol = "$"
    private static let positiveSymbol = "+"
    private static let unlimitedSymbol = "∞"
    private static let dotSymbol = "."
    
    /**
     * Print the number as a string using money format. For example, $1,000,000.00.
     * - parameter shouldDisplayCent: Whether the cent should be displayed or not.
     * - returns: The formatted string.
     */
    public func convertToMoneyString(withCent shouldDisplayCent: Bool = false, withCurrencySymbol currencySymbol: String = dollarSymbol) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.currencySymbol = currencySymbol
        numberFormatter.numberStyle = NumberFormatter.Style.currency
        guard var moneyString = numberFormatter.string(from: self) else {
            Logger.standard.log(error: NSNumber.formatError, withDetail: self)
            return nil
        }
        if moneyString == "\(NSNumber.positiveSymbol)\(NSNumber.unlimitedSymbol)" {
            return NSNumber.unlimitedSymbol
        }
        if !shouldDisplayCent && moneyString.contains(NSNumber.dotSymbol) {
            let dotIndex = moneyString.range(of: NSNumber.dotSymbol)!.lowerBound
            moneyString = moneyString.substring(to: dotIndex)
        }
        return moneyString
    }
    
}


import Foundation

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
     * Print the number as a string using money format. For example, $1,000,000.00.
     * - parameter shouldDisplayCent: Whether the cent should be displayed or not.
     * - returns: The formatted string.
     */
    public func convertToMoneyString(withCent shouldDisplayCent: Bool = false, withCurrencySymbol currencySymbol: String = "$") -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.currencySymbol = currencySymbol
        numberFormatter.numberStyle = NumberFormatter.Style.currency
        var moneyString = numberFormatter.string(from: self)
        if moneyString == nil {
            Logger.standard.logError(NSNumber.formatError, withDetail: self)
            return nil
        }
        if moneyString == "+∞" {
            moneyString = "∞"
        }
        if !shouldDisplayCent && moneyString!.contains(".") {
            let dotIndex = moneyString!.range(of: ".")!.lowerBound
            moneyString = moneyString!.substring(to: dotIndex)
        }
        return moneyString!
    }
    
}


import Foundation

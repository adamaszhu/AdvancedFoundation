/// Double+CurrencyFormattable is used to format a number into currency string.
///
/// - author: Adamas
/// - version: 1.8.0
/// - date: 28/04/2022
public extension Double {

    /// Default currency formatter
    static let defaultCurrencyFormatter = NumberFormatterFactory.currencyFormatter(for: .english)

    /// Get the cent part of the currency string
    ///
    /// - Parameter numberFormatter: The number formatter to use.
    /// - Returns: The cent string
    func centString(numberFormatter: NumberFormatter = Self.defaultCurrencyFormatter) -> String? {
        let currencyString = self.currencyString(withCent: true,
                                                 numberFormatter: numberFormatter)?
            .replacingOccurrences(of: numberFormatter.currencySymbol, with: String.empty)
        guard let centString = currencyString?.components(separatedBy: Self.dot).last else {
            Logger.standard.logError(Self.numberFormatError, withDetail: self)
            return nil
        }
        return centString
    }

    /// Get the dollar part of the currency string
    ///
    /// - Parameter numberFormatter: The number formatter to use.
    /// - Returns: The dollar string
    func dollarString(numberFormatter: NumberFormatter = Self.defaultCurrencyFormatter) -> String? {
        let currencyString = self.currencyString(withCent: true,
                                                 numberFormatter: numberFormatter)?
            .replacingOccurrences(of: numberFormatter.currencySymbol, with: String.empty)
        guard let dollarString = currencyString?.components(separatedBy: Self.dot).first else {
            Logger.standard.logError(Self.numberFormatError, withDetail: self)
            return nil
        }
        return dollarString
    }

    /// Print the number as a string using money format. For example, $1,000,000.00.
    ///
    /// - Parameters:
    ///   - shouldDisplayCent: Whether the cent should be displayed or not. Nil will apply the cent dynamically.
    ///   - numberFormatter: The number formatter to use.
    /// - Returns: The formatted string.
    func currencyString(withCent shouldDisplayCent: Bool? = nil,
                        numberFormatter: NumberFormatter = Self.defaultCurrencyFormatter) -> String? {
        let number = NSNumber(value: self)
        var hasCent = self != Double(Int(self))
        hasCent = shouldDisplayCent ?? hasCent
        let fractionDigits = hasCent ? Self.doubleCurrencyDigits : Self.intCurrencyDigits
        numberFormatter.maximumFractionDigits = fractionDigits
        numberFormatter.minimumFractionDigits = fractionDigits
        guard let currencyString = numberFormatter.string(from: number) else {
            Logger.standard.logError(Self.numberFormatError, withDetail: self)
            return nil
        }
        return currencyString
    }

    /// Read a currency string.
    ///
    /// - Parameters:
    ///   - currency: The string to be rendered.
    ///   - numberFormatter: The number format used to detect the currency string
    init?(currency: String,
          numberFormatter: NumberFormatter = Self.defaultCurrencyFormatter) {
        guard let currency = numberFormatter.number(from: currency) else {
            Logger.standard.logInfo(Self.numberFormatError, withDetail: currency)
            return nil
        }
        self = currency.doubleValue
    }
}

/// Constants
extension Double {
    
    /// System message.
    static let numberFormatError = "The string doesn't have correct format."

    /// Digits
    static let intCurrencyDigits = 0
    static let doubleCurrencyDigits = 2
}

/// Constants
private extension Double {

    /// Symbol
    static let dot = "."
}

import Foundation

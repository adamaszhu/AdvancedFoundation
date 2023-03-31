/// Double+PercentageFormattable is used to format a number into a percentage format.
///
/// - author: Adamas
/// - version: 1.8.0
/// - date: 28/04/2022
public extension Double {

    // Default percentage formatter
    static let defaultPercentageFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        numberFormatter.roundingMode = .down
        numberFormatter.minimumFractionDigits = Self.intCurrencyDigits
        return numberFormatter
    }()

    /// Print the number as a percentage. For example, 12.3%.
    /// - Parameters:
    ///   - precision: The precision spedified. If it is nil, the precision will be default to 2 digits.
    ///   - numberFormatter: The number formatter used.
    /// - Returns: The formatted string.
    func percentageString(withPrecision precision: Int? = nil,
                          numberFormatter: NumberFormatter = Self.defaultPercentageFormatter) -> String? {
        if let positivePrecision = precision, positivePrecision < 0 {
            Logger.standard.logError(Self.precisionError, withDetail: precision)
            return nil
        }
        numberFormatter.maximumFractionDigits = precision ?? Self.doubleCurrencyDigits
        numberFormatter.generatesDecimalNumbers = precision != Self.intCurrencyDigits
        let number = NSNumber(value: self)
        guard let percentageString = numberFormatter.string(from: number) else {
            Logger.standard.logError(Self.numberFormatError)
            return nil
        }
        return percentageString
    }
    
    /// Read a percent string.
    ///
    /// - Parameter percentage: The string to be rendered.
    init?(percentage: String) {
        guard percentage.contains(Self.percentageSymbol) else {
            Logger.standard.logError(Self.numberFormatError, withDetail: percentage)
            return nil
        }
        let formattedPercentageString = percentage.replacingOccurrences(of: Self.percentageSymbol, with: String.empty)
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        guard let number = formatter.number(from: formattedPercentageString) else {
            Logger.standard.logError(Self.numberFormatError, withDetail: percentage)
            return nil
        }
        self = number.doubleValue / 100
    }
}

/// Constants
private extension Double {
    
    /// System message.
    static let precisionError = "The precision parameter is incorrect."
    
    /// Symbols.
    static let percentageSymbol = "%"
}

import Foundation

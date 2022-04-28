/// Double+LongNumberFormattable is used to format a number into a long number string.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 30/03/2019
public extension Double {

    /// Default long number formatter
    static let longNumberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingMode = .down
        formatter.maximumFractionDigits = Self.doubleCurrencyDigits
        return formatter
    }()

    /// Format the number into a readable number format.
    /// - Parameter numberFormatter: The number formatter applied.
    /// - Returns: The long number string.
    func longNumberString(numberFormatter: NumberFormatter = Self.longNumberFormatter) -> String? {
        let number = NSNumber(value: self)
        guard let longNumberString = numberFormatter.string(from: number) else {
            Logger.standard.logError(Self.numberFormatError, withDetail: self)
            return nil
        }
        return longNumberString
    }
    
    /// Read a long number string.
    ///
    /// - Parameter longNumber: The string to be rendered.
    init?(longNumber: String) {
        // TODO: Validate the comma format.
        let formattedLongNumberString = longNumber.replacingOccurrences(of: Self.commaSymbol, with: String.empty)
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        guard let number = formatter.number(from: formattedLongNumberString) else {
            Logger.standard.logError(Self.numberFormatError, withDetail: longNumber)
            return nil
        }
        self = number.doubleValue
    }
}

private extension Double {
    
    /// System message.
    static let numberFormatError = "The string doesn't have correct format."
    
    /// Symbols.
    static let commaSymbol = ","
}

import Foundation

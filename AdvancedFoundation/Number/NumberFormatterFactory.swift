/// Factory for generating number formatters.
///
/// - author: Adamas
/// - version: 1.10.0
/// - date: 11/08/2023
public struct NumberFormatterFactory {

    /// Create a currency formatter
    /// - Parameter language: The language that the formatter will use
    /// - Returns: The formatter
    public static func currencyFormatter(for language: Language) -> NumberFormatter {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.roundingMode = .down
        currencyFormatter.locale = Locale(language: language)
        return currencyFormatter
    }
}

import Foundation

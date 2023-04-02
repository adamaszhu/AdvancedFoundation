/// Percentage is used to define a double that presents a percentage value.
///
/// - author: Adamas
/// - version: 1.9.4
/// - date: 31/03/2023
@propertyWrapper
public struct Percentage {
    
    /// The number formatter used to format the value
    private let numberFormatter: NumberFormatter
    
    /// The percentage precision.
    private let precision: Int?
    
    public var wrappedValue: Double
    
    /// The constructor
    ///
    /// - Parameters:
    ///   - initialValue: The initial value consumed by the property wrapper
    ///   - precision: The precision spedified. If it is nil, the precision will be default to 2 digits.
    ///   - numberFormatter: The number formatter used. Default to Double.defaultPercentageFormatter
    public init(wrappedValue initialValue: Double,
                precision: Int? = nil,
                numberFormatter: NumberFormatter = Double.defaultPercentageFormatter) {
        self.numberFormatter = numberFormatter
        self.precision = precision
        self.wrappedValue = initialValue
    }
    
    public var projectedValue: String? {
        wrappedValue.percentageString(withPrecision: precision,
                                      numberFormatter: numberFormatter)
    }
}

import Foundation

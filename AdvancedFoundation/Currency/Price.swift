/// Price
///
/// - author: Adamas
/// - version: 1.9.10
/// - date: 02/09/2023
public struct Price: Equatable {

    /// The currency of the price
    public let currency: Currency

    /// The amount
    public let amount: Double

    /// Initialize the price
    /// - Parameters:
    ///   - currency: The currency of the price
    ///   - price: The amount
    public init(currency: Currency, amount: Double) {
        self.currency = currency
        self.amount = amount
    }
}

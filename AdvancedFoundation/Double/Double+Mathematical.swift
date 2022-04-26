/// Double+Mathematical provides mathematical support for a number.
///
/// - author: Adamas
/// - version: 1.8.0
/// - date: 14/04/2022
public extension Double {

    /// Round up the double to an integer.
    var roundedUp: Int {
        let int = Int(self)
        return Double(int) != self ? int + 1 : int
    }
}

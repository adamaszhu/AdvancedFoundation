/// JSONNode+Parser parses a node string into a JSONNode.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 12/07/2017
extension JSONNode {
    
    /// System error
    private static let pathFormatError = "The path is incorrect."
    
    /// Parse a node string with the format as name[index]
    ///
    /// - Parameter string: The string.
    /// - Returns: The JSONNode. Nil if the string has an unexpected format.
    static func node(from string: String) -> JSONNode? {
        let leftBracketIndex = string.range(of: "[")?.lowerBound
        let rightBracketIndex = string.range(of: "]")?.lowerBound
        if (leftBracketIndex == nil) && (rightBracketIndex == nil) {
            return JSONNode(name: string)
        }
        guard var realLeftBracketIndex = leftBracketIndex, let realRightBracketIndex = rightBracketIndex, realLeftBracketIndex < realRightBracketIndex else {
            Logger.standard.log(error: JSONNode.pathFormatError, withDetail: string)
            return nil
        }
        let name = string.substring(to: realLeftBracketIndex)
        realLeftBracketIndex = string.index(realLeftBracketIndex, offsetBy: 1)
        let indexRange = Range<String.Index>(uncheckedBounds: (lower: realLeftBracketIndex, upper: realRightBracketIndex))
        guard let index = Int(string.substring(with: indexRange)) else {
            Logger.standard.log(error: JSONNode.pathFormatError, withDetail: string)
            return nil
        }
        return JSONNode(name: name, index: index)
    }
    
}

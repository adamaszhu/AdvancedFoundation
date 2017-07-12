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
    /// - Parameter nodePath: The string.
    /// - Returns: The JSONNode. Nil if the string has an unexpected format.
    static func parse(nodePath: String) -> JSONNode? {
        let leftBracketIndex = nodePath.range(of: "[")?.lowerBound
        let rightBracketIndex = nodePath.range(of: "]")?.lowerBound
        if (leftBracketIndex == nil) && (rightBracketIndex == nil) {
            return JSONNode(name: nodePath)
        }
        guard var realLeftBracketIndex = leftBracketIndex, let realRightBracketIndex = rightBracketIndex, realLeftBracketIndex < realRightBracketIndex else {
            Logger.standard.log(error: JSONNode.pathFormatError, withDetail: nodePath)
            return nil
        }
        let name = nodePath.substring(to: realLeftBracketIndex)
        realLeftBracketIndex = nodePath.index(realLeftBracketIndex, offsetBy: 1)
        let indexRange = Range<String.Index>(uncheckedBounds: (lower: realLeftBracketIndex, upper: realRightBracketIndex))
        guard let index = Int(nodePath.substring(with: indexRange)) else {
            Logger.standard.log(error: JSONNode.pathFormatError, withDetail: nodePath)
            return nil
        }
        return JSONNode(name: name, index: index)
    }
    
}

/// JSONNode+Parsable parses a node string into a JSONNode.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 26/03/2019
extension JSONNode {
    
    /// Parse a node string with the format as name[index]
    ///
    /// - Parameter path: The string.
    init?(path: String) {
        let foundLeftBracketIndex = path.range(of: String.leftSquareBracket)?.lowerBound
        let foundRightBracketIndex = path.range(of: String.rightSquareBracket)?.lowerBound
        if foundLeftBracketIndex == nil, foundRightBracketIndex == nil {
            self.init(name: path, index: nil)
            return
        }
        guard var leftBracketIndex = foundLeftBracketIndex, let rightBracketIndex = foundRightBracketIndex, leftBracketIndex < rightBracketIndex else {
            Logger.standard.logError(JSONNode.pathFormatError, withDetail: path)
            return nil
        }
        let name = String(path[..<leftBracketIndex])
        leftBracketIndex = path.index(leftBracketIndex, offsetBy: 1)
        let indexRange = Range<String.Index>(uncheckedBounds: (lower: leftBracketIndex, upper: rightBracketIndex))
        guard let index = Int(String(path[indexRange])) else {
            Logger.standard.logError(JSONNode.pathFormatError, withDetail: path)
            return nil
        }
        self.init(name: name, index: index)
    }
}

/// Constants
private extension JSONNode {
    
    /// System error
    static let pathFormatError = "The path is incorrect."
}

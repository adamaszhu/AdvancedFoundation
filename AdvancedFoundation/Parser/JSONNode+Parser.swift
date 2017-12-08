/// JSONNode+Parser parses a node string into a JSONNode.
///
/// - author: Adamas
/// - version: 1.1.8
/// - date: 08/12/2017
extension JSONNode {
    
    /// System error
    private static let pathFormatError = "The path is incorrect."
    
    /// Parse a node string with the format as name[index]
    ///
    /// - Parameter path: The string.
    init?(path: String) {
        let leftBracketIndex = path.range(of: "[")?.lowerBound
        let rightBracketIndex = path.range(of: "]")?.lowerBound
        var actualPath: String
        var actualIndex: Int?
        if leftBracketIndex == nil, rightBracketIndex == nil {
            actualPath = path
        } else {
            guard var realLeftBracketIndex = leftBracketIndex, let realRightBracketIndex = rightBracketIndex, realLeftBracketIndex < realRightBracketIndex else {
                Logger.standard.log(error: JSONNode.pathFormatError, withDetail: path)
                return nil
            }
            let name = path.substring(to: realLeftBracketIndex)
            realLeftBracketIndex = path.index(realLeftBracketIndex, offsetBy: 1)
            let indexRange = Range<String.Index>(uncheckedBounds: (lower: realLeftBracketIndex, upper: realRightBracketIndex))
            guard let index = Int(path.substring(with: indexRange)) else {
                Logger.standard.log(error: JSONNode.pathFormatError, withDetail: path)
                return nil
            }
            actualPath = name
            actualIndex = index
        }
        self.init(name: actualPath, index: actualIndex)
    }
    
}

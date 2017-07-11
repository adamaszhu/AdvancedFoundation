/**
 * JSONNode+Parser parses a node string into a JSONNode.
 * - author: Adamas
 * - version: 1.0.1
 * - date: 29/04/2017
 */
extension JSONNode {
    
    /**
     * System error
     */
    private static let pathError = "The path is incorrect."
    
    /**
     * Parse a node string with the format as name[index]
     * - parameter string: The string.
     * - returns: The JSONNode. Nil if the string has an unexpected format.
     */
    static func parse(_ string: String) -> JSONNode? {
        let leftBracketIndex = string.range(of: "[")?.lowerBound
        let rightBracketIndex = string.range(of: "]")?.lowerBound
        if (leftBracketIndex == nil) && (rightBracketIndex == nil) {
            return JSONNode(name: string)
        }
        guard var realLeftBracketIndex = leftBracketIndex else {
            Logger.standard.log(error: JSONNode.pathError, withDetail: string)
            return nil
        }
        guard let realRightBracketIndex = rightBracketIndex else {
            Logger.standard.log(error: JSONNode.pathError, withDetail: string)
            return nil
        }
        guard realLeftBracketIndex < realRightBracketIndex else {
            Logger.standard.log(error: JSONNode.pathError, withDetail: string)
            return nil
        }
        let name = string.substring(to: realLeftBracketIndex)
        realLeftBracketIndex = string.index(realLeftBracketIndex, offsetBy: 1)
        let indexRange = Range<String.Index>(uncheckedBounds: (lower: realLeftBracketIndex, upper: realRightBracketIndex))
        guard let index = Int(string.substring(with: indexRange)) else {
            Logger.standard.log(error: JSONNode.pathError, withDetail: string)
            return nil
        }
        return JSONNode(name: name, index: index)
    }
    
}

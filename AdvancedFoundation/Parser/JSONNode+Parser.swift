/**
 * JSONNode+Parser parses a node string into a JSONNode.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 29/04/2017
 */
extension JSONNode {
    
    /**
     * Parse a node string with the format as name[index]
     * - parameter string: The string.
     * - returns: The JSONNode. Nil if the string has an unexpected format.
     */
    static func parseString(_ string: String) -> JSONNode? {
        let leftBracketIndex = string.range(of: "[")?.lowerBound
        let rightBracketIndex = string.range(of: "]")?.lowerBound
        if (leftBracketIndex == nil) && (rightBracketIndex == nil) {
            return JSONNode(name: string)
        }
        if (rightBracketIndex != nil) && (leftBracketIndex != nil) && (rightBracketIndex! > leftBracketIndex!) {
            let name = string.substring(to: leftBracketIndex!)
            let leftBracketIndex = string.index(leftBracketIndex!, offsetBy: 1)
            let indexRange = Range<String.Index>(uncheckedBounds: (lower: leftBracketIndex, upper: rightBracketIndex!))
            guard let index = Int(string.substring(with: indexRange)) else {
                return nil
            }
            return JSONNode(name: name, index: index)
        }
        return nil
    }
    
}

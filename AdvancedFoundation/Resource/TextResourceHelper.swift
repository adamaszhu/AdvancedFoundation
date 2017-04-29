/**
 * TextResourceHelper provides support for a text resource file.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 29/04/2017
 */
public class TextResourceHelper: ResourceHelper {
    
    /**
     * Get the content as a string.
     * - returns: The string content. Nil if the resource doesn't exist. Or it is not a string file.
     */
    public func getContent() -> String? {
        if !isExisted {
            return nil
        }
        do {
            return try String(contentsOf: url!)
        } catch let error {
            Logger.standard.logError(error)
            return nil
        }
    }
    
}

import Foundation

/// TextResourceHelper provides support for a text resource file.
///
/// - author: Adamas
/// - version: 1.1.3
/// - date: 12/09/2017
final public class TextResourceHelper: ResourceHelper {
    
    /// The content as a string.
    public var content: String? {
        do {
            return try String(contentsOf: url)
        } catch let error {
            Logger.standard.log(error)
            return nil
        }
    }
    
}

import Foundation

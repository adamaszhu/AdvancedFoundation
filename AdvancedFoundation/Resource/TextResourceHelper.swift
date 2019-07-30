/// TextResourceHelper provides support for a text resource file.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 23/03/2019
open class TextResourceHelper: ResourceHelper {
    
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

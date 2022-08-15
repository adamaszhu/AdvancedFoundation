/// Encodable+Presentable enocdes an encodable object into strings
///
/// - author: Adamas
/// - version: 1.9.2
/// - date: 06/07/2022
public extension Encodable {

    /// Encode the object into a JSON string
    var jsonString: String? {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(self)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            return nil
        }
    }
}

import Foundation

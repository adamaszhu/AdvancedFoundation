/// FileHelper is used to perform file related action.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 12/07/2017
public class FileHelper: PathHelper {
    
    /// The data of a file. Nil if the file doesn't exists or there is an error.
    public var content: Data? {
        guard isExisted else {
            return nil
        }
        return contents(atPath: path)
    }
    
    /// Create a file in the path.
    ///
    /// - Parameter data: The data used to create the file.
    /// - Returns: whether the file has been created or not. Nil if there is an error.
    public func create(with data: Data) -> Bool? {
        guard !super.isExisted else {
            return false
        }
        guard createParentDirectory() == true else {
            return nil
        }
        return createFile(atPath: path, contents: data)
    }
    
    /// Whether the file exists or not.
    public override var isExisted: Bool {
        guard super.isExisted else {
            return false
        }
        var isDictory: ObjCBool = false
        fileExists(atPath: path, isDirectory: &isDictory)
        return !isDictory.boolValue
    }
    
}

import Foundation


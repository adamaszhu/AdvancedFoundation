/**
 * FileHelper is used to perform file related action.
 * - version: 1.0.0.
 * - date: 26/10/2016
 * - author: Adamas
 */
public class FileHelper: PathHelper {
    
    /**
     * The data of a file. Nil if the file doesn't exists or there is an error.
     */
    public var content: Data? {
        guard isExisted else {
            return nil
        }
        return contents(atPath: path)
    }
    
    /**
     * Create a file in the path.
     * - parameter data: The data used to create the file.
     * - returns: whether the file has been created or not. Nil if there is an error.
     */
    public func create(with data: Data) -> Bool? {
        guard !super.isExisted else {
            return false
        }
        guard createParentDirectory() == true else {
            return nil
        }
        return createFile(atPath: path, contents: data)
    }
    
    /**
     * PathHelper.
     */
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


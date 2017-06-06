/**
 * FileHelper is used to perform file related action.
 * - version: 1.0.1
 * - date: 26/10/2016
 * - author: Adamas
 */
public class FileHelper: PathHelper {
    
    /**
     * System warning.
     */
    private static let contentNotExistingWarning = "The file doesn't exist."
    private static let createExistingWarning = "The file to be created exists."
    
    /**
     * The data of a file. Nil if the file doesn't exists or there is an error.
     */
    public var content: Data? {
        guard isExisted else {
            Logger.standard.logWarning(FileHelper.contentNotExistingWarning, withDetail: path)
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
            Logger.standard.logWarning(FileHelper.createExistingWarning, withDetail: path)
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


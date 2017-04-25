/**
 * FileHelper is used to perform file related action.
 * - version: 1.0.0.
 * - date: 26/10/2016
 * - author: Adamas
 */
public class FileHelper: PathHelper {
    
    /**
     * Create a file in the path.
     * - parameter data: The data used to create the file.
     * - returns: whether the file has been created or not. Nil if there is an error.
     */
    public func create(withData data: Data) -> Bool? {
        if isExisted {
            return false
        }
        do {
            try createFile(atPath: path, contents: data)
            return true
        } catch let error {
            Logger.standard.logError(error)
            return nil
        }
    }
    
    /**
     * Get the content of a file or directory.
     * - returns: The data of a file. Nil if the file doesn't exists or there is an error.
     */
    public func getContent() -> Data? {
        if !isExisted {
            return nil
        }
        return contents(atPath: path)
    }
    
    /**
     * PathHelper.
     */
    public override var isExisted: Bool {
        get {
            if !super.isExisted {
                return false
            }
            var isDictory: ObjCBool = false
            fileExists(atPath: path, isDirectory: &isDictory)
            return !isDictory.boolValue
        }
    }
    
    /**
     * PathHelper.
     */
    public override init(withPath path: String) {
        super.init(withPath: path)
    }
    
    /**
     * PathHelperAction.
     */
    public override func copy(toPath path: String) -> Bool? {
        if !isExisted {
            return false
        }
        let fileHelper = FileHelper(withPath: path)
        if fileHelper.isExisted {
            return false
        }
        return super.copy(toPath: path)
    }
    
}

import Foundation


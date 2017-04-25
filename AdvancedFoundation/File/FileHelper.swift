/**
 * FileHelper is used to perform file related action.
 * - version: 1.0.0.
 * - date: 26/10/2016
 * - author: Adamas
 */
public class FileHelper: PathHelper {
    
    /**
     * System error.
     */
    //    private let pathError = "The file path is invalid."
    //    private let directoryNonExistanceInfo = "The directory doesn't exist in the file system."
    //    private let fileExistanceInfo = "The file exists in the file system."
    //    private let fileNonExistanceInfo = "The file doesn't exist."
    
    /**
     * Initialize the helper.
     * - parameter path: The path that the helper should hold.
     */
    public init(withPath path: String) {
        super.init(withPath: path)
    }
    


  
    
    public func create(withData data: Data) -> Bool? {
        return nil
    }
    
    /**
    * PathHelperAction.
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
     * PathHelperAction.
     */
    public override func copy(toPath path: String) -> Bool? {
        return nil
    }
    
    /**
     * PathHelperAction.
     */
    public override func remove() -> Bool? {
        return nil
    }
    
    /**
     * PathHelperAction.
     */
    public override func getContent() -> Any? {
        //
        //    /**
        //     * Load the content of a file.
        //     * - version: 0.2.0
        //     * - date: 26/10/2016
        //     * - parameter path: The path of the file.
        //     * - returns: The content of the file. Nil if the file doesn't exist.
        //     */
        //    open func getFile(atPath path: String) -> Data? {
        //        let absolutePath = FileHelper.getAbsolutePath(ofPath: path)
        //        if !isFileExisted(atPath: absolutePath) {
        //            logInfo(FileHelper.FileNonExistanceInfo, withDetail: path)
        //            return nil
        //        }
        //        return contents(atPath: absolutePath)
        //    }
        return nil
    }
    
    /**
     * PathHelper.
     */
    public override init(withPath path: String) {
        super.init(withPath: path)
    }
    
}

import Foundation


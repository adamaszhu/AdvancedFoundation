/**
 * DiretoryHelper provides actions for an directory.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 24/04/2017
 */
public class DirectoryHelper: PathHelper, PathHelperAction {
    
    //    /**
    //     * Create the directory recrusively.
    //     * - version: 0.2.0
    //     * - date: 26/10/2016
    //     * - parameter path: The path of the file.
    //     * - returns: Whether the directory has been created or not.
    //     */
    //    open func createDirectory(atPath path: String) -> Bool? {
    //        if isDirectoryExisted(atPath: path) {
    //            return false
    //        }
    //        do {
    //            let absolutePath = FileHelper.getAbsolutePath(ofPath: path)
    //            try self.createDirectory(atPath: absolutePath, withIntermediateDirectories: true, attributes: nil)
    //            return true
    //        } catch let exception {
    //            logException(exception)
    //            return nil
    //        }
    //    }
    
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
            return isDictory.boolValue
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
        
        //
        //    /**
        //     * Get a list of file in the directory represented by the path.
        //     * - version: 0.2.0
        //     * - date: 26/10/2016
        //     * - parameter path: The path of the directory.
        //     * - returns: The file list. nil if the path is not a directory.
        //     */
        //    open func getFileList(fromDirectory path: String) -> Array<String>? {
        //        if !isDirectoryExisted(atPath: path) {
        //            logInfo(FileHelper.DirectoryNonExistanceInfo, withDetail: path)
        //            return nil
        //        }
        //        let absolutePath = FileHelper.getAbsolutePath(ofPath: path)
        //        do {
        //            let contentList = try contentsOfDirectory(atPath: absolutePath)
        //            var fileList = Array<String>()
        //            for content in contentList {
        //                if isFileExisted(atPath: absolutePath + "/" + content) {
        //                    fileList.append(content)
        //                }
        //            }
        //            return fileList
        //        } catch let exception {
        //            logException(exception)
        //            return nil
        //        }
        //    }
        //
        return nil
    }
    
    /**
     * PathHelperAction.
     */
    public override func getContent() -> Any? {
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

/**
 * PathHelper is used to perform path related action.
 * - version: 1.0.0.
 * - date: 26/10/2016
 * - author: Adamas
 */
public class PathHelper: FileManager {
    
    /**
     * The path of the file.
     */
    var path: String
    
    /**
     * Initialize the helper.
     * - parameter path: The path that the helper should hold.
     */
    public init(withPath path: String) {
        self.path = ""
        super.init()
        let formalizedPath = formalizePath(path)
        self.path = getAbsolutePath(ofPath: formalizedPath)
    }
    
    /**
     * Formalize the path. Such as change "/temp/" to "/temp"
     * - parameter path: The path to be formalized.
     * - returns: The formalized path.
     */
    private func formalizePath(_ path: String) -> String {
        return path.removeSuffix("/") ?? path
    }
    
    /**
     * Get the real path.
     * - parameter path: The path of a file or directory.
     * - returns: The absolute path.
     */
    private func getAbsolutePath(ofPath path: String) -> String {
        let homeDirectory = NSHomeDirectory()
        let absolutePath = path.hasPrefix("/") ? path : "\(homeDirectory)/\(path)"
        return absolutePath
    }
    
    /**
     * Get the parent directory path of a formalized path.
     * - parameter path: The path of a file or directory.
     * - returns: The formalized parent directory path. Nil if the path is the root directory.
     */
    private func getParentDirectoryPath(ofPath path: String) -> String? {
        if path == "/" {
            // COMMENT: The path is the root path.
            return nil
        }
        let url = URL(fileURLWithPath: path)
        // COMMENT: The path must contain the last component.
        let parentDirectoryPath = path.removeSuffix(url.lastPathComponent)!
        return formalizePath(parentDirectoryPath)
    }
    
    /**
     * PathHelperAction.
     */
    open var isExisted: Bool {
        get {
            return fileExists(atPath: path)
        }
    }
    
    /**
     * PathHelperAction.
     */
    open func copy(toPath path: String) -> Bool? {
        //    /**
        //     * Copy a file to a destination. It is usually used to move a tempory file.
        //     * - version: 0.2.0
        //     * - date: 26/10/2016
        //     * - parameter originPath: The original file path. It should start with "/"
        //     * - parameter destinationPath: The destination file path. It should start with "/"
        //     * - return: Whether the file has been copyed or not.
        //     */
        //    open func copyFile(fromPath originPath: String, toPath destinationPath: String) -> Bool? {
        //        // COMMENT: Get the full path of the file before and after. Temporary file path always contains the home directory path.
        //        let originAbsolutePath = FileHelper.getAbsolutePath(ofPath: originPath)
        //        let destinationAbsolutePath = FileHelper.getAbsolutePath(ofPath: destinationPath)
        //        if isFileExisted(atPath: destinationAbsolutePath) {
        //            logInfo(FileHelper.FileExistanceInfo, withDetail: destinationPath)
        //            return false
        //        }
        //        if !isFileExisted(atPath: originAbsolutePath) {
        //            logInfo(FileHelper.FileNonExistanceInfo, withDetail: originPath)
        //            return false
        //        }
        //        let directoryPath = FileHelper.getDirectoryPath(ofFile: destinationAbsolutePath)
        //        if directoryPath == nil {
        //            return nil
        //        }
        //        let createDirectoryResult = createDirectory(atPath: directoryPath!)
        //        if createDirectoryResult != true {
        //            return createDirectoryResult
        //        }
        //        do {
        //            try copyItem(atPath: originAbsolutePath, toPath: destinationAbsolutePath)
        //            return true
        //        } catch let exception {
        //            logException(exception)
        //            return nil
        //        }
        //    }
        return nil
    }
    
    /**
     * PathHelperAction.
     */
    open func remove() -> Bool? {
        
        //
        //    /**
        //     * Delete a file from the file system
        //     * - version: 0.2.0
        //     * - date: 26/10/2016
        //     * - parameter path: The path of the file.
        //     * - returns: Whether the file has been removed successfully or not.
        //     */
        //    open func removeFile(atPath path: String) -> Bool? {
        //        let absolutePath = FileHelper.getAbsolutePath(ofPath: path)
        //        if !isFileExisted(atPath: absolutePath) {
        //            logInfo(FileHelper.FileNonExistanceInfo, withDetail: path)
        //            return false
        //        }
        //        do {
        //            try removeItem(atPath: absolutePath)
        //            return true
        //        } catch let exception {
        //            logException(exception)
        //            return nil
        //        }
        //    }
        return nil
    }
    
    /**
     * PathHelperAction.
     */
    open func getContent() -> Any? {
        return nil
    }
    
}

import Foundation


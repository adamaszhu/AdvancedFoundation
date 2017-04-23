/**
 * FileHelper is used to perform file related action.
 * - version: 1.0.0.
 * - date: 26/10/2016
 * - author: Adamas
 */
public class FileHelper: FileManager {
    
    /**
     * System error.
     */
    //    private let pathError = "The file path is invalid."
    //    private let directoryNonExistanceInfo = "The directory doesn't exist in the file system."
    //    private let fileExistanceInfo = "The file exists in the file system."
    //    private let fileNonExistanceInfo = "The file doesn't exist."
    
    /**
     * The path of the file.
     */
    private var path: String
    
    /**
     * Initialize the helper.
     * - parameter path: The path that the helper should hold.
     */
    init(withPath path: String) {
        // COMMENT: Remove the directory appendix, such as "/temp/".
        self.path = path.hasSuffix("/") ? path.removeSuffix("/") : path
        super.init()
    }
    
    /**
     * Get the real file or directory path.
     * - parameter path: The path of a file or directory.
     * - returns: The absolute path.
     */
    public func getAbsolutePath(ofPath path: String) -> String {
        let homeDirectory = NSHomeDirectory()
        let absolutePath = path.hasPrefix("/") ? path : "\(homeDirectory)/\(path)"
        return absolutePath
    }
    
    /**
     * Get the parent directory of a file.
     * - parameter path: The path of a file or directory.
     * - returns: The parent directory path. Nil if the path is the root directory.
     */
    public func getParentDirectory(ofPath path: String) -> String? {
        if path == "/" {
            return nil
        }
        //        if path.hasSuffix("/") {
        //            path.substring(to: path.endIndex)
        //            return nil
        //        }
        let url = URL(fileURLWithPath: path)
        var parentDirectoryPath = path
        return url.lastPathComponent
        
        
        
        
        //        let fullFileExtension = ".\(fileExtension)"
        //        let fileExtensionIndex = lastPathComponent.index(lastPathComponent.endIndex, offsetBy: String.IndexDistance(-fullFileExtension.characters.count))
        //        return lastPathComponent.substring(to: fileExtensionIndex)
        
        
        
        //        let url = URL(fileURLWithPath: path)
        //        var directoryPath = path
        //        var fileComponentRange = path.range(of: url.lastPathComponent)
        //        if fileComponentRange == nil {
        //            logError(FileHelper.FilePathError, withDetail: path)
        //            return nil
        //        }
        //        fileComponentRange!.lowerBound = <#T##Collection corresponding to your index##Collection#>.index(before: fileComponentRange!.lowerBound)
        //        directoryPath.removeSubrange(fileComponentRange!)
        //        return directoryPath
    }
    
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
    //    /**
    //     * Check if the directory exist or not.
    //     * - version: 0.2.0
    //     * - date: 26/10/2016
    //     * - parameter path: The path of the file.
    //     * - returns: Whether the directory is available or not.
    //     */
    //    open func isDirectoryExisted(atPath path: String) -> Bool {
    //        let absolutePath = FileHelper.getAbsolutePath(ofPath: path)
    //        if !fileExists(atPath: absolutePath) {
    //            return false
    //        }
    //        var isDictory: ObjCBool = false
    //        fileExists(atPath: absolutePath, isDirectory: &isDictory)
    //        return isDictory.boolValue
    //    }
    //
    //    /**
    //     * Check if the directory exist or not.
    //     * - version: 0.0.5
    //     * - date: 03/10/2016
    //     * - parameter path: The path of the file.
    //     * - returns: Whether the directory is available or not.
    //     */
    //    open func isFileExisted(atPath path: String) -> Bool {
    //        let absolutePath = FileHelper.getAbsolutePath(ofPath: path)
    //        if !fileExists(atPath: absolutePath) {
    //            return false
    //        }
    //        var isDictory: ObjCBool = false
    //        fileExists(atPath: absolutePath, isDirectory: &isDictory)
    //        return !isDictory.boolValue
    //    }
    //
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
    
}

import Foundation


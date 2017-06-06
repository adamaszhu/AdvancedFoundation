/**
 * PathHelper is used to perform path related action.
 * - version: 1.0.0.
 * - date: 26/10/2016
 * - author: Adamas
 */
public class PathHelper: FileManager {
    
    /**
     * Whether the file or a directory exists or not.
     */
    public var isExisted: Bool {
        return fileExists(atPath: path)
    }
    
    /**
     * The path of the file.
     */
    public private(set) var path: String
    
    /**
     * Initialize the helper.
     * - parameter path: The path that the helper should hold.
     */
    public init(path: String) {
        self.path = path
        super.init()
        formalizePath()
        updateAbsolutePath()
    }
    
    /**
     * Copy current path to a destination.
     * - parameter newPath: The destination file path. It should start with "/"
     * - return: Whether the file has been copyed or not.
     */
    public func copy(toPath path: String) -> Bool? {
        guard isExisted else {
            return false
        }
        let pathHelper = PathHelper(path: path)
        guard !pathHelper.isExisted else {
            return false
        }
        guard pathHelper.createParentDirectory() == true else {
            return nil
        }
        do {
            try copyItem(atPath: self.path, toPath: pathHelper.path)
            return true
        } catch let error {
            Logger.standard.logError(error)
            return nil
        }
    }
    
    /**
     * Remove the file or directory.
     * - returns: Whether the file or directory has been removed or not. Nil if there is an error.
     */
    public func remove() -> Bool? {
        guard isExisted else {
            return false
        }
        do {
            try removeItem(atPath: path)
            return true
        } catch let error {
            Logger.standard.logError(error)
            return nil
        }
    }
    
    /**
     * Create the parent directory for a create action or copy action.
     * - returns: Whether the directory has been created or not. Nil if there is an error.
     */
    func createParentDirectory() -> Bool? {
        guard let parentDirectory = getParentDirectoryPath() else {
            return nil
        }
        do {
            try createDirectory(atPath: parentDirectory, withIntermediateDirectories: true)
            return true
        } catch let error {
            Logger.standard.logError(error)
            return nil
        }
    }
    
    /**
     * Formalize the path. Such as change "/temp/" to "/temp"
     */
    private func formalizePath() {
        path.removeSuffix("/")
    }
    
    /**
     * Update the path to the real path.
     */
    private func updateAbsolutePath() {
        let homeDirectory = NSHomeDirectory()
        path = path.hasPrefix("/") ? path : "\(homeDirectory)/\(path)"
    }
    
    /**
     * Get the parent directory path of a formalized path.
     * - returns: The formalized parent directory path. Nil if the path is the root directory.
     */
    private func getParentDirectoryPath() -> String? {
        guard path != "/" else {
            // COMMENT: The path is the root path.
            return nil
        }
        let url = URL(fileURLWithPath: path)
        // COMMENT: The path must contain the last component.
        var parentPath = path
        parentPath.removeSuffix(url.lastPathComponent)
        return parentPath
    }
    
}

import Foundation


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
        get {
            return fileExists(atPath: path)
        }
    }
    
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
     * Copy current path to a destination. 
     * - parameter newPath: The destination file path. It should start with "/"
     * - return: Whether the file has been copyed or not.
     */
    public func copy(toPath path: String) -> Bool? {
        let formalizedPath = formalizePath(path)
        let destinationPath = getAbsolutePath(ofPath: formalizedPath)
        guard let parentDirectory = getParentDirectoryPath(ofPath: destinationPath) else {
            return nil
        }
        do {
            try createDirectory(atPath: parentDirectory, withIntermediateDirectories: true)
            try copyItem(atPath: self.path, toPath: destinationPath)
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
        if !isExisted {
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
    
}

import Foundation


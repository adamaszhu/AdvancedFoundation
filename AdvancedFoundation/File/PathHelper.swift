/**
 * PathHelper is used to perform path related action.
 * - version: 1.0.0.
 * - date: 26/10/2016
 * - author: Adamas
 */
class PathHelper: FileManager {
    
    /**
     * The path of the file.
     */
    private var path: String
    
    /**
     * Initialize the helper.
     * - parameter path: The path that the helper should hold.
     */
    public init(withPath path: String) {
        self.path = ""
        isExisted = false
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
    open func copy(toPath path: String) -> Bool? {
        return nil
    }
    
    /**
     * PathHelperAction.
     */
    open func remove() -> Bool? {
        return nil
    }
    
    /**
     * PathHelperAction.
     */
    open func getContent() -> Any? {
        return nil
    }
    
    /**
     * PathHelperAction.
     */
    open var isExisted: Bool
    
}

import Foundation


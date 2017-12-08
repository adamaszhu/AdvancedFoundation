/// PathHelper is used to perform path related action.
///
/// - author: Adamas
/// - version: 1.2.0
/// - date: 08/12/2017
open class PathHelper: FileManager {
    
    /// Whether the file or a directory exists or not.
    public var isExisted: Bool {
        return fileExists(atPath: path)
    }
    
    /// Get the parent directory path of a formalized path. Nil if current path is the root directory.
    private var parentDirectoryPath: String? {
        guard path != "/" else {
            // The path is the root path.
            return nil
        }
        let url = URL(fileURLWithPath: path)
        // The path must contain the last component.
        var parentPath = path
        parentPath.remove(suffix: url.lastPathComponent)
        return parentPath
    }
    
    /// The path of the file.
    public private(set) var path: String
    
    /// Initialize the helper.
    ///
    /// - Parameter path: The path that the helper should hold.
    public init(path: String) {
        let formalizedPath = PathHelper.formalizedPath(from: path)
        self.path = PathHelper.absolutePath(from: formalizedPath)
        super.init()
    }
    
    /// Copy current path to a destination.
    ///
    /// - Parameter newPath: The destination file path. It should start with "/"
    /// - Return: Whether the file has been copyed or not.
    @discardableResult
    public func copy(toPath path: String) -> Bool? {
        let pathHelper = PathHelper(path: path)
        guard isExisted, !pathHelper.isExisted else {
            return false
        }
        guard pathHelper.createParentDirectory() == true else {
            return nil
        }
        do {
            try copyItem(atPath: self.path, toPath: pathHelper.path)
            return true
        } catch let error {
            Logger.standard.log(error)
            return nil
        }
    }
    
    /// Remove the file or directory.
    ///
    /// - Returns: Whether the file or directory has been removed or not. Nil if there is an error.
    @discardableResult
    public func remove() -> Bool? {
        guard isExisted else {
            return false
        }
        do {
            try removeItem(atPath: path)
            return true
        } catch let error {
            Logger.standard.log(error)
            return nil
        }
    }
    
    /// Create the parent directory for a create action or copy action.
    ///
    /// - Returns: Whether the directory has been created or not. Nil if there is an error.
    func createParentDirectory() -> Bool? {
        guard let parentDirectory = parentDirectoryPath else {
            return true
        }
        do {
            try createDirectory(atPath: parentDirectory, withIntermediateDirectories: true)
            return true
        } catch let error {
            Logger.standard.log(error)
            return nil
        }
    }
    
    /// Formalize the path. Such as change "/temp/" to "/temp"
    ///
    /// - Parameter path: The path where the formalize should be performed on.
    /// - Returns: The formalized path.
    private static func formalizedPath(from path: String) -> String {
        var path = path
        path.remove(suffix: "/")
        return path
    }
    
    /// Update the path to the real path.
    ///
    /// - Parameter path: The path where the absolute path should be retrieved from.
    /// - Returns: The absolute path.
    private static func absolutePath(from path: String) -> String {
        let homeDirectory = NSHomeDirectory()
        return path.hasPrefix("/") ? path : "\(homeDirectory)/\(path)"
    }
    
}

import Foundation


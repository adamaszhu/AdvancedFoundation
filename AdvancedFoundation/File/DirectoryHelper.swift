/**
 * DiretoryHelper provides actions for an directory.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 24/04/2017
 */
public class DirectoryHelper: PathHelper {
    
    /**
     * Create the directory recrusively.
     * - returns: Whether the directory has been created or not. Nil if there is an error.
     */
    public func create() -> Bool? {
        if isExisted {
            return false
        }
        do {
            try createDirectory(atPath: path, withIntermediateDirectories: true)
            return true
        } catch let error {
            Logger.standard.logError(error)
            return nil
        }
    }
    
    /**
     * Get the content of a file or directory.
     * - returns: The path list of all contents in a directory. Nil if the data doesn't exist or there is an error.
     */
    public func getContent() -> Array<String>? {
        if !isExisted {
            return nil
        }
        do {
            let paths = try contentsOfDirectory(atPath: path)
            return paths.map({ (path) -> String in
                "\(self.path)/\(path)"
            })
        } catch let error {
            Logger.standard.logError(error)
            return nil
        }
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
            return isDictory.boolValue
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
        let pathHelper = PathHelper(withPath: path)
        if pathHelper.isExisted {
            return false
        }
        return super.copy(toPath: path)
    }
    
}

import Foundation

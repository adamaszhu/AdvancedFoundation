/**
 * DiretoryHelper provides actions for an directory.
 * - author: Adamas
 * - version: 1.0.1
 * - date: 24/04/2017
 */
public class DirectoryHelper: PathHelper {
    
    /**
     * System warning.
     */
    private static let contentExistanceWarning = "The directory doesn't exist."
    private static let createExistanceWarning = "The directory to be created exists."
    
    /**
     * The path list of all contents in a directory. Nil if the data doesn't exist or there is an error.
     */
    public var content: Array<String>? {
        guard isExisted else {
            Logger.standard.logWarning(DirectoryHelper.contentExistanceWarning, withDetail: path)
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
     * Create the directory recrusively.
     * - returns: Whether the directory has been created or not. Nil if there is an error.
     */
    public func create() -> Bool? {
        guard !super.isExisted else {
            Logger.standard.logWarning(DirectoryHelper.createExistanceWarning, withDetail: path)
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
     * PathHelperAction.
     */
    public override var isExisted: Bool {
        guard super.isExisted else {
            return false
        }
        var isDictory: ObjCBool = false
        fileExists(atPath: path, isDirectory: &isDictory)
        return isDictory.boolValue
    }
    
}

import Foundation

/// DiretoryHelper provides actions for an directory.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 23/03/2019
open class DirectoryHelper: PathHelper {
    
    /// The path list of all contents in a directory. Nil if the data doesn't exist or there is an error.
    public var content: [String]? {
        guard isExisted else {
            return nil
        }
        do {
            let paths = try contentsOfDirectory(atPath: path)
            return paths.map { path + $0 }
        } catch let error {
            Logger.standard.log(error)
            return nil
        }
    }
    
    /// Create the directory recrusively.
    ///
    /// - Returns: Whether the directory has been created or not. Nil if there is an error.
    @discardableResult
    public func createDirectory() -> Bool? {
        guard !super.isExisted else {
            return false
        }
        do {
            try createDirectory(atPath: path, withIntermediateDirectories: true)
            return true
        } catch let error {
            Logger.standard.log(error)
            return nil
        }
    }
    
    /// Whether the directory exists or not.
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

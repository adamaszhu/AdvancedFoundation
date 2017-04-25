/**
 * PathHelperAction defines the basic action a sub class should have.
 * - version: 1.0.0
 * - author: Adamas
 * - date: 24/04/2017
 */
protocol PathHelperAction {
    
    /**
     * Copy current path to a destination.
     * - parameter newPath: The destination file path. It should start with "/"
     * - return: Whether the file has been copyed or not.
     */
    func copy(toPath path: String) -> Bool?
    
    /**
     * Remove the file or directory.
     * - returns: Whether the file or directory has been removed or not. Nil if there is an error.
     */
    func remove() -> Bool?
    
    /**
     * Get the content of a file or directory.
     * - returns: The data of a file or the file list of a directory.
     */
    func getContent() -> Any?
    
    /**
     * Whether the file or directory exists or not.
     */
    var isExisted: Bool { get }
    
}


/**
 * PathHelper+Basic defines the basic action a sub class should have.
 * - version: 1.0.0
 * - author: Adamas
 * - date: 24/04/2017
 */
protocol PathHelperBasic {
    <#requirements#>
}
/**
 * Copy current path to a destination.
 * - parameter newPath: The destination file path. It should start with "/"
 * - return: Whether the file has been copyed or not.
 */
func copy(toPath path: String) -> Bool? {
    return nil
}

/**
 * PathHelper+Basic.
 */
open func remove() -> Bool? {
    return nil
}

/**
 * PathHelper+Basic.
 */
open func getContent() -> Any? {
    return nil
}

/**
 * PathHelper+Basic.
 */
open var isExisted: Bool

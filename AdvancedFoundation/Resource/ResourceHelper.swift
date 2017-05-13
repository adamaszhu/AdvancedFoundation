/**
 * ResourceHelper improves the ability to access resources.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 29/04/2017
 */
public class ResourceHelper {
    
    /**
     * Whether the resource exists or not.
     */
    public var isExisted: Bool {
        return url != nil
    }
    
    /**
     * The url of the resource. Nil if the resource doesn't exist.
     */
    var url: URL?
    
    /**
     * Initialize the helper.
     * - parameter name: The name of the resource.
     */
    init(withName name: String) {
        parseURL(ofResource: name)
    }
    
    /**
     * Get the URL at a resource path.
     * - parameter name: The name of the resource.
     */
    private func parseURL(ofResource name: String) {
        let fileInfoAccessor = FileInfoAccessor(path: name)
        guard let path = Bundle.main.path(forResource: fileInfoAccessor.filename, ofType: fileInfoAccessor.fileExtension) else {
            return
        }
        url =  URL(fileURLWithPath: path)
    }
    
}

import Foundation


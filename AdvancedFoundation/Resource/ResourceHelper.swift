/// ResourceHelper improves the ability to access resources.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 23/03/2019
open class ResourceHelper {
    
    /// The url of the resource.
    let url: URL
    
    /// Initialize the helper.
    ///
    /// - Parameters:
    ///   - name: The name of the resource.
    ///   - bundle: The bundle that the resource belongs to.
    public init?(name: String, bundle: Bundle = Bundle.main) {
        let fileInfoAccessor = FileInfoAccessor(path: name)
        guard let path = bundle.path(forResource: fileInfoAccessor.filename, ofType: fileInfoAccessor.fileExtension) else {
            Logger.standard.log(error: ResourceHelper.resourceError, withDetail: name)
            return nil
        }
        url =  URL(fileURLWithPath: path)
    }
}

/// Constants
private extension ResourceHelper {
    
    /// System error.
    private static let resourceError = "The resource doesn't exist."
}

import Foundation


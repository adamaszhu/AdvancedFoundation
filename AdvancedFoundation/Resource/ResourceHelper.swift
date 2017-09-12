/// ResourceHelper improves the ability to access resources.
///
/// - author: Adamas
/// - version: 1.1.3
/// - date: 12/09/2017
public class ResourceHelper {
    
    /// System error.
    private static let resourceError = "The resource doesn't exist."
    
    /// The url of the resource.
    var url: URL
    
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

import Foundation


/// FileInfoAccessor gets information related to a file.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 12/07/2017
public class FileInfoAccessor {
    
    /// The default MIME type.
    private static let defaultMIMEType = "application/octet-stream"
    
    /// Get the MIME type of the file.
    public var mimeType: String? {
        guard !fileExtension.isEmpty else {
            return FileInfoAccessor.defaultMIMEType
        }
        // Decode the name of the MIME type.
        guard let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, fileExtension as CFString, nil), let tag = UTTypeCopyPreferredTagWithClass(uti.takeRetainedValue(), kUTTagClassMIMEType) else {
            return FileInfoAccessor.defaultMIMEType
        }
        return tag.takeRetainedValue() as String
    }
    
    /// Get the file name.
    public var filename: String {
        let lastPathComponent = url.lastPathComponent
        guard !fileExtension.isEmpty else {
            return lastPathComponent
        }
        let fullFileExtension = ".\(fileExtension)"
        let fileExtensionIndex = lastPathComponent.index(lastPathComponent.endIndex, offsetBy: String.IndexDistance(-fullFileExtension.characters.count))
        return lastPathComponent.substring(to: fileExtensionIndex)
    }
    
    /// Get the file extension.
    public var fileExtension: String {
        return url.pathExtension
    }
    
    /// The url object of the file.
    private let url: URL
    
    /// Initialize the object.
    ///
    /// - Parameter path: The path of the file.
    public init(path: String) {
        url = URL(fileURLWithPath: path)
    }
    
}

import Foundation
import MobileCoreServices



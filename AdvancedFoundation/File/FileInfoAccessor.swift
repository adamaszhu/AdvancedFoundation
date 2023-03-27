/// FileInfoAccessor gets information related to a file.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 29/03/2019
public class FileInfoAccessor {
    
    /// Get the MIME type of the file.
    public var mimeType: String {
        guard !fileExtension.isEmpty else {
            return Self.defaultMIMEType
        }
        if #available(iOS 14.0, *) {
            return UTType(filenameExtension: fileExtension)?.preferredMIMEType ?? Self.defaultMIMEType
        }
        // Decode the name of the MIME type.
        guard let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension,
                                                              fileExtension as CFString,
                                                              nil),
                let tag = UTTypeCopyPreferredTagWithClass(uti.takeRetainedValue(),
                                                          kUTTagClassMIMEType) else {
            return Self.defaultMIMEType
        }
        return tag.takeRetainedValue() as String
    }
    
    /// Get the file name.
    public var filename: String {
        let lastPathComponent = url.lastPathComponent
        guard !fileExtension.isEmpty else {
            return lastPathComponent
        }
        let fileExtensionIndex = lastPathComponent.index(lastPathComponent.endIndex,
                                                         offsetBy: -fileExtension.count - 1)
        return String(lastPathComponent[..<fileExtensionIndex])
    }
    
    /// Get the file extension.
    public var fileExtension: String {
        url.pathExtension
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

/// Constants
private extension FileInfoAccessor {
    
    /// The default MIME type.
    static let defaultMIMEType = "application/octet-stream"
}

import Foundation
import UniformTypeIdentifiers
#if !os(macOS)
import MobileCoreServices
#endif

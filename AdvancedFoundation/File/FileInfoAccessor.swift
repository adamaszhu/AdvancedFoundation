/**
 * FileInfo is used to get information related to a file.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 16/04/2017
 */
public class FileInfoAccessor {
    
    /**
     * System error.
     */
    private static let mimeTypeError = "The filename extension is not recognized."
    
    /**
     * The default MIME type.
     */
    private static let defaultMIMEType = "application/octet-stream"
    
    /**
     * Get the MIME type of the file.
     */
    public var mimeType: String? {
        if fileExtension.isEmpty {
            return FileInfoAccessor.defaultMIMEType
        }
        // COMMENT: Decode the name of the MIME type.
        let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, fileExtension as CFString, nil)
        if uti == nil {
            Logger.logError(FileInfoAccessor.mimeTypeError, withDetail: url)
            return nil
        }
        let tag = UTTypeCopyPreferredTagWithClass(uti!.takeRetainedValue(), kUTTagClassMIMEType)
        if tag == nil {
            return FileInfoAccessor.defaultMIMEType
        }
        return tag!.takeRetainedValue() as String
    }
    
    /**
     * Get the file name.
     */
    public var filename: String {
        let lastPathComponent = url.lastPathComponent
        if fileExtension.isEmpty != false {
            return lastPathComponent
        }
        let fullFileExtension = ".\(fileExtension)"
        let fileExtensionIndex = lastPathComponent.index(lastPathComponent.endIndex, offsetBy: String.IndexDistance(-fullFileExtension.characters.count))
        return lastPathComponent.substring(to: fileExtensionIndex)
    }
    
    /**
     * Get the file extension.
     */
    public var fileExtension: String {
        return url.pathExtension
    }
    
    /**
     * The url object of the file.
     */
    private let url: URL
    
    /**
     * Initialize the object.
     * - parameter path: The path of the file.
     */
    public init(withPath path: String) {
        url = URL(fileURLWithPath: path)
    }
    
}

import Foundation
import MobileCoreServices



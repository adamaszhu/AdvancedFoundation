/**
 * FileInfoAccessor gets information related to a file.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 16/04/2017
 */
public class FileInfoAccessor {
    
    /**
     * System error.
     */
    private let mimeTypeError = "The filename extension is not recognized."
    
    /**
     * The default MIME type.
     */
    private let defaultMIMEType = "application/octet-stream"
    
    /**
     * Get the MIME type of the file.
     */
    public var mimeType: String? {
        if fileExtension.isEmpty {
            return defaultMIMEType
        }
        // COMMENT: Decode the name of the MIME type.
        guard let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, fileExtension as CFString, nil) else {
            Logger.standard.logError(mimeTypeError, withDetail: url)
            return nil
        }
        guard let tag = UTTypeCopyPreferredTagWithClass(uti.takeRetainedValue(), kUTTagClassMIMEType) else {
            return defaultMIMEType
        }
        return tag.takeRetainedValue() as String
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



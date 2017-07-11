/// Logger is used to format a log.
/// - author: Adamas
/// - version: 1.1.0
/// - date: 12/07/2017
final public class Logger {
    
    /// The default logger.
    public static let standard: Logger = Logger()
    
    /// Message tags.
    private static let errorTag = "Error"
    private static let infoTag = "Info"
    private static let warningTag = "Warning"
    private static let detailSeperator = "=========="
    
    /// The date format.
    private static let dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
    
    /// Log an info.
    ///
    /// - Parameters:
    ///   - info: The info.
    ///   - detail: The detail of the info.
    public func logInfo(_ info: String, withDetail detail: Any? = nil) {
        logMessage(info, withTag: Logger.infoTag, withDetail: detail)
    }
    
    /// Log a warning.
    ///
    /// - Parameters:
    ///   - warning: The warning.
    ///   - detail: The detail of the warning.
    public func logWarning(_ warning: String, withDetail detail: Any? = nil) {
        logMessage(warning, withTag: Logger.warningTag, withDetail: detail)
    }
    
    /// Log an error.
    ///
    /// - Parameters:
    ///   - error: The error.
    ///   - detail: The detail of the error.
    public func logError(_ error: String, withDetail detail: Any? = nil) {
        logMessage(error, withTag: Logger.errorTag, withDetail: detail)
    }
    
    /// Log an error.
    ///
    /// - Parameter error: The error.
    public func logError(_ error: Error) {
        logMessage(error.localizedDescription, withTag: Logger.errorTag)
    }
    
    /// Log a message.
    ///
    /// - Parameters
    ///   - tag: The type of the message.
    ///   - message: The message.
    private func logMessage(_ message: String, withTag tag: String, withDetail detail: Any? = nil) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Logger.dateFormat
        let dateString = dateFormatter.string(from: date)
        if let detail = detail {
            print("\(tag) \(dateString): \(message)\n\(Logger.detailSeperator)\n\(detail)\n\(Logger.detailSeperator)")
        } else {
            print("\(tag) \(dateString): \(message)")
        }
    }
    
}

import Foundation

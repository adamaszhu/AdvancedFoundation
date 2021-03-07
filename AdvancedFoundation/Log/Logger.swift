/// Logger is used to format a log.
/// - author: Adamas
/// - version: 1.5.0
/// - date: 23/03/2019
public class Logger {
    
    /// The default logger.
    public static let standard = Logger()
    
    /// Log an info.
    ///
    /// - Parameters:
    ///   - info: The info.
    ///   - detail: The detail of the info.
    public func logInfo(_ info: String, withDetail detail: Any? = nil) {
        logMessage(info, withTag: Self.infoTag, withDetail: detail)
    }
    
    /// Log a warning.
    ///
    /// - Parameters:
    ///   - warning: The warning.
    ///   - detail: The detail of the warning.
    public func logWarning(_ warning: String, withDetail detail: Any? = nil) {
        logMessage(warning, withTag: Self.warningTag, withDetail: detail)
    }
    
    /// Log an error.
    ///
    /// - Parameters:
    ///   - error: The error.
    ///   - detail: The detail of the error.
    public func logError(_ error: String, withDetail detail: Any? = nil) {
        logMessage(error, withTag: Self.errorTag, withDetail: detail)
    }
    
    /// Log an error.
    ///
    /// - Parameter error: The error.
    public func log(_ error: Error) {
        logMessage(error.localizedDescription, withTag: Self.errorTag)
    }
    
    /// Log a message.
    ///
    /// - Parameters
    ///   - tag: The type of the message.
    ///   - message: The message.
    ///   - detail: The detail of the message.
    private func logMessage(_ message: String, withTag tag: String, withDetail detail: Any? = nil) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Self.dateFormat
        let dateString = dateFormatter.string(from: date)
        var log = String(format: Self.logPattern, tag, dateString, message)
        if let detail = detail {
            let detailString = "\(detail)"
            log = String(format: Self.detailPattern, log, detailString)
        }
        print(log)
    }
}

/// Constants
private extension Logger {
    
    /// The date format.
    static let dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
    
    /// The log pattern as "\(tag) \(dateString): \(message)".
    static let logPattern = "%@ %@: %@"
    
    /// The detail pattern as "\(log)\n==========\n\(detail)\n==========".
    static let detailPattern = "%@\n\(Logger.detailSeperator)\n%@\n\(Logger.detailSeperator)"
    
    /// Message tags.
    static let errorTag = "Error"
    static let infoTag = "Info"
    static let warningTag = "Warning"
    static let detailSeperator = "=========="
}

import Foundation

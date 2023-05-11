/// Date+Editable provides additional edit function for a date object.
///
/// - author: Adamas
/// - version: 1.9.5
/// - date: 11/05/2023
public extension Date {
    
    /// Adding certain days to the current date
    /// - Parameters:
    ///   - days: Days to be added. Default to 0.
    ///   - hours: Hours to be added. Default to 0.
    ///   - mins: Hours to be added. Default to 0.
    ///   - secs: Hours to be added. Default to 0.
    /// - Returns: The new date object
    func adding(days: Int = 0,
                hours: Int = 0,
                mins: Int = 0,
                secs: Int = 0) -> Date {
        let daysInterval = Double(days) * Self.hoursPerDay * Self.minsPerHour * Self.secondsPerMin
        let hoursInterval = Double(hours) * Self.minsPerHour * Self.secondsPerMin
        let minsInterval = Double(mins) * Self.secondsPerMin
        let secsInterval = Double(secs)
        return addingTimeInterval(daysInterval + hoursInterval + minsInterval + secsInterval)
    }
}

private extension Date {
    static let hoursPerDay: TimeInterval = 24
    static let minsPerHour: TimeInterval = 60
    static let secondsPerMin: TimeInterval = 60
}

import Foundation

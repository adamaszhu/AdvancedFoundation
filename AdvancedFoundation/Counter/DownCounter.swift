/// DownCounter provides a simple counting down function.
///
/// - author: Adamas
/// - version: 1.7.0
/// - date: 03/05/2022
public final class DownCounter {

    /// The timer
    private var timer: DispatchSourceTimer?

    /// The queue that the timer should run on
    private let queue: DispatchQueue

    /// Count left
    private var count: Int = 0

    /// Callback for each count
    private var tickerHandler: ((Int) -> Void)?

    /// Callback when the counter finishes
    private var completionHandler: (() -> Void)?

    /// Create a counter
    ///
    /// - Parameter queue: The queue that the timer should run on
    public init(queue: DispatchQueue = DispatchQueue.main) {
        self.queue = queue
    }

    /// Start counting
    ///
    /// - Parameters:
    ///   - count: Number to count
    ///   - interval: Time interval for each count
    ///   - tickerHandler: Callback for each count
    ///   - completionHandler: Callback when the counter finishes
    public func start(count: Int,
                      with interval: TimeInterval,
                      tickerHandler: ((Int) -> Void)?,
                      completionHandler: (() -> Void)?) {
        self.count = count
        self.tickerHandler = tickerHandler
        self.completionHandler = completionHandler

        timer = DispatchSource.makeTimerSource(queue: queue)
        timer?.schedule(deadline: .now(), repeating: interval)
        timer?.setEventHandler { [weak self] in
            self?.tick()
        }
        timer?.resume()
    }

    /// Stop the counter
    public func stop() {
        timer?.cancel()
    }

    /// Action to perform for each count
    private func tick() {
        tickerHandler?(count)
        if count <= 0 {
            timer?.cancel()
            completionHandler?()
        }
        count -= 1
    }
}

import Foundation

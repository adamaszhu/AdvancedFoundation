/// NetowrkHelper is used to perform basic level internet connection.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 13/07/2017
public class NetworkHelper: NSObject {
    
    /// System error.
    private static let urlError = "The url address is invalid."
    private static let taskExistanceError = "The task doesn't exist."
    private static let taskTypeError = "The task type hasn't been supported yet."
    private static let settingAccessibilityError = "The network setting cannot be read."
    
    /// Whether the network is available or not. This method is referenced from http://stackoverflow.com/questions/39558868/check-internet-connection-ios-10
    public static var isNetworkAvailable: Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        guard SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) else {
            Logger.standard.log(error: NetworkHelper.settingAccessibilityError)
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    /// The default helper.
    public static var standard: NetworkHelper? {
        guard let bundleName = AppInfoAccessor.shared.bundleName else {
            return nil
        }
        return NetworkHelper(identifier: bundleName)
    }
    
    /// The delegate of the NetworkHelper.
    public var networkHelperDelegate: NetworkHelperDelegate?
    
    /// The session connecting to the network. Declare as internal is for DI.
    var normalSession: URLSession!
    
    /// The session used to download or upload in background mode. Declare as internal is for DI.
    var backgroundSession: URLSession!
    
    /// The task list. Declare as internal is for testing.
    var tasks: [NetworkTask]
    
    /// The cache used in the app.
    private var cache: URLCache
    
    /// Initialize the object.
    ///
    /// - Parameter:
    ///   - identifier: The identifier used to identify the URL session running in the background.
    ///   - cache: The cache to cache all request. Nil means use the default one.
    public init(identifier: String, cache: URLCache = URLCache.shared) {
        tasks = []
        self.cache = cache
        super.init()
        var configuration = URLSessionConfiguration.default
        normalSession = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        configuration = URLSessionConfiguration.background(withIdentifier: identifier)
        configuration.sessionSendsLaunchEvents = true
        configuration.isDiscretionary = true
        backgroundSession = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }
    
    /// Send a asychoronous post request.
    ///
    /// - Parameters:
    ///   -url: The url of the destination.
    ///   -header: The header of the post.
    ///   -body: The content of the request.
    ///   -type: The type of the request.
    ///   -isUploadTask: Whether the task should be run in the background or not.
    /// - Returns: The identifier of the task.
    public func post(toURL url: String, with body: Data, as type: NetworkBodyType, with header: NetworkRequestHeader? = nil, asUploadTask isUploadTask: Bool = false) -> String? {
        var header = header ?? NetworkRequestHeader()
        header.contentType = type.rawValue
        header.contentLength = body.count
        guard var request = request(withURL: url, with: header, as: .post) else {
            return nil
        }
        request.httpBody = body
        let type = isUploadTask ? NetworkTaskType.upload : NetworkTaskType.data
        return send(request, as: type)
    }
    
    /// Post a form to a specific url.
    ///
    /// - Parameters:
    ///   - url: The url of the destination.
    ///   - header: The header of the post.
    ///   - formData: The form data to be posted.
    ///   - isUploadTask: Whether the task should be run in the background or not.
    /// - Returns: The identifier of the task.
    public func post(toURL url: String, with formData: FormData, with header: NetworkRequestHeader? = nil, asUploadTask isUploadTask: Bool = false) -> String? {
        return post(toURL: url, with: formData.data, as: .formData, with: header, asUploadTask: isUploadTask)
    }
    
    
    /// Send a get request.
    ///
    /// - Parameters:
    ///   - url: The url of the destination.
    ///   - header: The header of the get.
    ///   - isDownloadTask: Whether current task is a download task or not.
    /// - Returns: The task identifier.
    public func get(fromURL url: String, with header: NetworkRequestHeader? = nil, asDownloadTask isDownloadTask: Bool = false) -> String? {
        let header = header ?? NetworkRequestHeader()
        guard let request = request(withURL: url, with: header, as: .get) else {
            return nil
        }
        let type = isDownloadTask ? NetworkTaskType.download : NetworkTaskType.data
        return send(request, as: type)
    }
    
    /// Send a delete request.
    ///
    /// - Parameters:
    ///   - url: The address of the destination.
    ///   - header: The header of the delete.
    /// - Returns: The identifier of the new task.
    public func delete(atURL url: String, with header: NetworkRequestHeader? = nil) -> String? {
        let header = header ?? NetworkRequestHeader()
        guard let request = request(withURL: url, with: header, as: .delete) else {
            return nil
        }
        return send(request, as: .data)
    }
    
    /// Reset the internet, which will cancel all the current internet connections.
    public func reset() {
        tasks.forEach {
            $0.task.cancel()
        }
        tasks.removeAll()
    }
    
    /// Clear all cache data.
    public func clearCache() {
        cache.removeAllCachedResponses()
    }
    
    /// Clear the cache for a specific request.
    ///
    // - Parameter url: The address of the destination.
    public func clearCache(forURL url: String) {
        guard let parsedURLString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            Logger.standard.log(error: NetworkHelper.urlError, withDetail: url)
            return
        }
        guard let url = URL(string: parsedURLString) else {
            Logger.standard.log(error: NetworkHelper.urlError, withDetail: parsedURLString)
            return
        }
        let request = URLRequest(url: url)
        cache.removeCachedResponse(for: request)
    }
    
    /// Append the data to the cache of the task.
    ///
    /// - Parameters:
    ///   - data: The attached data.
    ///   - task: The task.
    func append(_ data: Data, toCacheOf task: NetworkTask) {
        guard let index = tasks.index(of: task) else {
            Logger.standard.log(error: NetworkHelper.taskExistanceError, withDetail: task.task.originalRequest?.url?.absoluteString)
            return
        }
        tasks[index].append(data)
    }
    
    /// Get the identifier of a task.
    ///
    /// - Parameter sessionTask: The task.
    /// - Returns: The task. Nil would be returned if no task is found, which shouldn't happen.
    func task(of sessionTask: URLSessionTask) -> NetworkTask? {
        for task in tasks {
            if task.task === sessionTask {
                return task
            }
        }
        Logger.standard.log(error: NetworkHelper.taskExistanceError, withDetail: sessionTask.originalRequest?.url?.absoluteString)
        return nil
    }
    
    /// Remove a task from the task stack.
    ///
    /// - Parameter task: The task.
    func remove(_ task: NetworkTask) {
        task.cancel()
        guard let index = tasks.index(of: task) else {
            Logger.standard.log(error: NetworkHelper.taskExistanceError, withDetail: task.task.originalRequest?.url?.absoluteString)
            return
        }
        tasks.remove(at: index)
    }
    
    /// Report an error back to the main thread.
    ///
    /// - Parameters:
    ///   - task: The task.
    ///   - message: The error message.
    func dispatchError(for task: NetworkTask, withMessage message: String) {
        let localizedMessage = message.localizedInternalString(forType: NetworkHelper.self)
        DispatchQueue.main.async {
            self.networkHelperDelegate?.networkHelper(self, withIdentifier: task.identifier, didCatchError: localizedMessage)
        }
    }
    
    /// Create a new request.
    ///
    /// - Parameters:
    ///   - url: The url address.
    ///   - type: The method of the request.
    ///   - header: The HTTP header.
    /// - Returns: The request.
    private func request(withURL url: String, with header: NetworkRequestHeader, as type: NetworkRequestType) -> URLRequest? {
        guard let parsedURLString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            Logger.standard.log(error: NetworkHelper.urlError, withDetail: url)
            return nil
        }
        guard let url = URL(string: parsedURLString) else {
            Logger.standard.log(error: NetworkHelper.urlError, withDetail: parsedURLString)
            return nil
        }
        var header = header
        var request = URLRequest(url: url)
        if !NetworkHelper.isNetworkAvailable {
            // Support offline mode.
            request.cachePolicy = URLRequest.CachePolicy.returnCacheDataElseLoad
        }
        // Read cache related information and put it into the header
        let cachedResponse = cache.cachedResponse(for: request)
        if cachedResponse != nil {
            let networkResponse = NetworkResponseHeader.header(from: cachedResponse!.response)
            header.ifModifiedSince = networkResponse?.lastModified
            header.ifNoneMatch = networkResponse?.eTag
        }
        request.allHTTPHeaderFields = header.dictionary
        request.httpMethod = type.rawValue
        return request
    }
    
    /// Send a request.
    ///
    /// - Parameters:
    ///   - request: The request to be sent.
    ///   - type: The type of the request.
    /// - Returns: The identifier of the task.
    private func send(_ request: URLRequest, as type: NetworkTaskType) -> String? {
        var task: NetworkTask
        let idGenerator = IDGenerator.standard
        let emptyCache = Data()
        switch type {
        case .download:
            task = NetworkTask(task: backgroundSession.downloadTask(with: request), idGenerator: idGenerator, cache: emptyCache)
        case .data:
            task = NetworkTask(task: normalSession.dataTask(with: request), idGenerator: idGenerator, cache: emptyCache)
        case .upload:
            let data = request.httpBody ?? Data()
            task = NetworkTask(task: normalSession.uploadTask(with: request, from: data), idGenerator: idGenerator, cache: emptyCache)
        default:
            Logger.standard.log(error: NetworkHelper.taskTypeError, withDetail: type)
            return nil
        }
        tasks.append(task)
        task.task.resume()
        return task.identifier
    }
    
}


import Foundation
import SystemConfiguration



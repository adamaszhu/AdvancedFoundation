/// NetowrkHelper is used to perform basic level internet connection.
///
/// - author: Adamas
/// - version: 1.9.2
/// - date: 28/03/2023
public class NetworkHelper: NSObject {
    
    /// The default helper.
    public static let standard: NetworkHelper? = {
        guard let bundleName = AppInfoAccessor.standard.bundleName else {
            return nil
        }
        return NetworkHelper(identifier: bundleName)
    }()
    
    /// Whether the network is available or not. This method is referenced from http://stackoverflow.com/questions/39558868/check-internet-connection-ios-10
    public var isNetworkAvailable: Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        guard SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) else {
            Logger.standard.logError(Self.settingError)
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return isReachable && !needsConnection
    }
    
    /// The delegate of the Self.
    public weak var delegate: NetworkHelperDelegate?
    
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
    ///   - identifier: The identifier used to identify the URL download session running in the background.
    ///   - cache: The cache to cache all request. Nil means use the default one.
    public init(identifier: String = String(Date().timeIntervalSince1970),
                cache: URLCache = URLCache.shared) {
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
    ///   - urlString: The url of the destination.
    ///   - header: The header of the post.
    ///   - body: The content of the request.
    ///   - type: The type of the request.
    ///   - isUploadTask: Whether the task should be run in the background or not.
    /// - Returns: The identifier of the task.
    public func postData(toURL urlString: String,
                         with body: Data,
                         as type: NetworkBodyType,
                         with header: NetworkRequestHeader? = nil,
                         asUploadTask isUploadTask: Bool = false) -> String? {
        var header = header ?? NetworkRequestHeader()
        header.contentType = type.rawValue
        header.contentLength = body.count
        guard var request = request(withURL: urlString, with: header, as: .post) else {
            return nil
        }
        request.httpBody = body
        let type = isUploadTask ? NetworkTaskType.upload : NetworkTaskType.data
        return send(request, as: type)
    }
    
    /// Post a form to a specific url.
    ///
    /// - Parameters:
    ///   - urlString: The url of the destination.
    ///   - header: The header of the post.
    ///   - formData: The form data to be posted.
    ///   - isUploadTask: Whether the task should be run in the background or not.
    /// - Returns: The identifier of the task.
    public func postData(toURL urlString: String,
                         with formData: FormData,
                         with header: NetworkRequestHeader? = nil,
                         asUploadTask isUploadTask: Bool = false) -> String? {
        postData(toURL: urlString,
                 with: formData.data,
                 as: .formData,
                 with: header,
                 asUploadTask: isUploadTask)
    }
    
    
    /// Send a get request.
    ///
    /// - Parameters:
    ///   - urlString: The url of the destination.
    ///   - header: The header of the get.
    ///   - isDownloadTask: Whether current task is a download task or not.
    /// - Returns: The task identifier.
    public func getData(fromURL urlString: String,
                        with header: NetworkRequestHeader? = nil,
                        asDownloadTask isDownloadTask: Bool = false) -> String? {
        let header = header ?? NetworkRequestHeader()
        guard let request = request(withURL: urlString, with: header, as: .get) else {
            return nil
        }
        let type = isDownloadTask ? NetworkTaskType.download : NetworkTaskType.data
        return send(request, as: type)
    }
    
    /// Send a delete request.
    ///
    /// - Parameters:
    ///   - urlString: The address of the destination.
    ///   - header: The header of the delete.
    /// - Returns: The identifier of the new task.
    public func deleteData(atURL urlString: String,
                           with header: NetworkRequestHeader? = nil) -> String? {
        let header = header ?? NetworkRequestHeader()
        guard let request = request(withURL: urlString, with: header, as: .delete) else {
            return nil
        }
        return send(request, as: .data)
    }
    
    /// Reset the internet, which will cancel all the current internet connections.
    public func reset() {
        tasks.forEach { $0.task.cancel() }
        tasks.removeAll()
    }
    
    /// Clear all cache data.
    public func clearCache() {
        cache.removeAllCachedResponses()
    }
    
    /// Clear the cache for a specific request.
    ///
    // - Parameter urlString: The address of the destination.
    public func clearCache(forURL urlString: String) {
        guard let parsedURLString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: parsedURLString) else {
            Logger.standard.logError(Self.urlError, withDetail: urlString)
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
        guard let index = tasks.firstIndex(of: task) else {
            Logger.standard.logError(Self.taskError, withDetail: task.task.originalRequest?.url?.absoluteString)
            return
        }
        tasks[index].append(data)
    }
    
    /// Get the identifier of a task.
    ///
    /// - Parameter sessionTask: The task.
    /// - Returns: The task. Nil would be returned if no task is found, which shouldn't happen.
    func task(of sessionTask: URLSessionTask) -> NetworkTask? {
        let foundTask = tasks.first { $0.task === sessionTask }
        if foundTask == nil {
            Logger.standard.logError(Self.taskError, withDetail: sessionTask.originalRequest?.url?.absoluteString)
        }
        return foundTask
    }
    
    /// Remove a task from the task stack.
    ///
    /// - Parameter task: The task.
    func remove(_ task: NetworkTask) {
        task.cancel()
        guard let index = tasks.firstIndex(of: task) else {
            Logger.standard.logError(Self.taskError, withDetail: task.task.originalRequest?.url?.absoluteString)
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
        let localizedMessage = message.localizedInternalString(forType: Self.self)
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.delegate?.networkHelper(self,
                                         withIdentifier: task.identifier,
                                         didCatchError: localizedMessage)
        }
    }
    
    /// Create a new request.
    ///
    /// - Parameters:
    ///   - urlString: The url address.
    ///   - type: The method of the request.
    ///   - header: The HTTP header.
    /// - Returns: The request.
    private func request(withURL urlString: String,
                         with header: NetworkRequestHeader,
                         as type: NetworkRequestType) -> URLRequest? {
        guard let parsedURLString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                let url = URL(string: parsedURLString) else {
            Logger.standard.logError(Self.urlError, withDetail: urlString)
            return nil
        }
        var header = header
        var request = URLRequest(url: url)
        if !isNetworkAvailable {
            // Support offline mode.
            request.cachePolicy = .returnCacheDataElseLoad
        }
        // Read cache related information and put it into the header
        let cachedResponse = cache.cachedResponse(for: request)
        if let cachedResponse = cachedResponse {
            let networkResponse = NetworkResponseHeader(response: cachedResponse.response)
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
            task = NetworkTask(task: backgroundSession.downloadTask(with: request),
                               identifier: idGenerator.uniqueID,
                               cache: emptyCache)
        case .data:
            task = NetworkTask(task: normalSession.dataTask(with: request),
                               identifier: idGenerator.uniqueID,
                               cache: emptyCache)
        case .upload:
            let data = request.httpBody ?? Data()
            task = NetworkTask(task: normalSession.uploadTask(with: request, from: data),
                               identifier: idGenerator.uniqueID,
                               cache: emptyCache)
        default:
            Logger.standard.logError(Self.taskTypeError, withDetail: type)
            return nil
        }
        tasks.append(task)
        task.task.resume()
        return task.identifier
    }
}

/// Constants
private extension NetworkHelper {
    
    /// System error.
    static let urlError = "The url address is invalid."
    static let taskError = "The task doesn't exist."
    static let taskTypeError = "The task type hasn't been supported yet."
    static let settingError = "The network setting cannot be read."
}

import Foundation
import SystemConfiguration

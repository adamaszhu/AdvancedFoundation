/**
 * NetowrkHelper is used to perform basic level internet connection.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 04/05/2017
 */
public class NetworkHelper {
    
    /**
     * System document directory. Which is used to store downloaded files.
     */
    private let documentDirectory = "Documents/"
    
    /**
     * The delegate of the NetworkHelper.
     */
    public var networkHelperDelegate: NetworkHelperDelegate?
    
    
        /**
         * The task list.
         */
        private var tasks: Array<NetworkHelperTask>
    //
    //    /**
    //     * The session connecting to the network.
    //     */
    //    fileprivate var normalSession: Foundation.URLSession
    //
    //    /**
    //     * The session used to download or upload in background mode.
    //     */
    //    fileprivate var backgroundSession: Foundation.URLSession
    //
    //    /**
    //     * The cache used in the app.
    //     */
    //    fileprivate var cache: URLCache
    //
    //    /**
    //     * Move the downloaded file.
    //     */
    //    fileprivate var fileHelper: FileHelper
    
    /**
     * Whether the network is available or not. This method is referenced from http://stackoverflow.com/questions/39558868/check-internet-connection-ios-10
     */
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
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    //    /**
    //     * User error.
    //     */
    //    fileprivate static let InternetError = "InternetError"
    //    fileprivate static let ServerError = "ServerError"
    //    fileprivate static let AppError = "AppError"
    //
    //    /**
    //     * System error.
    //     */
    //    fileprivate static let APIAddressError = "The API address is invalid."
    //    fileprivate static let TaskExistanceError = "The task doesn't exist."
    //    fileprivate static let TaskTypeError = "The task type has not been supported yet."
    //    fileprivate static let FileMoveError = "The downloaded file cannot be moved to the temp directory."
    //
    

    //
    //    /**
    //     * Initialize the object.
    //     * - version: 0.1.6
    //     * - date: 08/09/2016
    //     * - parameter identifier: The identifier used to identify the URL session running in the background.
    //     */
    //    public init(withIdentifier identifier: String) {
    //        networkHelperTaskList = []
    //        fileHelper = FileHelper()
    //        cache = URLCache.shared
    //        normalSession = Foundation.URLSession()
    //        backgroundSession = Foundation.URLSession()
    //        super.init()
    //        var configuration = URLSessionConfiguration.default
    //        normalSession = Foundation.URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    //        configuration = URLSessionConfiguration.background(withIdentifier: identifier)
    //        configuration.sessionSendsLaunchEvents = true
    //        configuration.isDiscretionary = true
    //        backgroundSession = Foundation.URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    //    }
    //
    //    /**
    //     * Send a asychoronous post request.
    //     * - version: 0.1.7
    //     * - date: 07/10/2016
    //     * - parameter path: The url of the destination.
    //     * - parameter headerList: The header of the post.
    //     * - parameter type: The type of the request.
    //     * - parameter content: The content of the request.
    //     * - returns: The identifier of the task.
    //     */
    //    open func postRawData(toURL path: String, withHeaderList headerList: Dictionary<String, String>? = nil, withContent content: String, asType type: NetworkBodyType = NetworkBodyType.Text) -> String? {
    //        let request = createRequest(withPath: path, withHeaderList: headerList, withMethod: NetworkHelper.PostMethod)
    //        request?.addValue(type.rawValue, forHTTPHeaderField: NetworkHelper.ContentTypeHeader)
    //        request?.httpBody = content.data(using: String.Encoding.utf8)
    //        return sendRequest(request, asType: NetworkHelperTaskType.data)
    //    }
    //
    //    /**
    //     * Send a request as a form data.
    //     * - version: 0.1.7
    //     * - date: 07/10/2016
    //     * - parameter path: The url of the destination.
    //     * - parameter headerList: The header of the post.
    //     * - parameter formValue: The value within the form. The value should be [name: value] or [name: data]
    //     * - returns: The identifier of the new task.
    //     */
    //    open func postFormData(toURL path: String, withHeaderList headerList: Dictionary<String, String>? = nil, withValues valueList: Dictionary<String, AnyObject> = [:]) -> String? {
    //        let request = createRequest(withPath: path, withHeaderList: headerList, withMethod: NetworkHelper.PostMethod)
    //        let boundary = "----NetworkHelper"
    //        let contentType = "multipart/form-data; boundary=" + boundary
    //        request?.addValue(contentType, forHTTPHeaderField: NetworkHelper.ContentTypeHeader)
    //        // COMMENT: Body
    //        let body = NSMutableData();
    //        let seperator = ("--" + boundary + "\r\n").data(using: String.Encoding.utf8)!
    //        let endSeperator = ("--" + boundary + "--\r\n").data(using: String.Encoding.utf8)!
    //        for key in valueList.keys {
    //            body.append(seperator)
    //            if valueList[key]!.isKind(of: Data) {
    //                // COMMENT: The value is a file.
    //                let data = valueList[key]! as! Data
    //                let fileInfo = FileInfoAccessor(withPath: key)
    //                let filename = fileInfo.filename == nil ? "" : fileInfo.filename!
    //                let mimeType = fileInfo.mimeType == nil ? "" : fileInfo.mimeType!
    //                let field = "Content-Disposition: form-data; name=\"" + filename + "\"; filename=\"" + key + "\"\r\nContent-Type:" + mimeType + "\r\n\r\n"
    //                body.append(field.data(using: String.Encoding.utf8)!)
    //                body.append(data)
    //            } else if valueList[key]!.isKind(of: NSString) {
    //                // COMMENT: The value is a string.
    //                let value = valueList[key]! as! String
    //                let field = "Content-Disposition: form-data; name=\"" + key + "\"\r\n\r\n" + value
    //                body.append(field.data(using: String.Encoding.utf8)!)
    //            } else {
    //                // TODO: Deal with other variable type.
    //            }
    //            body.append("\r\n".data(using: String.Encoding.utf8)!)
    //        }
    //        body.append(endSeperator)
    //        request?.httpBody = body
    //        // COMMENT: Body length
    //        let bodyLength = String(body.length)
    //        request?.addValue(bodyLength, forHTTPHeaderField: NetworkHelper.ContentLengthHeader)
    //        return sendRequest(request, asType: NetworkHelperTaskType.upload)
    //    }
    //
    //    /**
    //     * Send a get request.
    //     * - version: 0.1.7
    //     * - date: 07/10/2016
    //     * - parameter path: The url of the destination.
    //     * - parameter headerList: The header of the get.
    //     * - parameter download: Whether current task is a download task or not.
    //     * - returns: The task identifier.
    //     */
    //    open func getResource(fromURL path: String, withHeaderList headerList: Dictionary<String, String>? = nil, asDownloadTask download: Bool = false) -> String? {
    //        let request = createRequest(withPath: path, withHeaderList: headerList, withMethod: NetworkHelper.GetMethod)
    //        let type = download ? NetworkHelperTaskType.download : NetworkHelperTaskType.data
    //        return sendRequest(request, asType: type)
    //    }
    //
    //    /**
    //     * Send a asychoronous put request.
    //     * - version: 0.1.7
    //     * - date: 07/10/2016
    //     * - parameter path: The url of the destination.
    //     * - parameter headerList: The header of the post.
    //     * - parameter type: The type of the request.
    //     * - parameter content: The content of the request.
    //     * - returns: The identifier of the new task.
    //     */
    //    open func putRawData(toURL path: String, withHeaderList headerList: Dictionary<String, String>? = nil, withContent content: String, asType type: NetworkBodyType = NetworkBodyType.Text) -> String? {
    //        let request = createRequest(withPath: path, withHeaderList: headerList, withMethod: NetworkHelper.PutMethod)
    //        request?.addValue(type.rawValue, forHTTPHeaderField: NetworkHelper.ContentTypeHeader)
    //        request?.httpBody = content.data(using: String.Encoding.utf8)
    //        return sendRequest(request, asType: NetworkHelperTaskType.data)
    //    }
    //
    //    /**
    //     * Send an asynchronous delete request.
    //     * - version: 0.1.7
    //     * - date: 07/10/2016
    //     * - parameter path: The address of the destination.
    //     * - parameter headerList: The header of the delete.
    //     * - returns: The identifier of the new task.
    //     */
    //    open func deleteResource(atURL path: String, withHeaderList headerList: Dictionary<String, String>? = nil) -> String? {
    //        let request = createRequest(withPath: path, withHeaderList: headerList, withMethod: NetworkHelper.DeleteMethod)
    //        return sendRequest(request, asType: NetworkHelperTaskType.data)
    //    }
    //
    //    /**
    //     * Reset the internet, which will cancel all the current internet connections.
    //     * - version: 0.1.7
    //     * - date: 07/10/2016
    //     */
    //    open func reset() {
    //        for networkHelperTask in networkHelperTaskList {
    //            networkHelperTask.task.cancel()
    //        }
    //        networkHelperTaskList.removeAll()
    //    }
    //
    //    /**
    //     * Clear the cache for a specific request.
    //     * - version: 0.1.7
    //     * - date: 07/10/2016
    //     * - parameter path: The address of the destination.
    //     */
    //    open func clearCache(forRequest path: String) {
    //        let parsedPath = path.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
    //        if parsedPath == nil {
    //            logError(NetworkHelper.APIAddressError, withDetail: path)
    //            return
    //        }
    //        let url = URL(string: parsedPath!)
    //        if url == nil {
    //            logError(NetworkHelper.APIAddressError, withDetail: path)
    //            return
    //        }
    //        let request = NSMutableURLRequest(url: url!)
    //        cache.removeCachedResponse(for: request)
    //    }
    //
    //    /**
    //     * Clear all cache data.
    //     * - version: 0.1.7
    //     * - date: 07/10/2016
    //     */
    //    open func clearCache() {
    //        cache.removeAllCachedResponses()
    //    }
    //
    //    /**
    //     * Create a new request.
    //     * - version: 0.1.7
    //     * - date: 07/10/2016
    //     * - parameter path: The url address.
    //     * - parameter method: The method of the request.
    //     * - parameter headerList: The header list.
    //     * - returns: The request.
    //     */
    //    fileprivate func createRequest(withPath path: String, withHeaderList headerList: Dictionary<String, String>? = nil, withMethod method: String) -> NSMutableURLRequest? {
    //        let parsedPath = path.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
    //        if parsedPath == nil {
    //            logError(NetworkHelper.APIAddressError, withDetail: path)
    //            return nil
    //        }
    //        let url = URL(string: parsedPath!)
    //        if url == nil {
    //            logError(NetworkHelper.APIAddressError, withDetail: path)
    //            return nil
    //        }
    //        let request = NSMutableURLRequest(url: url!)
    //        if !NetworkHelper.isNetworkAvailable {
    //            // COMMENT: Support offline mode.
    //            request.cachePolicy = NSURLRequest.CachePolicy.returnCacheDataElseLoad
    //        }
    //        request.httpMethod = method
    //        if headerList != nil {
    //            for header in headerList!.keys {
    //                request.addValue(headerList![header]!, forHTTPHeaderField: header)
    //            }
    //        }
    //        // COMMENT: Read cache related information and put it into the header
    //        let cachedResponse = cache.cachedResponse(for: request)
    //        let httpResponse = cachedResponse?.response as? HTTPURLResponse
    //        let cacheDate = httpResponse?.allHeaderFields[NetworkHelper.LastModifiedHeader] as? String
    //        let cacheETag = httpResponse?.allHeaderFields[NetworkHelper.ETagHeader] as? String
    //        if (cacheDate != nil) {
    //            request.addValue(cacheDate!, forHTTPHeaderField: NetworkHelper.IfModifiedSinceHeader)
    //        }
    //        if (cacheETag != nil) {
    //            request.addValue(cacheETag!, forHTTPHeaderField: NetworkHelper.IfNoneMatchHeader)
    //        }
    //        return request
    //    }
    //
    //    /**
    //     * Send a request.
    //     * - version: 0.1.7
    //     * - date: 07/10/2016
    //     * - parameter request: The request to be sent.
    //     * - parameter type: The type of the request.
    //     * - returns: The identifier of the task.
    //     */
    //    fileprivate func sendRequest(_ request: URLRequest?, asType type: NetworkHelperTaskType) -> String? {
    //        if request == nil {
    //            // COMMENT: The error has been logged while creating the request.
    //            return nil
    //        }
    //        var networkHelperTask: NetworkHelperTask
    //        switch type {
    //        case .download:
    //            networkHelperTask = NetworkHelperTask(withTask: backgroundSession.downloadTask(with: request!))
    //        case .data:
    //            networkHelperTask = NetworkHelperTask(withTask: normalSession.dataTask(with: request!))
    //        case .upload:
    //            let data = request!.httpBody == nil ? Data() : request!.httpBody!
    //            networkHelperTask = NetworkHelperTask(withTask: normalSession.uploadTask(with: request!, from: data))
    //        default:
    //            logError(NetworkHelper.TaskTypeError)
    //            return nil
    //        }
    //        networkHelperTaskList.append(networkHelperTask)
    //        networkHelperTask.task.resume()
    //        return networkHelperTask.identifier
    //    }
    //
    //    /**
    //     * Get the identifier of a task.
    //     * - version: 0.1.7
    //     * - date: 07/10/2016
    //     * - parameter sessionTask: The task.
    //     * - returns: The task.
    //     */
    //    fileprivate func findTask(_ sessionTask: URLSessionTask) -> NetworkHelperTask? {
    //        for networkHelperTask in networkHelperTaskList {
    //            if networkHelperTask.task === sessionTask {
    //                return networkHelperTask
    //            }
    //        }
    //        return nil
    //    }
    //
    //    /**
    //     * Report an error back to the main thread.
    //     * - version: 0.1.7
    //     * - date: 07/10/2016
    //     * - parameter task: The task.
    //     * - parameter message: The error message.
    //     */
    //    fileprivate func dispatchError(forTask task: NetworkHelperTask, withMessage message: String) {
    //        DispatchQueue.main.async{
    //            self.networkHelperDelegate?.networkHelper(self, withIdentifier: task.identifier, didCatchError: message.localizeInBundle(forClass: self.classForCoder))
    //        }
    //    }
    //
    //    /**
    //     * Remove a task from the task stack.
    //     * - version: 0.1.7
    //     * - date: 07/10/2016
    //     * - parameter task: The task.
    //     */
    //    fileprivate func removeTask(_ task: NetworkHelperTask) {
    //        task.task.cancel()
    //        let index = networkHelperTaskList.index(of: task)
    //        if index != nil {
    //            networkHelperTaskList.remove(at: index!)
    //        } else {
    //            logError(NetworkHelper.AppError)
    //        }
    //    }
    //
    
}


import Foundation
import SystemConfiguration




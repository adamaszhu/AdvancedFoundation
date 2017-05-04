/**
 * NetowrkHelper is used to perform basic level internet connection.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 04/05/2017
 */
public class NetworkHelper  {
    
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
//    /**
//     * System document directory.
//     */
//    fileprivate static let DocumentFolder = "Documents/"
//    
//    /**
//     * HTTP methods.
//     */
//    fileprivate static let PostMethod = "POST"
//    fileprivate static let GetMethod = "GET"
//    fileprivate static let DeleteMethod = "DELETE"
//    fileprivate static let PutMethod = "PUT"
//    
//    /**
//     * HTTP headers.
//     */
//    fileprivate static let ContentTypeHeader = "Content-Type"
//    fileprivate static let ContentLengthHeader = "Content-Length"
//    fileprivate static let LastModifiedHeader = "Last-Modified"
//    fileprivate static let ETagHeader = "ETag"
//    fileprivate static let IfModifiedSinceHeader = "If-Modified-Since"
//    fileprivate static let IfNoneMatchHeader = "If-None-Match"
//    
//    /**
//     * Whether the network is available or not. This method is referenced from http://stackoverflow.com/questions/30743408/check-for-internet-connection-in-swift-2-ios-9.
//     */
//    open static var isNetworkAvailable: Bool {
//        /**
//         * - version: 0.1.7
//         * - date: 07/10/2016
//         */
//        get {
//            var zeroAddress = sockaddr_in()
//            zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
//            zeroAddress.sin_family = sa_family_t(AF_INET)
//            let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
//                SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
//            }
//            var flags = SCNetworkReachabilityFlags()
//            if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
//                return false
//            }
//            let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
//            let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
//            return (isReachable && !needsConnection)
//        }
//    }
//    
//    /**
//     * The delegate of the NetworkHelper.
//     */
//    open var networkHelperDelegate: NetworkHelperDelegate?
//    
//    /**
//     * The task list.
//     */
//    fileprivate var networkHelperTaskList: Array<NetworkHelperTask>
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
//    /**
//     * - version: 0.1.7
//     * - date: 07/10/2016
//     */
//    open func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
//        let networkHelperTask = findTask(task)
//        if networkHelperTask == nil {
//            logError(NetworkHelper.TaskExistanceError)
//            return
//        }
//        removeTask(networkHelperTask!)
//        if error != nil {
//            logError(error!.localizedDescription)
//            dispatchError(forTask: networkHelperTask!, withMessage: NetworkHelper.InternetError)
//            return
//        }
//        DispatchQueue.main.async{
//            switch networkHelperTask!.type {
//            case .download:
//                // COMMENT: The url has been returned
//                break
//            case .upload, .data:
//                self.networkHelperDelegate?.networkHelper?(self, withIdentifier: networkHelperTask!.identifier, didReceiveData: networkHelperTask!.cache)
//            default:
//                self.logError(NetworkHelper.TaskTypeError)
//                self.networkHelperDelegate?.networkHelper(self, withIdentifier: networkHelperTask!.identifier, didCatchError: NetworkHelper.AppError.localizeInBundle(forClass: self.classForCoder))
//            }
//        }
//    }
//    
//    /**
//     * - version: 0.1.6
//     * - date: 08/09/2016
//     */
//    open func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
//        let networkHelperTask = findTask(dataTask)
//        if networkHelperTask == nil {
//            logError(NetworkHelper.TaskExistanceError)
//            return
//        }
//        if !response.isKind(of: HTTPURLResponse.classForCoder()) {
//            removeTask(networkHelperTask!)
//            logError(NetworkHelper.ServerError)
//            dispatchError(forTask: networkHelperTask!, withMessage: NetworkHelper.ServerError)
//            return
//        }
//        let httpResponse = response as! HTTPURLResponse
//        if httpResponse.statusCode == 404 {
//            removeTask(networkHelperTask!)
//            logError(NetworkHelper.ServerError)
//            dispatchError(forTask: networkHelperTask!, withMessage: NetworkHelper.ServerError)
//            return
//        }
//        DispatchQueue.main.async{
//            var headerFieldList = Dictionary<String, String>()
//            for header in httpResponse.allHeaderFields.keys {
//                if (header.isKind(of: NSString.self) && httpResponse.allHeaderFields[header]!.isKind(of: NSString)) {
//                    headerFieldList.updateValue(httpResponse.allHeaderFields[header] as! String, forKey: header as! String)
//                }
//            }
//            self.networkHelperDelegate?.networkHelper?(self, withIdentifier: networkHelperTask!.identifier, didReceiveResponse: headerFieldList, withStatusCode: httpResponse.statusCode)
//        }
//        let shouldContinue = self.networkHelperDelegate?.networkHelperShouldReceiveData?(self, withIdentifier: networkHelperTask!.identifier)
//        if shouldContinue == false {
//            // COMMENT: Only the response is required.
//            removeTask(networkHelperTask!)
//            completionHandler(Foundation.URLSession.ResponseDisposition.cancel)
//        } else {
//            completionHandler(Foundation.URLSession.ResponseDisposition.allow)
//        }
//    }
//    
//    /**
//     * - version: 0.1.6
//     * - date: 08/09/2016
//     */
//    open func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
//        let networkHelperTask = findTask(dataTask)
//        if networkHelperTask == nil {
//            logError(NetworkHelper.TaskExistanceError)
//            return
//        }
//        networkHelperTask!.cache.append(data)
//    }
//    
//    /**
//     * - version: 0.1.6
//     * - date: 08/09/2016
//     */
//    open func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
//        let networkHelperTask = findTask(downloadTask)
//        if networkHelperTask == nil {
//            logError(NetworkHelper.TaskExistanceError)
//            return
//        }
//        DispatchQueue.main.async{
//            self.networkHelperDelegate?.networkHelper?(self, withIdentifier: networkHelperTask!.identifier, didDownloadPercentage: Double(totalBytesWritten) / Double(totalBytesExpectedToWrite))
//        }
//    }
//    
//    /**
//     * - version: 0.1.6
//     * - date: 08/09/2016
//     */
//    open func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo url: URL) {
//        let networkHelperTask = findTask(downloadTask)
//        if networkHelperTask == nil {
//            logError(NetworkHelper.TaskExistanceError)
//            return
//        }
//        let destinationPath = NetworkHelper.DocumentFolder + networkHelperTask!.identifier
//        let result = fileHelper.copyFile(fromPath: url.path!, toPath: destinationPath)
//        if result == true {
//            DispatchQueue.main.async{
//                self.networkHelperDelegate?.networkHelper?(self, withIdentifier: networkHelperTask!.identifier, didDownloadToURL: destinationPath)
//            }
//        } else {
//            DispatchQueue.main.async{
//                self.networkHelperDelegate?.networkHelper(self, withIdentifier: networkHelperTask!.identifier, didCatchError: NetworkHelper.FileMoveError)
//            }        }
//    }
    
}


import Foundation
import SystemConfiguration




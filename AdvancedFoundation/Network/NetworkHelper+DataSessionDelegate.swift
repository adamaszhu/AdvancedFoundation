/**
 * NetworkHelper+DataSessionDelegate delegates the action for a data task.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 06/05/2017
 */
extension NetworkHelper: URLSessionDataDelegate {
    
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
}

import Foundation

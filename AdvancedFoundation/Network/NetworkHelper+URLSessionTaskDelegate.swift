////
////  NetworkHelper+URLSessionTaskDelegate.swift
////  AdvancedFoundation
////
////  Created by Adamas Zhu on 4/5/17.
////  Copyright © 2017 Adamas. All rights reserved.
////
//extension NetworkHelper: URLSessionTaskDelegate {
//    
//}
//
//import Foundation






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

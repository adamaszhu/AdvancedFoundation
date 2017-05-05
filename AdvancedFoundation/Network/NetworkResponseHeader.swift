/**
 * NetworkResponseHeader includes the header information returned by a network call.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 05/05/2017
 */
public struct NetworkResponseHeader {
    
    /**
     * The status code of the network response.
     */
    let statusCode: Int
    
    /**
     * Initalize the response header.
     * - parameter statusCode: The status code.
     */
    init(statusCode: Int) {
        self.statusCode = statusCode
    }
    
}

import Foundation

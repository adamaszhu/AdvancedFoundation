/**
 * FormDataField determines what a form field should do.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 08/05/2017
 */
protocol FormDataField {
    
    /**
     * Convert the field to a data object.
     * - returns: The data object.
     */
    func convertToData() -> Data
    
}

import Foundation

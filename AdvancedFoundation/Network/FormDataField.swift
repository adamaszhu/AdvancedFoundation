/// FormDataField determines what a form field should do.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 13/07/2017
protocol FormDataField {
    
    /// Convert the field to a data object.
    var data: Data { get }
    
}

import Foundation

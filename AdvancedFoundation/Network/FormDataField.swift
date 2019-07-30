/// FormDataField determines what a form field should do.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 02/04/2019
protocol FormDataField {
    
    /// Convert the field to a data object.
    var data: Data { get }
}

import Foundation

/// FormDataFileField contains the information about a file field.
///
/// - author: Adamas
/// - version: 1.1.0
/// - date: 13/07/2017
public struct FormDataFileField {
    
    /// The name of the field.
    let name: String
    
    /// The content of the file.
    let content: Data
    
    /// The path of the file, which will be used to extract the file name and file extension.
    let path: String
    
}

import Foundation
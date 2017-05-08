/**
 * WWWFormFieldParsable determines what a form field should do.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 08/05/2017
 */
public protocol WWWFormFieldParsable {
    
    func convertToData() -> Data
    
}

import Foundation

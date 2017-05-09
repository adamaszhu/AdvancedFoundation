class FormDataFileParsableSpecs: QuickSpec {
    
    override func spec() {
        let fileField = FormDataFileField(name: "File", content: "Test".data(using: .utf8)!, path: "Test.png")
        describe("calls convertToData()") {
            it("returns data with correct content") {
                let expectData = "Content-Disposition: form-data; name=\"File\"; filename=\"Test\"\r\nContent-Type: image/png\r\n\r\nTest\r\n".data(using: .utf8)!
                expect(fileField.convertToData()) == expectData
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation





import Foundation

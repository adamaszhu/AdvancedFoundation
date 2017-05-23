class FormDataTextFieldParsableSpecs: QuickSpec {
    
    override func spec() {
        let textField = FormDataTextField(name: "Text", value: "Test")
        describe("calls convertToData()") {
            it("returns data with correct content") {
                let expectData = "Content-Disposition: form-data; name=\"Text\"\r\n\r\nTest\r\n".data(using: .utf8)!
                expect(textField.convertToData()) == expectData
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

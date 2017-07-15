class FormDataTextFieldParsableSpecs: QuickSpec {
    
    override func spec() {
        let textField = FormDataTextField(name: "Text", value: "Test")
        describe("has data") {
            it("returns data with correct content") {
                let expectData = "Content-Disposition: form-data; name=\"Text\"\r\n\r\nTest\r\n".data(using: .utf8)!
                expect(textField.data) == expectData
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

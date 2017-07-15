class FormDataParserSpecs: QuickSpec {
    
    override func spec() {
        let textField = FormDataTextField(name: "Text", value: "Test")
        let fileField = FormDataFileField(name: "File", content: Data(), path: "Test.png")
        let formData = FormData(fields: [textField, fileField])
        describe("has data") {
            it("returns data with correct length") {
                let seperatorData = "------FormData\r\n------FormData\r\n------FormData--\r\n".data(using: .utf8)!
                expect(formData.data.count) == seperatorData.count + textField.data.count + fileField.data.count
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

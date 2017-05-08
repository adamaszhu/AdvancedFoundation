class FormDataParserSpecs: QuickSpec {
    
    override func spec() {
        describe("calls convertToData()") {
            let textField = FormDataTextField(name: "Text", value: "Test")
            let fileField = FormDataFileField(name: "File", content: Data(), path: "Test.png")
            let formData = FormData(fields: [textField, fileField])
            it("returns data with correct length") {
                let expectData = "------FormData\r\n" +
                "Content-Disposition: form-data; name=\"Text\"\r\n\r\n" +
                "Test\r\n" +
                "------FormData\r\n" +
                "Content-Disposition: form-data; name=\"File\"; filename=\"Test\"\r\n" +
                "Content-Type: image/png\r\n\r\n\r\n" +
                "------FormData--"
                print(expectData)
                print(String(data: formData.convertToData(), encoding: .utf8)!)
                expect(formData.convertToData().count) == expectData.data(using: .utf8)?.count
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation



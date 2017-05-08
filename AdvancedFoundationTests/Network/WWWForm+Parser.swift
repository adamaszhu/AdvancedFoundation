class WWWFormParserSpecs: QuickSpec {
    
    override func spec() {
        describe("calls convertToData()") {
            let textField = WWWFormTextField(name: "Text", value: "Test")
            let fileField = WWWFormFileField(name: "File", content: Data(), path: "Test.png")
            let wwwForm = WWWForm(fields: [textField, fileField])
            it("returns data with correct length") {
                let expectData = "------WebKitFormBoundary7MA4YWxkTrZu0gW
                Content-Disposition: form-data; name="Text"
                
                Test
                ------WebKitFormBoundary7MA4YWxkTrZu0gW
                Content-Disposition: form-data; name="File"; filename=""
                Content-Type: 
                
                
                ------WebKitFormBoundary7MA4YWxkTrZu0gW--"
                expect(wwwForm.convertToData().count) == expectDataLength
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation



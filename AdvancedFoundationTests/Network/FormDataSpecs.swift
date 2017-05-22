class FormDataSpecs: QuickSpec {
    
    override func spec() {
        let textField = FormDataTextField(name: "Text", value: "Test")
        describe("calls init(fields)") {
            it("returns FormData object with correct field") {
                let formData = FormData(fields: [textField])
                expect(formData.fields.count) == 1
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

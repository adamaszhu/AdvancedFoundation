class FormDataSpecs: QuickSpec {
    
    override func spec() {
        let textField = FormDataTextField(name: "Text", value: "Test")
        let formData = FormData(fields: [textField])
        describe("calls init(fields)") {
            it("returns FormData object with correct field") {
                expect(formData.fields.count) == 1
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation

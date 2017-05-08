class FormDataSpecs: QuickSpec {
    
    override func spec() {
        describe("calls init(fields)") {
            let field = FormDataTextField(name: "Test", value: "Test")
            let formData = FormData(fields: [field])
            it("returns form with fields") {
                expect(formData.fields.count) == 1
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

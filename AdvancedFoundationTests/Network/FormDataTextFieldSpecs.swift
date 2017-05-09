class FormDataTextFieldSpecs: QuickSpec {
    
    override func spec() {
        describe("calls init(name:value)") {
            let field = FormDataTextField(name: "Test", value: "Test")
            it("returns field with correct name") {
                expect(field.name) == "Test"
            }
            it("returns field with correct value") {
                expect(field.value) == "Test"
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

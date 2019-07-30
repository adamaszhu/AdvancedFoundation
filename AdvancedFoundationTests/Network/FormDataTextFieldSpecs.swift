class FormDataTextFieldSpecs: QuickSpec {
    
    override func spec() {
        describe("calls init(name:value)") {
            let textField = FormDataTextField(name: "File", value: "Test.png")
            it("returns object with correct name") {
                expect(textField.name) == "File"
            }
            it("returns object with correct value") {
                expect(textField.value) == "Test.png"
            }
        }
    }
}

import Foundation
import Quick
import Nimble
@testable import AdvancedFoundation

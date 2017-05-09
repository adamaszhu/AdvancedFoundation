class FormDataFileFieldSpecs: QuickSpec {
    
    override func spec() {
        describe("calls init(name:content:path)") {
            let field = FormDataFileField(name: "Test", content: "Test".data(using: .utf8)!, path: "Test.png")
            it("returns field with correct name") {
                expect(field.name) == "Test"
            }
            it("returns field with correct content") {
                let expectData = "Test".data(using: .utf8)!
                expect(field.content) == expectData
            }
            it("returns field with correct path") {
                expect(field.path) == "Test.png"
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

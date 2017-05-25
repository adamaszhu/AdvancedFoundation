class FormDataFileFieldSpecs: QuickSpec {
    
    override func spec() {
        describe("calls init(name:content:path)") {
            let fileField = FormDataFileField(name: "File", content: "Test".data(using: .utf8)!, path: "Test.png")
            it("returns object with correct name") {
                expect(fileField.name) == "File"
            }
            it("returns object with correct content") {
                expect(String(data: fileField.content, encoding: .utf8)) == "Test"
            }
            it("returns object with correct path") {
                expect(fileField.path) == "Test.png"
            }
        }
    }
    
}

import Foundation
import Quick
import Nimble
@testable import AdvancedFoundation

class WWWFormSpecs: QuickSpec {
    
    override func spec() {
        describe("calls init(fields)") {
            let field = WWWFormTextField(name: "Test", value: "Test")
            let wwwForm = WWWForm(fields: [field])
            it("returns form with fields") {
                expect(wwwForm.fields.count) == 1
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

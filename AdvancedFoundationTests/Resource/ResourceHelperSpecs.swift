class ResourceHelperSpecs: QuickSpec {
    
    override func spec() {
        describe("calls init(name)") {
            context("with invalid name") {
                let resourceHelper = ResourceHelper(name: "Temp")
                it("returns nil") {
                    expect(resourceHelper).to(beNil())
                }
            }
            context("with valid name") {
                let resourceHelper = ResourceHelper(name: "Avatar.jpg")
                it("returns the helper") {
                    expect(resourceHelper).toNot(beNil())
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation


class ResourceHelperSpecs: QuickSpec {
    
    override func spec() {
        describe("calls init(name:bundle)") {
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
            context("with valid bundle") {
                let resourceHelper = ResourceHelper(name: "Avatar.jpg", bundle: Bundle.main)
                it("returns the helper") {
                    expect(resourceHelper).toNot(beNil())
                }
            }
            context("with invalid bundle") {
                let resourceHelper = ResourceHelper(name: "Avatar.jpg", bundle: Bundle())
                it("returns nil") {
                    expect(resourceHelper).to(beNil())
                }
            }
        }
    }
}

import Foundation
import Quick
import Nimble
@testable import AdvancedFoundation

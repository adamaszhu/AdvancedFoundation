class ArrayAccessableSpecs: QuickSpec {
    
    override func spec() {
        let array = ["First", "Second", "Third"]
        describe("calls element(atIndex)") {
            context("with out of range index") {
                it("returns nil") {
                    expect(array[safe: 3]).to(beNil())
                }
            }
            context("with valid index") {
                it("returns correct element") {
                    expect(array[safe: 1]) == "Second"
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation

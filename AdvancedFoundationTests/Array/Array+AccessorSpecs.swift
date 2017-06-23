class ArrayAccessorSpecs: QuickSpec {
  
  override func spec() {
    let array = ["First", "Second", "Third"]
    describe("calls element(atIndex)") {
      context("with out of range index") {
        it("returns nil") {
          expect(array.element(atIndex: 3)).to(beNil())
        }
      }
      context("with valid index") {
        it("returns correct element") {
          expect(array.element(atIndex: 1)) == "Second"
        }
      }
    }
  }
  
}

import Quick
import Nimble
@testable import AdvancedFoundation

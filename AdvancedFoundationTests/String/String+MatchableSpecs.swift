final class StringMatchableSpecs: QuickSpec {
    
    override func spec() {
        describe("has operator ~=") {
            context("with existing string") {
                let regex = "^[a-z]$"
                let string = "a"
                it("returns true") {
                    expect(regex ~= string) == true
                }
            }
            context("with nonexisting string") {
                let regex = "^[a-z]$"
                let string = "1"
                it("returns false") {
                    expect(regex ~= string) == false
                }
            }
            context("with invalid regex") {
                let regex = "(S*D&F^"
                let string = "string"
                it("returns false") {
                    expect(regex ~= string) == false
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation

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
        describe("calls allMatches") {
            context("with nonexisting string") {
                let regex = "(str)"
                let string = "test"
                it("returns an empty array") {
                    expect(regex.allMatches(in: string).isEmpty) == true
                }
            }
            context("with one matching string") {
                let regex = "(str)"
                let string = "string"
                it("returns an array with a string") {
                    expect(regex.allMatches(in: string)) == ["str"]
                }
            }
            context("with multiple matching strings") {
                let regex = "(str)"
                let string = "stringstring"
                it("returns an array with multiple strings") {
                    expect(regex.allMatches(in: string)) == ["str", "str"]
                }
            }
            context("with overlapping matching strings") {
                let regex = "(str)[a-z]+"
                let string = "stringstring"
                it("returns an array with a string") {
                    expect(regex.allMatches(in: string)) == ["stringstring"]
                }
            }
            context("with invalid regex") {
                let regex = "(S*D&F^"
                let string = "string"
                it("returns an empty array") {
                    expect(regex.allMatches(in: string).isEmpty) == true
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation

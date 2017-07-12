class StringHelperSpecs: QuickSpec {
    
    override func spec() {
        var string: String!
        describe("calls remove(suffix)") {
            beforeEach {
                string = "TestSuffix"
            }
            context("with existing suffix") {
                it("removes suffix") {
                    string.remove(suffix: "Suffix")
                    expect(string) == "Test"
                }
                it("returns true") {
                    expect(string.remove(suffix: "Suffix")) == true
                }
            }
            context("without existing suffix") {
                it("does nothing to the string") {
                    string.remove(suffix: "Suffix1")
                    expect(string) == "TestSuffix"
                }
                it("returns false") {
                    expect(string.remove(suffix: "Suffix1")) == false
                }
            }
        }
        describe("calls removePrefix(_)") {
            beforeEach {
                string = "PrefixTest"
            }
            context("with existing prefix") {
                it("removes prefix") {
                    string.remove(prefix: "Prefix")
                    expect(string) == "Test"
                }
                it("returns true") {
                    expect(string.remove(prefix: "Prefix")) == true
                }
            }
            context("without existing prefix") {
                it("does nothing to the string") {
                    string.remove(prefix: "Prefix1")
                    expect(string) == "PrefixTest"
                }
                it("returns false") {
                    expect(string.remove(prefix: "Prefix1")) == false
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

class StringHelperSpecs: QuickSpec {
    
    override func spec() {
        var string: String!
        describe("calls removeSuffix(_)") {
            beforeEach {
                string = "TestSuffix"
            }
            context("with existing suffix") {
                it("returns suffix removed string") {
                    string.remove(suffix: "Suffix")
                    expect(string) == "Test"
                }
            }
            context("without existing suffix") {
                it("returns doesn't exit result") {
                    string.remove(suffix: "Suffix1")
                    expect(string) == "TestSuffix"
                }
            }
        }
        describe("calls removePrefix(_)") {
            beforeEach {
                string = "PrefixTest"
            }
            context("with existing prefix") {
                it("returns prefix removed string") {
                    string.remove(prefix: "Prefix")
                    expect(string) == "Test"
                }
            }
            context("without existing prefix") {
                it("returns doesn't exit result") {
                    string.remove(prefix: "Prefix1")
                    expect(string) == "PrefixTest"
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

class StringHelperSpecs: QuickSpec {
    
    override func spec() {
        var string: String!
        describe("calls removeSuffix(_)") {
            beforeEach {
                string = "TestSuffix"
            }
            context("with existing suffix") {
                it("returns suffix removed string") {
                    string.removeSuffix("Suffix")
                    expect(string) == "Test"
                }
            }
            context("without existing suffix") {
                it("returns doesn't exit result") {
                    string.removeSuffix("Suffix1")
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
                    string.removePrefix("Prefix")
                    expect(string) == "Test"
                }
            }
            context("without existing prefix") {
                it("returns doesn't exit result") {
                    string.removePrefix("Prefix1")
                    expect(string) == "PrefixTest"
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

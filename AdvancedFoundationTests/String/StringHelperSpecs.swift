class StringHelperSpecs: QuickSpec {
    
    override func spec() {
        describe("calls removeSuffix(_)") {
            context("with existing suffix") {
                it("returns suffix removed string") {
                    expect("TestSuffix".removeSuffix("Suffix")) == "Test"
                }
            }
            context("without existing suffix") {
                it("returns doesn't exit result") {
                    expect("TestSuffix".removeSuffix("Suffix1")).to(beNil())
                }
            }
        }
        describe("calls removePrefix(_)") {
            context("with existing prefix") {
                it("returns prefix removed string") {
                    expect("PrefixTest".removePrefix("Prefix")) == "Test"
                }
            }
            context("without existing prefix") {
                it("returns doesn't exit result") {
                    expect("PrefixTest".removePrefix("Prefix1")).to(beNil())
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

class StringHelperSpecs: QuickSpec {
    
    override func spec() {
        describe("call removeSuffix(_)") {
            context("with existing suffix") {
                it("return suffix removed string") {
                    expect("TestSuffix".removeSuffix("Suffix")) == "Test"
                }
            }
            context("without existing suffix") {
                it("return nil") {
                    expect("TestSuffix".removeSuffix("Suffix1")).to(beNil())
                }
            }
        }
        describe("call removePrefix(_)") {
            context("with existing prefix") {
                it("return prefix removed string") {
                    expect("PrefixTest".removePrefix("Prefix")) == "Test"
                }
            }
            context("without existing prefix") {
                it("return nil") {
                    expect("PrefixTest".removePrefix("Prefix1")).to(beNil())
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

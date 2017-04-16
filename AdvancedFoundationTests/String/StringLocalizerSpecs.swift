class StringLocalizerSpecs: QuickSpec {
    
    override func spec() {
        describe("String") {
            describe("is localized for class") {
                it("as localizable string") {
                    expect("Test".localize(forClass: StringLocalizerSpecs.self)) == "Test string"
                }
                it("as non localizable string") {
                    expect("Test1".localize(forClass: StringLocalizerSpecs.self)) == "Test1"
                }
            }
            describe("is localized") {
                describe("as localizable string") {
                    it("with localization file") {
                        expect("Test".localize(withLocalizationFile: "Localizable")) == "Test string"
                    }
                    it("with default localization file") {
                        expect("Test".localize()) == "Test string"
                    }
                }
                describe("as non localizable string") {
                    it("with localization file") {
                        expect("Test1".localize(withLocalizationFile: "Localizable")) == "Test1"
                    }
                    it("with default localization file") {
                        expect("Test1".localize()) == "Test1"
                    }
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation









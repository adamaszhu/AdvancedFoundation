class StringEditableSpecs: QuickSpec {
    
    override func spec() {
        var string: String!
        describe("calls remove(suffix)") {
            beforeEach {
                string = "TestSuffix"
            }
            context("with existing suffix") {
                it("removes suffix") {
                    string.removeSuffix("Suffix")
                    expect(string) == "Test"
                }
                it("returns true") {
                    expect(string.removeSuffix("Suffix")) == true
                }
            }
            context("without existing suffix") {
                it("does nothing to the string") {
                    string.removeSuffix("Suffix1")
                    expect(string) == "TestSuffix"
                }
                it("returns false") {
                    expect(string.removeSuffix("Suffix1")) == false
                }
            }
        }
        describe("calls removing(suffix)") {
            beforeEach {
                string = "TestSuffix"
            }
            context("with existing suffix") {
                it("removes suffix") {
                    let newString = string.removingSuffix("Suffix")
                    expect(newString) == "Test"
                }
                it("keeps the old string") {
                    let _ = string.removingSuffix("Suffix")
                    expect(string) == "TestSuffix"
                }
            }
            context("without existing suffix") {
                it("does nothing to the string") {
                    let newString = string.removingSuffix("Suffix1")
                    expect(newString) == "TestSuffix"
                }
                it("keeps the old string") {
                    let _ = string.removingSuffix("Suffix1")
                    expect(string) == "TestSuffix"
                }
            }
        }
        describe("calls remove(prefix)") {
            beforeEach {
                string = "PrefixTest"
            }
            context("with existing prefix") {
                it("removes prefix") {
                    string.removePrefix("Prefix")
                    expect(string) == "Test"
                }
                it("returns true") {
                    expect(string.removePrefix("Prefix")) == true
                }
            }
            context("without existing prefix") {
                it("does nothing to the string") {
                    string.removePrefix("Prefix1")
                    expect(string) == "PrefixTest"
                }
                it("returns false") {
                    expect(string.removePrefix("Prefix1")) == false
                }
            }
        }
        describe("calls removing(prefix)") {
            beforeEach {
                string = "PrefixTest"
            }
            context("with existing prefix") {
                it("removes prefix") {
                    let newString = string.removingPrefix("Prefix")
                    expect(newString) == "Test"
                }
                it("keeps the old string") {
                    let _ = string.removingPrefix("Prefix")
                    expect(string) == "PrefixTest"
                }
            }
            context("without existing prefix") {
                it("does nothing to the string") {
                    let newString = string.removingPrefix("Prefix1")
                    expect(newString) == "PrefixTest"
                }
                it("keeps the old string") {
                    let _ = string.removingPrefix("Prefix1")
                    expect(string) == "PrefixTest"
                }
            }
        }
        describe("calls combineSpaces()") {
            context("with sequencial spaces in the string") {
                it("combines sequencial spaces") {
                    string = "This   is a    test."
                    let newString = string.combineSpaces()
                    expect(newString) == "This is a test."
                }
            }
            context("with single spaces in the string") {
                it("returns the string") {
                    string = "This is a test."
                    let newString = string.combineSpaces()
                    expect(newString) == "This is a test."
                }
            }
            context("with no space in the string") {
                it("returns the string") {
                    string = "test"
                    let newString = string.combineSpaces()
                    expect(newString) == "test"
                }
            }
        }
        describe("has phraseUppercased") {
            context("with lowercased string") {
                it("returns phrase uppercased string") {
                    let string = "test phrase"
                    expect(string.phraseUppercased) == "Test phrase"
                }
            }
            context("with uppercased string") {
                it("returns phrase uppercased string") {
                    let string = "TEST PHRASE"
                    expect(string.phraseUppercased) == "Test phrase"
                }
            }
            context("with parse uppercased string") {
                it("returns phrase uppercased string") {
                    let string = "Test phrase"
                    expect(string.phraseUppercased) == "Test phrase"
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation

final class PhraseUppercasedSpecs: QuickSpec {

    override func spec() {
        describe("has the projected value") {
            context("with a lowercased value") {
                var phraseUppercasedMocker = PhraseUppercasedMocker()
                phraseUppercasedMocker.phrase = "test phrase"
                it("returns a phrase uppercased string") {
                    expect(phraseUppercasedMocker.$phrase) == "Test phrase"
                }
            }
            context("with a uppercased value") {
                var phraseUppercasedMocker = PhraseUppercasedMocker()
                phraseUppercasedMocker.phrase = "TEST PHRASE"
                it("returns a phrase uppercased string") {
                    expect(phraseUppercasedMocker.$phrase) == "Test phrase"
                }
            }
        }
    }
}

fileprivate struct PhraseUppercasedMocker {
    @PhraseUppercased
    var phrase: String = ""
}

import Nimble
import Quick
@testable import AdvancedFoundation

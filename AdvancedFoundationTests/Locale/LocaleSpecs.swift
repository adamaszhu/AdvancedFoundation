class LocaleSpecs: QuickSpec {

    override func spec() {
        describe("calls init(language:region)") {
            it("creates correct locales") {
                expect(Locale(language: .mandarin, region: .china).identifier) == "zh_CN"
                expect(Locale(language: .english, region: .australia).identifier) == "en_AU"
                expect(Locale(language: .english, region: .america).identifier) == "en_US"
            }
        }
        describe("calls init(language)") {
            it("creates correct locales") {
                expect(Locale(language: .mandarin).identifier) == "zh_CN"
                expect(Locale(language: .english).identifier) == "en_US"
            }
        }
    }
}

import Quick
import Nimble
import Foundation
@testable import AdvancedFoundation

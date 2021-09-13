class BundleLocalizableSpecs: QuickSpec {
    
    override func spec() {
        describe("calls supportLanguageSwitching()") {
            context("with default language") {
                context("with existing string") {
                    it("returns localized string") {
                        Bundle.switchLanguage()
                        Bundle.currentLanguage = AppInfoAccessor.standard.preferredLanguage
                        let string = Bundle.main.localizedString(forKey: "Test", value: nil, table: nil)
                        expect(string) == "Test English"
                        Bundle.switchLanguage()
                    }
                }
                context("with non-existing string") {
                    it("returns original string") {
                        Bundle.switchLanguage()
                        Bundle.currentLanguage = AppInfoAccessor.standard.preferredLanguage
                        let string = Bundle.main.localizedString(forKey: "Test1", value: nil, table: nil)
                        expect(string) == "Test1"
                        Bundle.switchLanguage()
                    }
                }
            }
            context("with unknown language") {
                context("with existing string") {
                    it("returns localized string") {
                        Bundle.switchLanguage()
                        Bundle.currentLanguage = "en1"
                        let string = Bundle.main.localizedString(forKey: "Test", value: nil, table: nil)
                        expect(string) == "Test Base"
                        Bundle.switchLanguage()
                    }
                }
                context("with non-existing string") {
                    it("returns original string") {
                        Bundle.switchLanguage()
                        Bundle.currentLanguage = "en1"
                        let string = Bundle.main.localizedString(forKey: "Test1", value: nil, table: nil)
                        expect(string) == "Test1"
                        Bundle.switchLanguage()
                    }
                }
            }
            context("with known language") {
                context("with existing string") {
                    it("returns localized string") {
                        Bundle.switchLanguage()
                        Bundle.currentLanguage = "en"
                        let string = Bundle.main.localizedString(forKey: "Test", value: nil, table: nil)
                        expect(string) == "Test English"
                        Bundle.switchLanguage()
                    }
                }
                context("with non-existing string") {
                    it("returns original string") {
                        Bundle.switchLanguage()
                        Bundle.currentLanguage = "en"
                        let string = Bundle.main.localizedString(forKey: "Test1", value: nil, table: nil)
                        expect(string) == "Test1"
                        Bundle.switchLanguage()
                    }
                }
            }
        }
    }
}

import Foundation
import Quick
import Nimble
@testable import AdvancedFoundation

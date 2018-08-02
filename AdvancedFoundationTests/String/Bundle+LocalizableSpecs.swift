//class BundleLocalizableSpecs: QuickSpec {
//    
//    override func spec() {
//        describe("calls supportLanguageSwitching()") {
//            context("with default language") {
//                context("with existing string") {
//                    it("returns localized string") {
//                        Bundle.supportLanguageSwitching()
//                        Bundle.currentLanguage = AppInfoAccessor.shared.preferredLanguage
//                        let string = Bundle.main.localizedString(forKey: "Test", value: nil, table: nil)
//                        expect(string) == "Test English"
//                        Bundle.supportLanguageSwitching()
//                    }
//                }
//                context("with non-existing string") {
//                    it("returns original string") {
//                        Bundle.supportLanguageSwitching()
//                        Bundle.currentLanguage = AppInfoAccessor.shared.preferredLanguage
//                        let string = Bundle.main.localizedString(forKey: "Test1", value: nil, table: nil)
//                        expect(string) == "Test1"
//                        Bundle.supportLanguageSwitching()
//                    }
//                }
//            }
//            context("with unknown language") {
//                context("with existing string") {
//                    it("returns localized string") {
//                        Bundle.supportLanguageSwitching()
//                        Bundle.currentLanguage = "en1"
//                        let string = Bundle.main.localizedString(forKey: "Test", value: nil, table: nil)
//                        expect(string) == "Test Base"
//                        Bundle.supportLanguageSwitching()
//                    }
//                }
//                context("with non-existing string") {
//                    it("returns original string") {
//                        Bundle.supportLanguageSwitching()
//                        Bundle.currentLanguage = "en1"
//                        let string = Bundle.main.localizedString(forKey: "Test1", value: nil, table: nil)
//                        expect(string) == "Test1"
//                        Bundle.supportLanguageSwitching()
//                    }
//                }
//            }
//            context("with known language") {
//                context("with existing string") {
//                    it("returns localized string") {
//                        Bundle.supportLanguageSwitching()
//                        Bundle.currentLanguage = "en"
//                        let string = Bundle.main.localizedString(forKey: "Test", value: nil, table: nil)
//                        expect(string) == "Test English"
//                        Bundle.supportLanguageSwitching()
//                    }
//                }
//                context("with non-existing string") {
//                    it("returns original string") {
//                        Bundle.supportLanguageSwitching()
//                        Bundle.currentLanguage = "en"
//                        let string = Bundle.main.localizedString(forKey: "Test1", value: nil, table: nil)
//                        expect(string) == "Test1"
//                        Bundle.supportLanguageSwitching()
//                    }
//                }
//            }
//        }
//    }
//    
//}
//
//import Quick
//import Nimble
//@testable import AdvancedFoundation

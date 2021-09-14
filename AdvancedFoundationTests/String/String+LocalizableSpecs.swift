class StringLocalizableSpecs: QuickSpec {
    
    override func spec() {
        describe("calls localizedString(withLocalizationFile)") {
            context("as localizable string") {
                context("with default localization file") {
                    it("returns localized string") {
                        expect("Test".localizedString()) == "Test English"
                    }
                }
                context("with correct localization file") {
                    it("returns localized string") {
                        expect("Test".localizedString(withLocalizationFile: "Localizable")) == "Test English"
                    }
                }
                context("with incorrect localization file") {
                    it("returns original string") {
                        expect("Test".localizedString(withLocalizationFile: "Localizable1")) == "Test"
                    }
                }
            }
            context("as non localizable string") {
                context("with default localization file") {
                    it("returns original string") {
                        expect("Test1".localizedString()) == "Test1"
                    }
                }
                context("with correct localization file") {
                    it("returns original string") {
                        expect("Test1".localizedString(withLocalizationFile: "Localizable")) == "Test1"
                    }
                }
                context("with incorrect localization file") {
                    it("returns original string") {
                        expect("Test1".localizedString(withLocalizationFile: "Localizable1")) == "Test1"
                    }
                }
            }
        }
        describe("calls localizedString(forClass)") {
            context("as localizable string") {
                context("with correct class") {
                    it("returns localized string") {
                        expect("Test".localizedString(for: StringLocalizableSpecs.self)) == "Test string"
                    }
                }
                context("with incorrect class") {
                    it("returns original string") {
                        expect("Test".localizedString(for: Logger.self)) == "Test"
                    }
                }
            }
            context("as non localizable string") {
                context("with correct class") {
                    it("returns original string") {
                        expect("Test1".localizedString(for: StringLocalizableSpecs.self)) == "Test1"
                    }
                }
                context("with incorrect class") {
                    it("returns original string") {
                        expect("Test1".localizedString(for: Logger.self)) == "Test1"
                    }
                }
            }
        }
        describe("calls localizedInternalString(forType)") {
            context("as localizable string") {
                context("with correct class") {
                    it("returns localized string") {
                        expect("Space".localizedInternalString(forType: Date.self)) == " "
                    }
                }
                context("with incorrect type") {
                    it("returns original string") {
                        expect("Space".localizedInternalString(forType: Logger.self)) == "Space"
                    }
                }
            }
            context("as non localizable string") {
                context("with correct type") {
                    it("returns original string") {
                        expect("Test".localizedInternalString(forType: Date.self)) == "Test"
                    }
                }
                context("with incorrect type") {
                    it("returns original string") {
                        expect("Test".localizedInternalString(forType: Logger.self)) == "Test"
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

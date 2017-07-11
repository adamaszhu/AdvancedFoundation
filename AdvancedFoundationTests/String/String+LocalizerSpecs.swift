class StringLocalizerSpecs: QuickSpec {
    
    override func spec() {
        describe("calls localize(withLocalizationFile)") {
            context("as localizable string") {
                context("with default localization file") {
                    it("returns localized string") {
                        expect("Test".localize()) == "Test string"
                    }
                }
                context("with correct localization file") {
                    it("returns localized string") {
                        expect("Test".localize(withLocalizationFile: "Localizable")) == "Test string"
                    }
                }
                context("with incorrect localization file") {
                    it("returns original string") {
                        expect("Test".localize(withLocalizationFile: "Localizable1")) == "Test"
                    }
                }
            }
            context("as non localizable string") {
                context("with default localization file") {
                    it("returns original string") {
                        expect("Test1".localize()) == "Test1"
                    }
                }
                context("with correct localization file") {
                    it("returns original string") {
                        expect("Test1".localize(withLocalizationFile: "Localizable")) == "Test1"
                    }
                }
                context("with incorrect localization file") {
                    it("returns original string") {
                        expect("Test1".localize(withLocalizationFile: "Localizable1")) == "Test1"
                    }
                }
            }
        }
        describe("calls localize(forClass)") {
            context("as localizable string") {
                context("with correct class") {
                    it("returns localized string") {
                        expect("Test".localize(for: StringLocalizerSpecs.self)) == "Test string"
                    }
                }
                context("with incorrect class") {
                    it("returns original string") {
                        expect("Test".localize(for: Logger.self)) == "Test"
                    }
                }
            }
            context("as non localizable string") {
                context("with correct class") {
                    it("returns original string") {
                        expect("Test1".localize(for: StringLocalizerSpecs.self)) == "Test1"
                    }
                }
                context("with incorrect class") {
                    it("returns original string") {
                        expect("Test1".localize(for: Logger.self)) == "Test1"
                    }
                }
            }
        }
        describe("calls localizeWithinFramework(forType)") {
            context("as localizable string") {
                context("with correct class") {
                    it("returns localized string") {
                        expect("Space".localizeWithinFramework(forType: Date.self)) == " "
                    }
                }
                context("with incorrect type") {
                    it("returns original string") {
                        expect("Space".localizeWithinFramework(forType: Logger.self)) == "Space"
                    }
                }
            }
            context("as non localizable string") {
                context("with correct type") {
                    it("returns original string") {
                        expect("Test".localizeWithinFramework(forType: Date.self)) == "Test"
                    }
                }
                context("with incorrect type") {
                    it("returns original string") {
                        expect("Test".localizeWithinFramework(forType: Logger.self)) == "Test"
                    }
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

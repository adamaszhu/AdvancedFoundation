class StringLocalizerSpecs: QuickSpec {
    
    override func spec() {
            describe("call localize(withLocalizationFile)") {
                context("as localizable string") {
                    context("with default localization file") {
                        it("return localized string") {
                            expect("Test".localize()) == "Test string"
                        }
                    }
                    context("with correct localization file") {
                        it("return localized string") {
                            expect("Test".localize(withLocalizationFile: "Localizable")) == "Test string"
                        }
                    }
                    context("with incorrect localization file") {
                        it("return original string") {
                            expect("Test".localize(withLocalizationFile: "Localizable1")) == "Test"
                        }
                    }
                }
                context("as non localizable string") {
                    context("with default localization file") {
                        it("return original string") {
                            expect("Test1".localize()) == "Test1"
                        }
                    }
                    context("with correct localization file") {
                        it("return original string") {
                            expect("Test1".localize(withLocalizationFile: "Localizable")) == "Test1"
                        }
                    }
                    context("with incorrect localization file") {
                        it("return original string") {
                            expect("Test1".localize(withLocalizationFile: "Localizable1")) == "Test1"
                        }
                    }
                }
            }
            describe("call localize(forClass)") {
                context("as localizable string") {
                    context("with correct class") {
                        it("return localized string") {
                            expect("Test".localize(forClass: StringLocalizerSpecs.self)) == "Test string"
                        }
                    }
                    context("with incorrect class") {
                        it("return original string") {
                            expect("Test".localize(forClass: Logger.self)) == "Test"
                        }
                    }
                }
                context("as non localizable string") {
                    context("with correct class") {
                        it("return original string") {
                            expect("Test1".localize(forClass: StringLocalizerSpecs.self)) == "Test1"
                        }
                    }
                    context("with incorrect class") {
                        it("return original string") {
                            expect("Test1".localize(forClass: Logger.self)) == "Test1"
                        }
                    }
                }
            }
        }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

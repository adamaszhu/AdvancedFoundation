class CurrencyFormatterSpecs: QuickSpec {
    
    override func spec() {
        describe("calls convertToMoneyString(withCent)") {
            context("as double") {
                let number = NSNumber(value: 999999.55)
                context("with cent") {
                    it("returns money string with cent") {
                        expect(number.convertToMoneyString(withCent: true)) == "$999,999.55"
                    }
                }
                context("without cent") {
                    it("returns money string without cent") {
                        expect(number.convertToMoneyString(withCent: false)) == "$999,999"
                    }
                }
                context("with default cent") {
                    it("returns money string without cent") {
                        expect(number.convertToMoneyString()) == "$999,999"
                    }
                }
                context("with currency symbol") {
                    it("returns money string with correct symbol") {
                        expect(number.convertToMoneyString(withCurrencySymbol: "&")) == "&999,999"
                    }
                }
                context("without currency symbol") {
                    it("returns money string without symbol") {
                        expect(number.convertToMoneyString(withCurrencySymbol: "")) == "999,999"
                    }
                }
                context("with default currency symbol") {
                    it("returns money string without cent") {
                        expect(number.convertToMoneyString()) == "$999,999"
                    }
                }
            }
            context("as int") {
                let number = NSNumber(value: 999999)
                context("with cent") {
                    it("returns money string with cent") {
                        expect(number.convertToMoneyString(withCent: true)) == "$999,999.00"
                    }
                }
                context("without cent") {
                    it("returns money string without cent") {
                        expect(number.convertToMoneyString(withCent: false)) == "$999,999"
                    }
                }
                context("with default cent") {
                    it("returns money string without cent") {
                        expect(number.convertToMoneyString()) == "$999,999"
                    }
                }
                context("with currency symbol") {
                    it("returns money string with correct symbol") {
                        expect(number.convertToMoneyString(withCurrencySymbol: "&")) == "&999,999"
                    }
                }
                context("without currency symbol") {
                    it("returns money string without symbol") {
                        expect(number.convertToMoneyString(withCurrencySymbol: "")) == "999,999"
                    }
                }
                context("with default currency symbol") {
                    it("returns money string with cent") {
                        expect(number.convertToMoneyString()) == "$999,999"
                    }
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

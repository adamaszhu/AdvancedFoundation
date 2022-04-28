final class DoubleCurrencyFormattableSpecs: QuickSpec {
    
    override func spec() {
        describe("calls moneyString(withCent:withCurrencySymbol)") {
            context("as double") {
                let number = 999999.55
                context("with cent") {
                    it("returns money string with cent") {
                        expect(number.currencyString(withCent: true)) == "$999,999.55"
                    }
                }
                context("without cent") {
                    it("returns money string without cent") {
                        expect(number.currencyString(withCent: false)) == "$999,999"
                    }
                }
                context("with default cent") {
                    it("returns money string with cent") {
                        expect(number.currencyString()) == "$999,999.55"
                    }
                }
            }
            context("as int") {
                let number = 999999.0
                context("with cent") {
                    it("returns money string with cent") {
                        expect(number.currencyString(withCent: true)) == "$999,999.00"
                    }
                }
                context("without cent") {
                    it("returns money string without cent") {
                        expect(number.currencyString(withCent: false)) == "$999,999"
                    }
                }
                context("with default cent") {
                    it("returns money string without cent") {
                        expect(number.currencyString()) == "$999,999"
                    }
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation

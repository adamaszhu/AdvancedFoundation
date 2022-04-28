final class DoubleCurrencyFormattableSpecs: QuickSpec {
    
    override func spec() {
        describe("calls centString()") {
            context("as int") {
                let number = 999999.0
                it("returns the cent string") {
                    expect(number.centString()) == "00"
                }
            }
            context("as double") {
                let number = 999999.55
                it("returns the cent string") {
                    expect(number.centString()) == "55"
                }
            }
        }
        describe("calls dollarString()") {
            context("as int") {
                let number = 999999.0
                it("returns the dollar string") {
                    expect(number.dollarString()) == "999,999"
                }
            }
            context("as double") {
                let number = 999999.55
                it("returns the dollar string") {
                    expect(number.dollarString()) == "999,999"
                }
            }
        }
        describe("calls moneyString(withCent)") {
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

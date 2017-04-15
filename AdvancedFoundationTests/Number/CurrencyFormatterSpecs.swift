class CurrencyFormatterSpecs: QuickSpec {
    
    override func spec() {
        describe("Number") {
            describe("is formatted into currency string") {
                describe("as double") {
                    let number = NSNumber(value: 999999.55)
                    
                    it("with cent") {
                        expect(number.convertToMoneyString(withCent: true)) == "$999,999.55"
                    }
                    it("without cent") {
                        expect(number.convertToMoneyString(withCent: false)) == "$999,999"
                    }
                    it("with default cent") {
                        expect(number.convertToMoneyString()) == "$999,999"
                    }
                    it("with currency symbol") {
                        expect(number.convertToMoneyString(withCurrencySymbol: "&")) == "&999,999"
                    }
                    it("without currency symbol") {
                        expect(number.convertToMoneyString(withCurrencySymbol: "")) == "999,999"
                    }
                    it("with default currency symbol") {
                        expect(number.convertToMoneyString()) == "$999,999"
                    }
                }
                describe("as int") {
                    let number = NSNumber(value: 999999)
                    
                    it("with cent") {
                        expect(number.convertToMoneyString(withCent: true)) == "$999,999.00"
                    }
                    it("without cent") {
                        expect(number.convertToMoneyString(withCent: false)) == "$999,999"
                    }
                    it("with default cent") {
                        expect(number.convertToMoneyString()) == "$999,999"
                    }
                    it("with currency symbol") {
                        expect(number.convertToMoneyString(withCurrencySymbol: "&")) == "&999,999"
                    }
                    it("without currency symbol") {
                        expect(number.convertToMoneyString(withCurrencySymbol: "")) == "999,999"
                    }
                    it("with default currency symbol") {
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

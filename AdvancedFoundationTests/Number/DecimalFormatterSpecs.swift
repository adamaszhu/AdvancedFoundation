class DecimalFormatterSpecs: QuickSpec {
    
    override func spec() {
        describe("Number") {
            describe("converts to decimal string") {
                describe("as double") {
                    let number = NSNumber(value: 100.55)
                    
                    it("with more decimal") {
                        expect(number.convertToDecimalString(withPrecision: 3)) == "100.55"
                    }
                    it("with less decimal") {
                        expect(number.convertToDecimalString(withPrecision: 1)) == "100.5"
                    }
                    it("without decimal") {
                        expect(number.convertToDecimalString(withPrecision: 0)) == "100"
                    }
                    it("with original decimal") {
                        expect(number.convertToDecimalString(withPrecision: nil)) == "100.55"
                    }
                }
                describe("as int") {
                    let number = NSNumber(value: 100)
                    
                    it("with decimal") {
                        expect(number.convertToDecimalString(withPrecision: 1)) == "100"
                    }
                    it("without decimal") {
                        expect(number.convertToDecimalString(withPrecision: 0)) == "100"
                        
                    }
                    it("with original decimal") {
                        expect(number.convertToDecimalString(withPrecision: nil)) == "100"
                    }
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

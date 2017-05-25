class DecimalFormatterSpecs: QuickSpec {
    
    override func spec() {
        describe("calls convertToDecimalString(withPrecision)") {
            context("as double") {
                let number = NSNumber(value: 100.55)
                context("with more decimal") {
                    it("returns decimal string with correct precision") {
                        expect(number.convertToDecimalString(withPrecision: 3)) == "100.55"
                    }
                }
                context("with less decimal") {
                    it("returns decimal string with correct precision") {
                        expect(number.convertToDecimalString(withPrecision: 1)) == "100.5"
                    }
                }
                context("without decimal") {
                    it("returns decimal string with no decimal") {
                        expect(number.convertToDecimalString(withPrecision: 0)) == "100"
                    }
                }
                context("with original decimal") {
                    it("returns decimal string with correct precision") {
                        expect(number.convertToDecimalString(withPrecision: nil)) == "100.55"
                    }
                }
                context("with default decimal") {
                    it("returns decimal string with correct precision") {
                        expect(number.convertToDecimalString()) == "100.55"
                    }
                }
            }
            context("as int") {
                let number = NSNumber(value: 100)
                context("with decimal") {
                    it("returns decimal string with no decimal") {
                        expect(number.convertToDecimalString(withPrecision: 1)) == "100"
                    }
                }
                context("without decimal") {
                    it("returns decimal string with no decimal") {
                        expect(number.convertToDecimalString(withPrecision: 0)) == "100"
                    }
                    
                }
                context("with original decimal") {
                    it("returns decimal string with no decimal") {
                        expect(number.convertToDecimalString(withPrecision: nil)) == "100"
                    }
                }
                context("with default decimal") {
                    it("returns decimal string with no decimal") {
                        expect(number.convertToDecimalString()) == "100"
                    }
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

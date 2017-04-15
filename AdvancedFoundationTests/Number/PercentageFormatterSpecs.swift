class PercentageFormatterSpecs: QuickSpec {
    
    override func spec() {
        describe("Number") {
            describe("converts to percentage string") {
                let number = NSNumber(value: 0.5555)
                
                it("with more decimal") {
                    expect(number.convertToPercentageString(withPrecision: 3)) == "55.55%"
                }
                it("with less decimal") {
                    expect(number.convertToPercentageString(withPrecision: 1)) == "55.5%"
                }
                it("without decimal") {
                    expect(number.convertToPercentageString(withPrecision: 0)) == "55%"
                }
                it("with original decimal") {
                    expect(number.convertToPercentageString(withPrecision: nil)) == "55.55%"
                }
            }
            describe("renders percentage string") {
                it("with valid content in string") {
                    expect(NSNumber.renderPercentageString("55.55%")) == 0.5555
                }
                it("without percentage string") {
                    expect(NSNumber.renderPercentageString("55")).to(beNil())
                }
                it("with invalid character in string") {
                    expect(NSNumber.renderPercentageString("55C%")).to(beNil())
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation









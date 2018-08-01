class PercentageFormatterSpecs: QuickSpec {
    
    override func spec() {
        describe("calls percentageString(withPrecision)") {
            let number = NSNumber(value: 0.5555)
            context("with more decimal") {
                it("returns percentage string with correct precision") {
                    expect(number.percentageString(withPrecision: 3)) == "55.55%"
                }
            }
            context("with less decimal") {
                it("returns percentage string with correct precision") {
                    expect(number.percentageString(withPrecision: 1)) == "55.5%"
                }
            }
            context("without decimal") {
                it("returns percentage string with no decimal") {
                    expect(number.percentageString(withPrecision: 0)) == "55%"
                }
            }
            context("with original decimal") {
                it("returns percentage string with correct precision") {
                    expect(number.percentageString(withPrecision: nil)) == "55.55%"
                }
            }
            context("with default decimal") {
                it("returns percentage string with correct precision") {
                    expect(number.percentageString()) == "55.55%"
                }
            }
        }
        describe("calls number(fromPercentage)") {
            context("with valid content in string") {
                it("returns correct number") {
                    expect(NSNumber(percentage: "55.55%")) == 0.5555
                }
            }
            context("without percentage string") {
                it("returns invalid number") {
                    expect(NSNumber(percentage: "55")).to(beNil())
                }
            }
            context("with invalid character in string") {
                it("returns invalid number") {
                    expect(NSNumber(percentage: "55C%")).to(beNil())
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation









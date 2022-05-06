final class DoubleLongNumberFormattableSpecs: QuickSpec {
    
    override func spec() {
        describe("calls longNumberString()") {
            context("with a long integer") {
                let number = 99999.0
                it("returns a formatted string") {
                    expect(number.longNumberString()) == "99,999"
                }
            }
            context("with a long double") {
                let number = 99999.55
                it("returns a formatted string") {
                    expect(number.longNumberString()) == "99,999.55"
                }
            }
            context("with a complex double") {
                let number = 99999.555555
                it("returns a formatted string") {
                    expect(number.longNumberString()) == "99,999.55"
                }
            }
        }
        describe("calls init(longNumber)") {
            context("with invalid character in string") {
                it("returns invalid number") {
                    expect(Double(longNumber: "@1")).to(beNil())
                }
            }
            context("with invalid format in string") {
                it("returns invalid number") {
                    expect(Double(longNumber: "10000.00.1")).to(beNil())
                }
            }
            context("with decimal in string") {
                it("returns number with correct value") {
                    expect(Double(longNumber: "10,000.55")) == 10000.55
                }
            }
            context("with large value in string") {
                it("returns number with correct value") {
                    expect(Double(longNumber: "10,000")) == 10000
                }
            }
            context("with small value in string") {
                it("returns number with correct value") {
                    expect(Double(longNumber: "100")) == 100
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation

class LongNumberFormatterSpecs: QuickSpec {
    
    override func spec() {
        describe("calls renderLongNumberString(_)") {
            context("with invalid character in string") {
                it("returns invalid number") {
                    expect(NSNumber.renderLongNumberString("@1")).to(beNil())
                }
            }
            context("with invalid format in string") {
                it("returns invalid number") {
                    expect(NSNumber.renderLongNumberString("10000.00.1")).to(beNil())
                }
            }
            context("with decimal in string") {
                it("returns number with correct value") {
                    expect(NSNumber.renderLongNumberString("10,000.55")) == 10000.55
                }
            }
            context("with large value in string") {
                it("returns number with correct value") {
                    expect(NSNumber.renderLongNumberString("10,000")) == 10000
                }
            }
            context("with small value in string") {
                it("returns number with correct value") {
                    expect(NSNumber.renderLongNumberString("100")) == 100
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation
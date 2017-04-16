class LongNumberFormatterSpecs: QuickSpec {
    
    override func spec() {
        describe("Number") {
            describe("renders long number string") {
                it("with invalid character in string") {
                    expect(NSNumber.renderLongNumberString("@1")).to(beNil())
                }
                it("with invalid format in string") {
                    expect(NSNumber.renderLongNumberString("10000.00.1")).to(beNil())
                }
                it("with decimal in string") {
                    expect(NSNumber.renderLongNumberString("10,000.55")) == 10000.55
                }
                it("with large value in string") {
                    expect(NSNumber.renderLongNumberString("10,000")) == 10000
                }
                it("with small value in string") {
                    expect(NSNumber.renderLongNumberString("100")) == 100
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

class TXTSpecs: QuickSpec {
    
    override func spec() {
        describe("calls init(lines)") {
            context("with several lines") {
                let txt = TXT(lines: ["line1", "line2"])
                it("returns TXT with lines") {
                    expect(txt.lines) == ["line1", "line2"]
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation

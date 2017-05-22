class TextHelperSpecs: QuickSpec {
    
    override func spec() {
        describe("has lines") {
            context("if content has comment") {
                let content = "// COMMENT\nLine1\nLine2"
                let textHelper = TextHelper(content: content)
                it("is parsed to 2 lines") {
                    expect(textHelper.lines.count) == 2
                }
            }
            context("if content doesn't have comment") {
                let content = "\nLine2"
                let textHelper = TextHelper(content: content)
                it("is parsed to 2 lines") {
                    expect(textHelper.lines.count) == 2
                }
            }
        }
        describe("calls init(content)") {
            let content = "\nLine2"
            let textHelper = TextHelper(content: content)
            it("returns TextHelper object") {
                expect(textHelper).toNot(beNil())
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation


class TextHelperSpecs: QuickSpec {
    
    override func spec() {
        describe("calls init(withContent)") {
            context("if content has comment") {
                let content = "// COMMENT\nLine1\nLine2"
                let textHelper = TextHelper(withContent: content)
                it("is parsed to 2 lines") {
                    expect(textHelper.lines.count) == 2
                }
            }
            context("if content doesn't have comment") {
                let content = "\nLine2"
                let textHelper = TextHelper(withContent: content)
                it("is parsed to 2 lines") {
                    expect(textHelper.lines.count) == 2
                }
                
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation


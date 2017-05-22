class CSVHelperSpecs: QuickSpec {
    
    override func spec() {
        describe("has csvContent") {
            context("if content has comment") {
                let content = "// COMMENT\nLine1Column1,Line1Column2\nLine2Column1"
                let csvHelper = CSVHelper(content: content)
                it("is parsed to 2 csv rows") {
                    expect(csvHelper.csvContent.count) == 2
                }
                it("is parsed to 2 csv rows with one column in the second row") {
                    expect(csvHelper.csvContent[1].count) == 1
                }
            }
            context("if content doesn't have comment") {
                let content = "\nLine2Column1"
                let csvHelper = CSVHelper(content: content)
                it("is parsed to 2 lines") {
                    expect(csvHelper.csvContent.count) == 2
                }
            }
        }
        describe("calls init(content)") {
            let content = ""
            let csvHelper = CSVHelper(content: content)
            it("returns CSVHelper object") {
                expect(csvHelper).notTo(beNil())
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

class CSVSpecs: QuickSpec {
    
    override func spec() {
        describe("has table") {
            context("if content has comment") {
                let content = "// COMMENT\nLine1Column1,Line1Column2\nLine2Column1"
                let csv = CSV.csv(from: content)
                it("is parsed to 2 csv rows") {
                    expect(csv.table.count) == 2
                }
                it("is parsed to 2 csv rows with one column in the second row") {
                    expect(csv.table[1].count) == 1
                }
            }
            context("if content doesn't have comment") {
                let content = "\nLine2Column1"
                let csv = CSV.csv(from: content)
                it("is parsed to 2 lines") {
                    expect(csv.table.count) == 2
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

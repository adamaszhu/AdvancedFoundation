class CSVSpecs: QuickSpec {
    
    override func spec() {
        describe("calls init(table)") {
            context("with a table") {
                let csv = CSV(table: [["item1", "item2"],["item3", "item4"]])
                it("returns CSV with table") {
                    expect(csv.table[0]) == ["item1", "item2"]
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation


class JSONPathParserSpecs: QuickSpec {
    
    override func spec() {
        describe("calls parse(_)") {
            context("with correct format") {
                let jsonPath = JSONPath.parse(path: "node1/node2[3]/node3")
                it("returns JSONPath with 3 nodes") {
                    expect(jsonPath?.nodes.count) == 3
                }
            }
            context("with incorrect format") {
                let jsonPath = JSONPath.parse(path: "node1/node23]/node3")
                it("returns nil") {
                    expect(jsonPath).to(beNil())
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation


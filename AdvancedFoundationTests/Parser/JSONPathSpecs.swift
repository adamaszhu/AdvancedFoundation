class JSONPathSpecs: QuickSpec {
    
    override func spec() {
        var emptyPath = JSONPath.parseString("")!
        var nonEmptyPath = JSONPath.parseString("firstNode/secondNode")!
        describe("has isEmpty") {
            context("with empty path") {
                it("is true") {
                    expect(emptyPath.isEmpty) == true
                }
            }
            context("with non empty path") {
                it("is false") {
                    expect(nonEmptyPath.isEmpty) == false
                }
            }
        }
        describe("has firstNode") {
            context("with empty path") {
                it("is nil") {
                    expect(emptyPath.firstNode).to(beNil())
                }
            }
            context("with non empty path") {
                it("isn't nil") {
                    expect(nonEmptyPath.firstNode).notTo(beNil())
                }
            }
        }
        describe("calls removeFirstNode()") {
            afterEach {
                emptyPath = JSONPath.parseString("")!
                nonEmptyPath = JSONPath.parseString("firstNode/secondNode")!
            }
            context("with empty path") {
                it("has no node left") {
                    emptyPath.removeFirstNode()
                    expect(emptyPath.nodes.count) == 0
                }
            }
            context("with non empty path") {
                it("has one node left") {
                    nonEmptyPath.removeFirstNode()
                    expect(nonEmptyPath.nodes.count) == 1
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

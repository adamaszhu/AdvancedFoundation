class JSONNodeParsableSpecs: QuickSpec {
    
    override func spec() {
        describe("calls init(path)") {
            context("with name only string") {
                let jsonNode = JSONNode(path: "node")
                it("returns JSONNode with name") {
                    expect(jsonNode?.name) == "node"
                }
                it("returs JSONNode with empty index") {
                    expect(jsonNode?.index).to(beNil())
                }
            }
            context("with node string") {
                let jsonNode = JSONNode(path: "node[2]")
                it("returns JSONNode with name") {
                    expect(jsonNode?.name) == "node"
                }
                it("returs JSONNode with index") {
                    expect(jsonNode?.index) == 2
                }
            }
            context("with left bracket only string") {
                let jsonNode = JSONNode(path: "node[2")
                it("returns nil") {
                    expect(jsonNode).to(beNil())
                }
            }
            context("with right bracket only string") {
                let jsonNode = JSONNode(path: "node2]")
                it("returns nil") {
                    expect(jsonNode).to(beNil())
                }
            }
            context("with disorder brackets string") {
                let jsonNode = JSONNode(path: "node]2[")
                it("returns nil") {
                    expect(jsonNode).to(beNil())
                }
            }
            context("with other invalid string") {
                let jsonNode = JSONNode(path: "node[[2]")
                it("returns nil") {
                    expect(jsonNode).to(beNil())
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation


class JSONNodeSpecs: QuickSpec {
    
    override func spec() {
        describe("calls init(name:index)") {
            context("with default index") {
                let node = JSONNode(name: "node")
                it("returns node with name") {
                    expect(node.name) == "node"
                }
                it("returns node empty index") {
                    expect(node.index).to(beNil())
                }
            }
            context("with specific index") {
                let node = JSONNode(name: "node", index: 1)
                it("returns node with name") {
                    expect(node.name) == "node"
                }
                it("returns node with index") {
                    expect(node.index) == 1
                }
            }
        }
        describe("has isCurrentNode") {
            context("is current node without index") {
                let node = JSONNode(name: ".")
                it("is true") {
                    expect(node.isCurrentNode) == true
                }
            }
            context("is current node with index") {
                let node = JSONNode(name: ".", index: 1)
                it("is true") {
                    expect(node.isCurrentNode) == true
                }
            }
            context("isn't current node") {
                let node = JSONNode(name: "node")
                it("is false") {
                    expect(node.isCurrentNode) == false
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation


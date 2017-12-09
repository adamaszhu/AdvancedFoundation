class TextResourceHelperSpecs: QuickSpec {
    
    override func spec() {
        describe("has content") {
            context("if the text resource exists") {
                let textResourceHelper = TextResourceHelper(name: "Temp.txt")!
                it("returns the content") {
                    expect(textResourceHelper.content?.count) > 0
                }
            }
            context("if the resource is not a text resource") {
                let textResourceHelper = TextResourceHelper(name: "Avatar.jpg")
                it("returns nil") {
                    expect(textResourceHelper?.content).to(beNil())
                }
            }
            context("if the resource doesn't exist") {
                let textResourceHelper = TextResourceHelper(name: "Temp1.txt")
                it("returns nil") {
                    expect(textResourceHelper?.content).to(beNil())
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation


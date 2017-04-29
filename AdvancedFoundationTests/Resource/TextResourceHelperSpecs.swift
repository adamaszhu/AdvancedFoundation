class TextResourceHelperSpecs: QuickSpec {
    
    override func spec() {
        describe("has isExisted") {
            context("if the resource exists") {
                let textResourceHelper = TextResourceHelper(withName: "Temp.txt")
                it("is true") {
                    expect(textResourceHelper.isExisted) == true
                }
            }
            context("if the resource doesn't exist") {
                let textResourceHelper = TextResourceHelper(withName: "Temp1.txt")
                it("is false") {
                    expect(textResourceHelper.isExisted) == false
                }
            }
        }
        describe("calls getContext()") {
            context("if the text resource exists") {
                let textResourceHelper = TextResourceHelper(withName: "Temp.txt")
                it("returns the content") {
                    expect(textResourceHelper.getContent()?.characters.count) > 0
                }
            }
            context("if the resource is not a text resource") {
                let textResourceHelper = TextResourceHelper(withName: "Avatar.jpg")
                it("returns nil") {
                    expect(textResourceHelper.getContent()).to(beNil())
                }
            }
            context("if the resource doesn't exist") {
                let textResourceHelper = TextResourceHelper(withName: "Temp1.txt")
                it("returns nil") {
                    expect(textResourceHelper.getContent()).to(beNil())
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation


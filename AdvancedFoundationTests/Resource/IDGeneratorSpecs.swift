class IDGeneratorSpecs: QuickSpec {
    
    override func spec() {
        let idGenerator = IDGenerator.standard
        describe("has standard object") {
            it("is not nil") {
                expect(idGenerator).toNot(beNil())
            }
        }
        describe("calls generateID()") {
            context("for the first time") {
                it("returns id ending with 0") {
                    let timeSeed = Int(Date().timeIntervalSince1970)
                    expect(idGenerator.generateID()) == "\(timeSeed)0"
                }
            }
            context("for the second time") {
                it("returns id ending with 1") {
                    let timeSeed = Int(Date().timeIntervalSince1970)
                    expect(idGenerator.generateID()) == "\(timeSeed)1"
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation


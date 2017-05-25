class IDGeneratorSpecs: QuickSpec {
    
    override func spec() {
        describe("has standard object") {
            it("is not nil") {
                expect(IDGenerator.standard).toNot(beNil())
            }
        }
        describe("calls generateID()") {
            var idGenerator = IDGenerator()
            afterEach {
                idGenerator = IDGenerator()
            }
            context("for the first time") {
                it("returns id ending with 0") {
                    let timeSeed = Int(Date().timeIntervalSince1970)
                    expect(idGenerator.generateID()) == "\(timeSeed)0"
                }
            }
            context("for the second time") {
                it("returns id ending with 1") {
                    let timeSeed = Int(Date().timeIntervalSince1970)
                    _ = idGenerator.generateID()
                    expect(idGenerator.generateID()) == "\(timeSeed)1"
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation


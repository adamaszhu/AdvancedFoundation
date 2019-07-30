class IDGeneratorSpecs: QuickSpec {
    
    override func spec() {
        describe("has standard object") {
            it("is not nil") {
                expect(IDGenerator.standard).toNot(beNil())
            }
        }
        describe("has newID") {
            var idGenerator: IDGenerator!
            beforeEach {
                idGenerator = IDGenerator()
            }
            context("for the first time") {
                it("returns id ending with 0") {
                    let timeSeed = Int(Date().timeIntervalSince1970)
                    expect(idGenerator.uniqueID) == "\(timeSeed)0"
                }
            }
            context("for the second time") {
                it("returns id ending with 1") {
                    let timeSeed = Int(Date().timeIntervalSince1970)
                    _ = idGenerator.uniqueID
                    expect(idGenerator.uniqueID) == "\(timeSeed)1"
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation

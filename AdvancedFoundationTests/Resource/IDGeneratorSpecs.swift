class IDGeneratorSpecs: QuickSpec {
    
    override func spec() {
        describe("ID Generator") {
            describe("generates id") {
                let timeSeed = Int(Date().timeIntervalSince1970)
                
                it("for the first time") {
                    expect(IDGenerator.shared.generateID()) == "\(timeSeed)0"
                }
                it("for the second time") {
                    expect(IDGenerator.shared.generateID()) == "\(timeSeed)1"
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation


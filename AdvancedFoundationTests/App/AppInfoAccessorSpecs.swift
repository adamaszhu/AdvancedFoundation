class AppInfoAccessorSpecs: QuickSpec {
    
    override func spec() {
        describe("have shared") {
            it("is not nil") {
                expect(AppInfoAccessor.shared).toNot(beNil())
            }
        }
        describe("have bundle name") {
            it("is correct bundle name") {
                expect(AppInfoAccessor.shared.bundleName) == "AdvancedFoundationHost"
            }
        }
        describe("have version") {
            it("is correct version") {
                expect(AppInfoAccessor.shared.version) == "1.0.0"
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

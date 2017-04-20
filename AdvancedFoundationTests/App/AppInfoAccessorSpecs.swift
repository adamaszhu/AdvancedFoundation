class AppInfoAccessorSpecs: QuickSpec {
    
    override func spec() {
        let appInfoAccessor = AppInfoAccessor.shared
        describe("has shared") {
            it("is not nil") {
                expect(appInfoAccessor).toNot(beNil())
            }
        }
        describe("has bundle name") {
            it("is correct bundle name") {
                expect(appInfoAccessor.bundleName) == "AdvancedFoundationHost"
            }
        }
        describe("has version") {
            it("is correct version") {
                expect(appInfoAccessor.version) == "1.0.0"
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

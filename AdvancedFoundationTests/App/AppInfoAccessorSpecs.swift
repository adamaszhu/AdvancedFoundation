class AppInfoAccessorSpecs: QuickSpec {
    
    override func spec() {
        describe("App info") {
            it("has bundle name") {
                expect(AppInfoAccessor.bundleName) == "AdvancedFoundationHost"
            }
            it("has version") {
                expect(AppInfoAccessor.version) == "1.0.0"
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

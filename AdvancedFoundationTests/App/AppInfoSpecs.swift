class AppInfoSpecs: QuickSpec {
    
    override func spec() {
        describe("App info") {
            it("has bundle name") {
                expect(AppInfo.bundleName) == "AdvancedFoundationHost"
            }
            it("has version") {
                expect(AppInfo.version) == "1.0.0"
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

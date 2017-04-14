class AppInfoSpecs: QuickSpec {
    
    override func spec() {
        describe("App info") {
            it("has no bundle name") {
                expect(AppInfo.bundleName).to(beNil())
            }
            it("has no version") {
                expect(AppInfo.version).to(beNil())
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

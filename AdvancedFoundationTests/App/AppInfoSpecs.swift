class AppInfoSpecs: QuickSpec {
    
    override func spec() {
        describe("App info") {
            describe("has bundle name") {
                expect(AppInfo.bundleName) == "AdvancedFoundationHost"
            }
            describe("has version") {
                expect(AppInfo.version) == "1.0.0"
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

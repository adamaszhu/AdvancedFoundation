class AppInfoAccessorSpecs: QuickSpec {
    
    override func spec() {
        let appInfoAccessor = AppInfoAccessor()
        describe("has shared") {
            it("is not nil") {
                expect(AppInfoAccessor.shared).toNot(beNil())
            }
        }
        describe("has bundle name") {
            context("with valid bundle") {
                it("is correct bundle name") {
                    expect(appInfoAccessor.bundleName) == "AdvancedFoundationHost"
                }
            }
            context("with invalid bundle") {
                let appInfoAccessor = AppInfoAccessor(bundle: Bundle())
                it("is nil") {
                    expect(appInfoAccessor.bundleName).to(beNil())
                }
            }
        }
        describe("has version") {
            context("with valid bundle") {
                it("is correct version") {
                    expect(appInfoAccessor.version) == "1.1.3"
                }
            }
            context("with invalid bundle") {
                let appInfoAccessor = AppInfoAccessor(bundle: Bundle())
                it("is nil") {
                    expect(appInfoAccessor.version).to(beNil())
                }
            }
        }
        describe("calls init(bundle)") {
            context("with default bundle") {
                it("returns object") {
                    expect(appInfoAccessor).toNot(beNil())
                }
            }
            context("with bundle") {
                let appInfoAccessor = AppInfoAccessor(bundle: Bundle.main)
                it("returns object") {
                    expect(appInfoAccessor).toNot(beNil())
                }
            }
        }
    }
    
}

import Nimble
import Quick
@testable import AdvancedFoundation

class AppInfoAccessorSpecs: QuickSpec {
    
    override func spec() {
        describe("has shared") {
            let appInfoAccessor = AppInfoAccessor.shared
            it("is not nil") {
                expect(appInfoAccessor).toNot(beNil())
            }
        }
        describe("has bundle name") {
            context("with valid bundle") {
                let appInfoAccessor = AppInfoAccessor()
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
                let appInfoAccessor = AppInfoAccessor()
                it("is correct version") {
                    expect(appInfoAccessor.version) == "1.0.0"
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
                let appInfoAccessor = AppInfoAccessor()
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

import Quick
import Nimble
@testable import AdvancedFoundation

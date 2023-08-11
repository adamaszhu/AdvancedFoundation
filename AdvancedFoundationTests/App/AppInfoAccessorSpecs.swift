class AppInfoAccessorSpecs: QuickSpec {
    
    override func spec() {
        let appInfoAccessor = AppInfoAccessor()
        describe("has shared") {
            it("is not nil") {
                expect(AppInfoAccessor.standard).toNot(beNil())
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
        describe("has display name") {
            context("with valid bundle") {
                it("is correct display name") {
                    expect(appInfoAccessor.displayName) == "AdvancedFoundation"
                }
            }
            context("with invalid bundle") {
                let appInfoAccessor = AppInfoAccessor(bundle: Bundle())
                it("is nil") {
                    expect(appInfoAccessor.displayName).to(beNil())
                }
            }
        }
        describe("has version") {
            context("with valid bundle") {
                it("is correct version") {
                    expect(appInfoAccessor.version) == "1.9.5"
                }
            }
            context("with invalid bundle") {
                let appInfoAccessor = AppInfoAccessor(bundle: Bundle())
                it("is nil") {
                    expect(appInfoAccessor.version).to(beNil())
                }
            }
        }
        describe("has build number") {
            context("with valid bundle") {
                it("is correct bundle name") {
                    expect(appInfoAccessor.buildNumber) == "1"
                }
            }
            context("with invalid bundle") {
                let appInfoAccessor = AppInfoAccessor(bundle: Bundle())
                it("is nil") {
                    expect(appInfoAccessor.buildNumber).to(beNil())
                }
            }
        }
        describe("has preferredLanguage") {
            context("with valid preferred language") {
                it("is valid preferred language") {
                    expect(appInfoAccessor.preferredLanguage).toNot(beNil())
                }
            }
        }
        describe("has region") {
            context("with valid preferred language") {
                it("is valid region") {
                    expect(appInfoAccessor.region).toNot(beNil())
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

import Foundation
import Nimble
import Quick
@testable import AdvancedFoundation

class VersionHelperSpecs: QuickSpec {
    
    override func spec() {
        describe("has standard object") {
            it("is with correct version") {
                expect(VersionHelper.standard?.compareToVersion("1.0.0")) == 0
            }
        }
        describe("calls init(withVersion)") {
            context("with valid version") {
                let versionHelper = VersionHelper(withVersion: "1.0.0")
                it("returns helper with correct version") {
                    expect(versionHelper.compareToVersion("1.0.0")) == 0
                }
            }
            context("with invalid character in version") {
                let versionHelper = VersionHelper(withVersion: "1.c")
                it("returns helper with invalid version") {
                    expect(versionHelper.compareToVersion("1.0.0")).to(beNil())
                }
            }
            context("with invalid format in version") {
                let versionHelper = VersionHelper(withVersion: "1..0")
                it("returns helper with invalid version") {
                    expect(versionHelper.compareToVersion("1.0.0")).to(beNil())
                }
            }
        }
        describe("calls compareToVersion(_)") {
            let versionHelper = VersionHelper(withVersion: "1.0.0")
            context("with earlier version") {
                it("returns bigger result") {
                    expect(versionHelper.compareToVersion("0.9.9")) == 1
                }
            }
            context("with later version") {
                it("returns smaller result") {
                    expect(versionHelper.compareToVersion("1.0.1")) == -1
                }
            }
            context("with equal version") {
                it("returns equal result") {
                    expect(versionHelper.compareToVersion("1.0.0")) == 0
                }
            }
            context("with invalid character in version") {
                it("returns invalid result") {
                    expect(versionHelper.compareToVersion("1.c")).to(beNil())
                }
            }
            context("with invalid format in version") {
                it("returns invalid result") {
                    expect(versionHelper.compareToVersion(".1")).to(beNil())
                }
            }
        }
        describe("calls createVersionFlag()") {
            let versionHelper = VersionHelper.standard
            afterEach {
                versionHelper?.deleteVersionFlag()
            }
            context("without version flag saved") {
                it("misses flag") {
                    versionHelper?.createVersionFlag()
                    expect(versionHelper?.checkVersionFlag()) == true
                }
            }
            context("with version flag saved") {
                versionHelper?.createVersionFlag()
                it("finds flag") {
                    versionHelper?.createVersionFlag()
                    expect(versionHelper?.checkVersionFlag()) == true
                }
            }
        }
        describe("calls checkVersionFlag()") {
            // COMMENT: It has been done in the other two describes.
        }
        describe("calls deleteVersionFlag()") {
            let versionHelper = VersionHelper.standard
            afterEach {
                versionHelper?.deleteVersionFlag()
            }
            context("without version flag saved") {
                it("misses flag") {
                    versionHelper?.deleteVersionFlag()
                    expect(versionHelper?.checkVersionFlag()) == false
                }
            }
            context("with version flag saved") {
                versionHelper?.createVersionFlag()
                it("misses flag") {
                    versionHelper?.deleteVersionFlag()
                    expect(versionHelper?.checkVersionFlag()) == false
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

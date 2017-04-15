class VersionHelperSpecs: QuickSpec {
    
    override func spec() {
        describe("Version helper") {
            describe("has standard object") {
                expect(VersionHelper.standard?.compareToVersion("1.0.0")) == 0
            }
            describe("is initialized") {
                it("with valid version") {
                let versionHelper = VersionHelper(forVersion: "1.0.0")
                expect(versionHelper.compareToVersion("1.0.0")) == 0
                }
                it("with invalid character in version") {
                    let versionHelper = VersionHelper(forVersion: "1.c")
                    expect(versionHelper.compareToVersion("1.0.0")).to(beNil())
                }
                it("with invalid format in version") {
                    let versionHelper = VersionHelper(forVersion: "1..0")
                    expect(versionHelper.compareToVersion("1.0.0")).to(beNil())
                }
            }
            describe("compares version") {
                let versionHelper = VersionHelper(forVersion: "1.0.0")
                
                it("with earlier version") {
                    expect(versionHelper.compareToVersion("0.9.9")) == 1
                }
                it("with later version") {
                    expect(versionHelper.compareToVersion("1.0.1")) == -1
                }
                it("with equal version") {
                    expect(versionHelper.compareToVersion("1.0.0")) == 0
                }
                it("with invalid character in version") {
                    expect(versionHelper.compareToVersion("1.c")).to(beNil())
                }
                it("with invalid format in version") {
                    expect(versionHelper.compareToVersion(".1")).to(beNil())
                }
            }
            describe("creates version flag") {
                let versionHelper = VersionHelper.standard
                
                afterEach {
                    versionHelper?.deleteVersionFlag()
                }
                it("without version flag") {
                    expect(versionHelper?.checkVersionFlag()) == false
                }
                it("with version flag") {
                    versionHelper?.createVersionFlag()
                    expect(versionHelper?.checkVersionFlag()) == true
                }
                
            }
            describe("check version flag") {
                // COMMENT: It has been done in the other two describes.
            }
            describe("delete version flag") {
                let versionHelper = VersionHelper.standard
                
                it("without version flag") {
                    versionHelper?.createVersionFlag()
                    versionHelper?.deleteVersionFlag()
                    expect(versionHelper?.checkVersionFlag()) == false
                }
                it("with version flag") {
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

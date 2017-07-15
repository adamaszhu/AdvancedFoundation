class VersionHelperSpecs: QuickSpec {
    
    override func spec() {
        let versionFlag = "VersionFlag"
        let versionHelper = VersionHelper.shared
        afterEach {
            versionHelper?.deleteVersionFlag()
        }
        describe("has shared object") {
            it("is not nil") {
                expect(VersionHelper.shared).toNot(beNil())
            }
        }
        describe("calls init(version:versionFlag)") {
            context("with valid version") {
                let versionHelper = VersionHelper(version: "1.0.0", versionFlag: versionFlag)
                it("returns object") {
                    expect(versionHelper).toNot(beNil())
                }
            }
            context("with invalid character in version") {
                let versionHelper = VersionHelper(version: "1.c", versionFlag: versionFlag)
                it("returns nil") {
                    expect(versionHelper).to(beNil())
                }
            }
            context("with invalid format in version") {
                let versionHelper = VersionHelper(version: "1..0", versionFlag: versionFlag)
                it("returns nil") {
                    expect(versionHelper).to(beNil())
                }
            }
        }
        describe("calls compare(toVersion)") {
            let versionHelper = VersionHelper(version: "1.0.0", versionFlag: versionFlag)!
            context("with earlier version") {
                it("returns bigger result") {
                    expect(versionHelper.compare(toVersion: "0.9.9")) == 1
                }
            }
            context("with later version") {
                it("returns smaller result") {
                    expect(versionHelper.compare(toVersion: "1.0.1")) == -1
                }
            }
            context("with equal version") {
                it("returns equal result") {
                    expect(versionHelper.compare(toVersion: "1.0.0")) == 0
                }
            }
            context("with invalid character in version") {
                it("returns invalid result") {
                    expect(versionHelper.compare(toVersion: "1.c")).to(beNil())
                }
            }
            context("with invalid format in version") {
                it("returns invalid result") {
                    expect(versionHelper.compare(toVersion: ".1")).to(beNil())
                }
            }
        }
        describe("calls createVersionFlag()") {
            context("without version flag saved") {
                it("misses flag") {
                    versionHelper?.createVersionFlag()
                    expect(versionHelper?.hasVersionFlag) == true
                }
            }
            context("with version flag saved") {
                it("finds flag") {
                    versionHelper?.createVersionFlag()
                    versionHelper?.createVersionFlag()
                    expect(versionHelper?.hasVersionFlag) == true
                }
            }
        }
        describe("calls checkVersionFlag()") {
            context("without version flag saved") {
                it("misses flag") {
                    expect(versionHelper?.hasVersionFlag) == false
                }
            }
            context("with version flag saved") {
                it("finds flag") {
                    versionHelper?.createVersionFlag()
                    expect(versionHelper?.hasVersionFlag) == true
                }
            }
        }
        describe("calls deleteVersionFlag()") {
            context("without version flag saved") {
                it("misses flag") {
                    versionHelper?.deleteVersionFlag()
                    expect(versionHelper?.hasVersionFlag) == false
                }
            }
            context("with version flag saved") {
                it("misses flag") {
                    versionHelper?.createVersionFlag()
                    versionHelper?.deleteVersionFlag()
                    expect(versionHelper?.hasVersionFlag) == false
                }
            }
        }
    }
    
}

import Nimble
import Quick
@testable import AdvancedFoundation

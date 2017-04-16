class VersionHelperSpecs: QuickSpec {
    
    override func spec() {
        describe("Version helper") {
            it("has standard object with valid version") {
                expect(VersionHelper.standard?.compareToVersion("1.0.0")) == 0
            }
            it("is initialized with valid version") {
                let versionHelper = VersionHelper(forVersion: "1.0.0")
                expect(versionHelper.compareToVersion("1.0.0")) == 0
            }
            describe("is initialized with invalid version") {
                it("with invalid character") {
                    let versionHelper = VersionHelper(forVersion: "1.c")
                    expect(versionHelper.compareToVersion("1.0.0")).to(beNil())
                }
                it("with invalid format") {
                    let versionHelper = VersionHelper(forVersion: "1..0")
                    expect(versionHelper.compareToVersion("1.0.0")).to(beNil())
                }
            }
            describe("parses valid version") {
                let versionHelper = VersionHelper(forVersion: "1.0.0")
                
                it("with later code") {
                    expect(versionHelper.compareToVersion("0.9.9")) == 1
                }
                it("with earlier code") {
                    expect(versionHelper.compareToVersion("1.0.1")) == -1
                }
                it("with equal code") {
                    expect(versionHelper.compareToVersion("1.0.0")) == 0
                }
            }
            describe("parses invalid version") {
                let versionHelper = VersionHelper(forVersion: "1.0.0")
                
                it("with invalid character") {
                    expect(versionHelper.compareToVersion("1.c")).to(beNil())
                }
                it("with invalid format") {
                    expect(versionHelper.compareToVersion(".1")).to(beNil())
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

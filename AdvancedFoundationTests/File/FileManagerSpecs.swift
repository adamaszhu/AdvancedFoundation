class FileManagerSpecs: QuickSpec {
    
    override func spec() {
        let fileHelper = FileHelper.standard
        describe("has standard") {
            it("as valid object") {
                expect(fileHelper).toNot(beNil())
            }
        }
        describe("calls getAbsolutePath") {
            context("with absolute path") {
                it("gets correct absolute path") {
                    expect(fileHelper.getAbsolutePath(ofPath: "/dir")) == "/dir"
                }
            }
            context("with relative path") {
                it("gets correct absolute path") {
                    expect(fileHelper.getAbsolutePath(ofPath: "dir")) == NSHomeDirectory() + "/dir"
                }
            }
        }
        describe("calls getParentDirectory") {
            context("with root path") {
                
            }
            context("with relative path") {
                
            }
            context("with absolute file path") {
                it(fileHelper.getParentDirectory(ofPath: "/parentDir"))
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation



class PathHelperSpecs: QuickSpec {
    
    override func spec() {
        let pathHelper = PathHelper(path: "temp/temp.tmp")
        let fileHelper = FileHelper(path: "temp/temp.tmp")
        afterEach {
            var pathHelper = PathHelper(path: "temp/temp.tmp")
            _ = pathHelper.removeItem()
            pathHelper = PathHelper(path: "temp")
            _ = pathHelper.removeItem()
        }
        describe("has path") {
            it("is correct") {
                expect(pathHelper.path.hasPrefix("/Users")) == true
            }
        }
        describe("has isExisted") {
            context("if the path exists") {
                it("is true") {
                    _ = fileHelper.createFile(with: Data())
                    expect(pathHelper.isExisted) == true
                }
            }
            context("if the path doesn't exist") {
                it("is false") {
                    expect(pathHelper.isExisted) == false
                }
            }
        }
        describe("calls copyCurrentItem(toPath)") {
            afterEach {
                let destinationPathHelper = PathHelper(path: "temp1.tmp")
                _ = destinationPathHelper.removeItem()
            }
            context("if the original path exists and the destination doesn't exist") {
                it("returns true") {
                    _ = fileHelper.createFile(with: Data())
                    expect(pathHelper.copyItem(toPath: "temp1.tmp")) == true
                }
            }
            context("if the original path exists and the destionation exists") {
                it("returns false") {
                    _ = fileHelper.createFile(with: Data())
                    let destinationFileHelper = FileHelper(path: "temp1.tmp")
                    _ = destinationFileHelper.createFile(with: Data())
                    expect(fileHelper.copyItem(toPath: "temp1.tmp")) == false
                }
            }
            context("if the path doesn't exists") {
                it("returns false") {
                    expect(pathHelper.copyItem(toPath: "temp1.tmp")) == false
                }
            }
        }
        describe("calls removeCurrentItem()") {
            context("if the path exists") {
                it("returns true") {
                    _ = fileHelper.createFile(with: Data())
                    expect(pathHelper.removeItem()) == true
                }
            }
            context("if the path doesn't exist") {
                it("returns false") {
                    expect(pathHelper .removeItem()) == false
                }
            }
        }
        describe("calls createParentDirectory() ") {
            context("if the parent directory exists") {
                it("returns true") {
                    let directoryHelper = DirectoryHelper(path: "temp")
                    _ = directoryHelper.createDirectory()
                    expect(pathHelper.createParentDirectory()) == true
                }
            }
            context("if the parent directory doesn't exist") {
                it("returns true") {
                    expect(pathHelper.createParentDirectory()) == true
                }
            }
            context("if the parent path is a file") {
                it("returns nil") {
                    let fileHelper = FileHelper(path: "temp")
                    _ = fileHelper.createFile(with: Data())
                    expect(pathHelper.createParentDirectory()).to(beNil())
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation

class PathHelperSpecs: QuickSpec {
    
    override func spec() {
        let pathHelper = PathHelper(path: "temp/temp.tmp")
        let fileHelper = FileHelper(path: "temp/temp.tmp")
        afterEach {
            var pathHelper = PathHelper(path: "temp/temp.tmp")
            _ = pathHelper.remove()
            pathHelper = PathHelper(path: "temp")
            _ = pathHelper.remove()
        }
        describe("has path") {
            it("is correct") {
                expect(pathHelper.path.hasPrefix("/Users")) == true
            }
        }
        describe("has isExisted") {
            context("if the path exists") {
                it("is true") {
                    _ = fileHelper.create(with: Data())
                    expect(pathHelper.isExisted) == true
                }
            }
            context("if the path doesn't exist") {
                it("is false") {
                    expect(pathHelper.isExisted) == false
                }
            }
        }
        describe("calls copy(toPath)") {
            afterEach {
                let destinationPathHelper = PathHelper(path: "temp1.tmp")
                _ = destinationPathHelper.remove()
            }
            context("if the original path exists and the destination doesn't exist") {
                it("returns true") {
                    _ = fileHelper.create(with: Data())
                    expect(pathHelper.copy(toPath: "temp1.tmp")) == true
                }
            }
            context("if the original path exists and the destionation exists") {
                it("returns false") {
                    _ = fileHelper.create(with: Data())
                    let destinationFileHelper = FileHelper(path: "temp1.tmp")
                    _ = destinationFileHelper.create(with: Data())
                    expect(fileHelper.copy(toPath: "temp1.tmp")) == false
                }
            }
            context("if the path doesn't exists") {
                it("returns false") {
                    expect(pathHelper.copy(toPath: "temp1.tmp")) == false
                }
            }
        }
        describe("calls remove()") {
            context("if the path exists") {
                it("returns true") {
                    _ = fileHelper.create(with: Data())
                    expect(pathHelper.remove()) == true
                }
            }
            context("if the path doesn't exist") {
                it("returns false") {
                    expect(pathHelper .remove()) == false
                }
            }
        }
        describe("calls createParentDirectory() ") {
            context("if the parent directory exists") {
                it("returns true") {
                    let directoryHelper = DirectoryHelper(path: "temp")
                    _ = directoryHelper.create()
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
                    _ = fileHelper.create(with: Data())
                    expect(pathHelper.createParentDirectory()).to(beNil())
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation



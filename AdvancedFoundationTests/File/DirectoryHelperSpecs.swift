class DirectoryHelperSpecs: QuickSpec {
    
    override func spec() {
        let directoryHelper = DirectoryHelper(withPath: "temp")
        afterEach {
            let pathHelper = PathHelper(withPath: "temp")
            _ = pathHelper.remove()
        }
        describe("has isExisted") {
            context("if the directory exists") {
                it("returns true") {
                    _ = directoryHelper.create()
                    expect(directoryHelper.isExisted) == true
                }
            }
            context("if the path doesn't exist") {
                it("returns false") {
                    expect(directoryHelper.isExisted) == false
                }
            }
            context("if the path is a file") {
                it("returns false") {
                    let fileHelper = FileHelper(withPath: "temp")
                    _ = fileHelper.create(withData: Data())
                    expect(directoryHelper.isExisted) == false
                }
            }
        }
        describe("calls create()") {
            context("if the directory doesn't exist") {
                it("returns true") {
                    let result = directoryHelper.create()
                    expect(result) == true
                }
            }
            context("if the directory exists") {
                it("returns false") {
                    _ = directoryHelper.create()
                    let result = directoryHelper.create()
                    expect(result) == false
                }
            }
        }
        describe("calls getContent()") {
            context("if the directory is empty") {
                it("returns empty array") {
                    _ = directoryHelper.create()
                    expect(directoryHelper.getContent()?.count) == 0
                }
            }
            context("if the directory is not empty") {
                it("returns the file list") {
                    _ = directoryHelper.create()
                    let fileHelper = FileHelper(withPath: "temp/temp.tmp")
                    _ = fileHelper.create(withData: Data())
                    expect(directoryHelper.getContent()?.count) == 1
                }
            }
            context("if the directory doesn't exist") {
                it("returns nil") {
                    expect(directoryHelper.getContent()).to(beNil())
                }
            }
        }
        describe("calls remove()") {
            context("if the directory exists") {
                it("returns true") {
                    _ = directoryHelper.create()
                    expect(directoryHelper.remove()) == true
                }
            }
            context("if the directory doesn't exist") {
                it("returns false") {
                    expect(directoryHelper.remove()) == false
                }
            }
        }
        describe("calls copy(toPath)") {
            afterEach {
                let destinationPathHelper = PathHelper(withPath: "temp1")
                _ = destinationPathHelper.remove()
            }
            context("if the directory exists and the destination doesn't exist") {
                it("returns true") {
                    _ = directoryHelper.create()
                    expect(directoryHelper.copy(toPath: "temp1")) == true
                }
            }
            context("if the directory exists and the destionation directory exists") {
                it("returns false") {
                    _ = directoryHelper.create()
                    let destinationDirectoryHelper = DirectoryHelper(withPath: "temp1")
                    _ = destinationDirectoryHelper.create()
                    expect(directoryHelper.copy(toPath: "temp1")) == false
                }
            }
            context("if the directory exists and the destionation file exists") {
                it("returns false") {
                    _ = directoryHelper.create()
                    let destinationFileHelper = FileHelper(withPath: "temp1")
                    _ = destinationFileHelper.create(withData: Data())
                    expect(directoryHelper.copy(toPath: "temp1")) == false
                }
            }
            context("if the directory doesn't exists") {
                it("returns false") {
                    expect(directoryHelper.copy(toPath: "temp1")) == false
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

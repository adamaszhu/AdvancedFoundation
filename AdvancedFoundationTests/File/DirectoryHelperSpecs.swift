class DirectoryHelperSpecs: QuickSpec {
    
    override func spec() {
        let directoryHelper = DirectoryHelper(path: "temp")
        afterEach {
            let pathHelper = PathHelper(path: "temp")
            _ = pathHelper.removeItem()
        }
        describe("has path") {
            it("is correct") {
                expect(directoryHelper.path.hasPrefix("/Users")) == true
            }
        }
        describe("has isExisted") {
            context("if the directory exists") {
                it("returns true") {
                    _ = directoryHelper.createDirectory()
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
                    let fileHelper = FileHelper(path: "temp")
                    _ = fileHelper.createFile(with: Data())
                    expect(directoryHelper.isExisted) == false
                }
            }
        }
        describe("calls create()") {
            context("if the directory doesn't exist") {
                it("returns true") {
                    let result = directoryHelper.createDirectory()
                    expect(result) == true
                }
            }
            context("if the directory exists") {
                it("returns false") {
                    _ = directoryHelper.createDirectory()
                    let result = directoryHelper.createDirectory()
                    expect(result) == false
                }
            }
        }
        describe("has content") {
            context("if the directory is empty") {
                it("returns empty array") {
                    _ = directoryHelper.createDirectory()
                    expect(directoryHelper.content?.count) == 0
                }
            }
            context("if the directory is not empty") {
                it("returns the file list") {
                    _ = directoryHelper.createDirectory()
                    let fileHelper = FileHelper(path: "temp/temp.tmp")
                    _ = fileHelper.createFile(with: Data())
                    expect(directoryHelper.content?.count) == 1
                }
            }
            context("if the directory doesn't exist") {
                it("returns nil") {
                    expect(directoryHelper.content).to(beNil())
                }
            }
        }
        describe("calls remove()") {
            context("if the directory exists") {
                it("returns true") {
                    _ = directoryHelper.createDirectory()
                    expect(directoryHelper.removeItem()) == true
                }
            }
            context("if the directory doesn't exist") {
                it("returns false") {
                    expect(directoryHelper.removeItem()) == false
                }
            }
        }
        describe("calls copy(toPath)") {
            afterEach {
                let destinationPathHelper = PathHelper(path: "temp1")
                _ = destinationPathHelper.removeItem()
            }
            context("if the directory exists and the destination doesn't exist") {
                it("returns true") {
                    _ = directoryHelper.createDirectory()
                    expect(directoryHelper.copyItem(toPath: "temp1")) == true
                }
            }
            context("if the directory exists and the destionation directory exists") {
                it("returns false") {
                    _ = directoryHelper.createDirectory()
                    let destinationDirectoryHelper = DirectoryHelper(path: "temp1")
                    _ = destinationDirectoryHelper.createDirectory()
                    expect(directoryHelper.copyItem(toPath: "temp1")) == false
                }
            }
            context("if the directory exists and the destionation file exists") {
                it("returns false") {
                    _ = directoryHelper.createDirectory()
                    let destinationFileHelper = FileHelper(path: "temp1")
                    _ = destinationFileHelper.createFile(with: Data())
                    expect(directoryHelper.copyItem(toPath: "temp1")) == false
                }
            }
            context("if the directory doesn't exists") {
                it("returns false") {
                    expect(directoryHelper.copyItem(toPath: "temp1")) == false
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

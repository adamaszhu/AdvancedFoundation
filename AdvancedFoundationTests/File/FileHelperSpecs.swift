class FileHelperSpecs: QuickSpec {
    
    override func spec() {
        let fileHelper = FileHelper(path: "temp.tmp")
        afterEach {
            let pathHelper = PathHelper(path: "temp.tmp")
            _ = pathHelper.removeItem()
        }
        describe("has path") {
            it("is correct") {
                expect(fileHelper.path.hasPrefix("/Users")) == true
            }
        }
        describe("has isExisted") {
            context("if the file exists") {
                it("is true") {
                    _ = fileHelper.createFile(with: Data())
                    expect(fileHelper.isExisted) == true
                }
            }
            context("if the path doesn't exist") {
                it("is false") {
                    expect(fileHelper.isExisted) == false
                }
            }
            context("if the path is a directory") {
                it("is false") {
                    let directoryHelper = DirectoryHelper(path: "temp.tmp")
                    _ = directoryHelper.createDirectory()
                    expect(fileHelper.isExisted) == false
                    _ = fileHelper.removeItem()
                }
            }
        }
        describe("call create(with)") {
            context("if the file exists") {
                it("returns false") {
                    _ = fileHelper.createFile(with: Data())
                    let result = fileHelper.createFile(with: Data())
                    expect(result) == false
                }
            }
            context("if the file doesn't exist") {
                it("returns true") {
                    let result = fileHelper.createFile(with: Data())
                    expect(result) == true
                }
            }
        }
        describe("has context") {
            context("if the file exists") {
                it("returns the content") {
                    let data = "Temp".data(using: .utf8)!
                    _ = fileHelper.createFile(with: data)
                    expect(fileHelper.content?.count) == data.count
                }
            }
            context("if the file doesn't exist") {
                it("returns nil") {
                    expect(fileHelper.content).to(beNil())
                }
            }
        }
        describe("calls copy(toPath)") {
            afterEach {
                let destinationPathHelper = PathHelper(path: "temp1.tmp")
                _ = destinationPathHelper.removeItem()
            }
            context("if the file exists and the destination doesn't exist") {
                it("returns true") {
                    _ = fileHelper.createFile(with: Data())
                    expect(fileHelper.copyItem(toPath: "temp1.tmp")) == true
                }
            }
            context("if the directory exists and the destionation directory exists") {
                it("returns false") {
                    _ = fileHelper.createFile(with: Data())
                    let destinationDirectoryHelper = DirectoryHelper(path: "temp1.tmp")
                    _ = destinationDirectoryHelper.createDirectory()
                    expect(fileHelper.copyItem(toPath: "temp1.tmp")) == false
                }
            }
            context("if the directory exists and the destionation file exists") {
                it("returns false") {
                    _ = fileHelper.createFile(with: Data())
                    let destinationFileHelper = FileHelper(path: "temp1.tmp")
                    _ = destinationFileHelper.createFile(with: Data())
                    expect(fileHelper.copyItem(toPath: "temp1.tmp")) == false
                }
            }
            context("if the file doesn't exists") {
                it("returns false") {
                    expect(fileHelper.copyItem(toPath: "temp1.tmp")) == false
                }
            }
        }
        describe("calls remove()") {
            context("if the file exists") {
                it("returns true") {
                    _ = fileHelper.createFile(with: Data())
                    expect(fileHelper.removeItem()) == true
                }
            }
            context("if the file doesn't exist") {
                it("returns false") {
                    expect(fileHelper.removeItem()) == false
                }
            }
        }
    }
}

import Foundation
import Quick
import Nimble
@testable import AdvancedFoundation

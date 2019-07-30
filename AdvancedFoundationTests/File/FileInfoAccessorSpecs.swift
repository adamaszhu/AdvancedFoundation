class FileInfoAccessorSpecs: QuickSpec {
    
    override func spec() {
        describe("has mimeType") {
            context("as valid file with special file name") {
                let fileInfoAccessor = FileInfoAccessor(path: "/test/.png")
                it("is default type") {
                    expect(fileInfoAccessor.mimeType) == "application/octet-stream"
                }
            }
            context("as valid file without extension") {
                let fileInfoAccessor = FileInfoAccessor(path: "/test/file")
                it("is default type") {
                    expect(fileInfoAccessor.mimeType) == "application/octet-stream"
                }
            }
            context("as valid file with known extension") {
                let fileInfoAccessor = FileInfoAccessor(path: "/test/file.txt")
                it("is correct type") {
                    expect(fileInfoAccessor.mimeType) == "text/plain"
                }
            }
            context("as valid file with unknown extension") {
                let fileInfoAccessor = FileInfoAccessor(path: "/test/file.ttxt")
                it("is default type") {
                    expect(fileInfoAccessor.mimeType) == "application/octet-stream"
                }
            }
        }
        describe("has filename") {
            context("as valid file with special file name") {
                let fileInfoAccessor = FileInfoAccessor(path: "/test/.png")
                it("is correct filename") {
                    expect(fileInfoAccessor.filename) == ".png"
                }
            }
            context("as valid file without extension") {
                let fileInfoAccessor = FileInfoAccessor(path: "/test/file")
                it("is correct filename") {
                    expect(fileInfoAccessor.filename) == "file"
                }
            }
            context("as valid file with extension") {
                let fileInfoAccessor = FileInfoAccessor(path: "/test/file.txt")
                it("is correct filename") {
                    expect(fileInfoAccessor.filename) == "file"
                }
            }
        }
        describe("has fileExtension") {
            context("as valid file with special file name") {
                let fileInfoAccessor = FileInfoAccessor(path: "/test/.png")
                it("is empty") {
                    expect(fileInfoAccessor.fileExtension) == ""
                }
            }
            context("as valid file without extension") {
                let fileInfoAccessor = FileInfoAccessor(path: "/test/file")
                it("is empty") {
                    expect(fileInfoAccessor.fileExtension) == ""
                }
            }
            context("as valid file with extension") {
                let fileInfoAccessor = FileInfoAccessor(path: "/test/file.txt")
                it("is correct extension") {
                    expect(fileInfoAccessor.fileExtension) == "txt"
                }
            }
        }
        describe("calls init(path)") {
            let fileInfoAccessor = FileInfoAccessor(path: "")
            it("return valid accessor") {
                expect(fileInfoAccessor).notTo(beNil())
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation

class FileInfoAccessorSpecs: QuickSpec {
    
    override func spec() {
        describe("File info accessor") {
            describe("has file extension") {
                it("as valid file with special file name") {
                    let fileInfoAccessor = FileInfoAccessor(withPath: "/test/.png")
                    expect(fileInfoAccessor.fileExtension) == ""
                }
                it("as valid file without extension") {
                    let fileInfoAccessor = FileInfoAccessor(withPath: "/test/file")
                    expect(fileInfoAccessor.fileExtension) == ""
                }
                it("as valid file with extension") {
                    let fileInfoAccessor = FileInfoAccessor(withPath: "/test/file.txt")
                    expect(fileInfoAccessor.fileExtension) == "txt"
                }
            }
            describe("has file name") {
                it("as valid file with special file name") {
                    let fileInfoAccessor = FileInfoAccessor(withPath: "/test/.png")
                    expect(fileInfoAccessor.filename) == ".png"
                }
                it("as valid file without extension") {
                    let fileInfoAccessor = FileInfoAccessor(withPath: "/test/file")
                    expect(fileInfoAccessor.filename) == "file"
                }
                it("as valid file with extension") {
                    let fileInfoAccessor = FileInfoAccessor(withPath: "/test/file.txt")
                    expect(fileInfoAccessor.filename) == "file"
                }
            }
            describe("has mime type") {
                it("as valid file with special file name") {
                    let fileInfoAccessor = FileInfoAccessor(withPath: "/test/.png")
                    expect(fileInfoAccessor.mimeType) == "application/octet-stream"
                }
                it("as valid file without extension") {
                    let fileInfoAccessor = FileInfoAccessor(withPath: "/test/file")
                    expect(fileInfoAccessor.mimeType) == "application/octet-stream"
                }
                it("as valid file with known extension") {
                    let fileInfoAccessor = FileInfoAccessor(withPath: "/test/file.txt")
                    expect(fileInfoAccessor.mimeType) == "text/plain"
                }
                it("as valid file with unknown extension") {
                    let fileInfoAccessor = FileInfoAccessor(withPath: "/test/file.ttxt")
                    expect(fileInfoAccessor.mimeType) == "application/octet-stream"
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation









class NetworkResponseHeaderParserSpecs: QuickSpec {
    
    /**
     * All header keys.
     */
    private let contentTypeHeader = "Content-Type"
    private let contentLengthHeader = "Content-Length"
    private let lastModifiedHeader = "Last-Modified"
    private let eTagHeader = "Etag"
    
    override func spec() {
        describe("calls parse(_)") {
            context("with invalid http response") {
                it("returns nil") {
                    let response = URLResponse()
                    expect(NetworkResponseHeader.parse(response)).to(beNil())
                }
            }
            context("without content type header") {
                it("returns nil") {
                    let header = [self.contentLengthHeader: "0"]
                    let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                    expect(NetworkResponseHeader.parse(response)).to(beNil())
                }
            }
            context("without content length header") {
                it("returns nil") {
                    let header = [self.contentTypeHeader: "contentType"]
                    let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                    expect(NetworkResponseHeader.parse(response)).to(beNil())
                }
            }
            context("with invalid content type header") {
                it("returns nil") {
                    let header = [self.contentTypeHeader: "contentType", self.contentLengthHeader: "test"]
                    let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                    expect(NetworkResponseHeader.parse(response)).to(beNil())
                }
            }
            context("with lastModified header") {
                it("returns response header with lastModified value") {
                    let header = [self.contentTypeHeader: "contentType", self.contentLengthHeader: "0", self.lastModifiedHeader: "lastModified"]
                    let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                    expect(NetworkResponseHeader.parse(response)?.lastModified) == "lastModified"
                }
            }
            context("without lastModified header") {
                it("returns response header without lastModified value") {
                    let header = [self.contentTypeHeader: "contentType", self.contentLengthHeader: "0"]
                    let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                    expect(NetworkResponseHeader.parse(response)?.lastModified).to(beNil())
                }
            }
            context("with eTag header") {
                it("returns response header with eTag value") {
                    let header = [self.contentTypeHeader: "contentType", self.contentLengthHeader: "0", self.eTagHeader: "eTag"]
                    let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                    expect(NetworkResponseHeader.parse(response)?.eTag) == "eTag"
                }
            }
            context("without eTag header") {
                it("returns response header without eTag value") {
                    let header = [self.contentTypeHeader: "contentType", self.contentLengthHeader: "0"]
                    let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                    expect(NetworkResponseHeader.parse(response)?.eTag).to(beNil())
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

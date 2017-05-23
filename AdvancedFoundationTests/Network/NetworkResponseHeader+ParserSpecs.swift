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
            context("with contentType header") {
                it("returns response with correct contentType") {
                    let header = [self.contentTypeHeader: "ContentType"]
                    let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                    expect(NetworkResponseHeader.parse(response)?.contentType) == "ContentType"
                }
            }
            context("with invalid contentLength header") {
                it("returns response header without contentLength value") {
                    let header = [self.contentLengthHeader: "ContentLength"]
                    let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                    expect(NetworkResponseHeader.parse(response)?.contentLength).to(beNil())
                }
            }
            context("with correct contentLength header") {
                it("returns response header without contentLength value") {
                    let header = [self.contentLengthHeader: "1"]
                    let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                    expect(NetworkResponseHeader.parse(response)?.contentLength) == 1
                }
            }
            context("with lastModified header") {
                it("returns response header with lastModified value") {
                    let header = [self.lastModifiedHeader: "LastModified"]
                    let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                    expect(NetworkResponseHeader.parse(response)?.lastModified) == "LastModified"
                }
            }
            context("with eTag header") {
                it("returns response header with eTag value") {
                    let header = [self.eTagHeader: "ETag"]
                    let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                    expect(NetworkResponseHeader.parse(response)?.eTag) == "ETag"
                }
            }
            context("without header") {
                let header = Dictionary<String, String>()
                let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                let responseHeader = NetworkResponseHeader.parse(response)
                it("returns response header without eTag value") {
                    expect(responseHeader?.eTag).to(beNil())
                }
                it("returns response header without lastModified value") {
                    expect(responseHeader?.lastModified).to(beNil())
                }
                it("returns response header without contentLength value") {
                    expect(responseHeader?.contentLength).to(beNil())
                }
                it("returns response header without contentType value") {
                    expect(responseHeader?.contentType).to(beNil())
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

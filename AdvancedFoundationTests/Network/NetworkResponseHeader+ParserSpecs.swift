class NetworkResponseHeaderParserSpecs: QuickSpec {
    
    override func spec() {
        let contentTypeHeader = "Content-Type"
        let contentLengthHeader = "Content-Length"
        let lastModifiedHeader = "Last-Modified"
        let eTagHeader = "Etag"
        describe("calls parse(_)") {
            context("with invalid http response") {
                let response = URLResponse()
                it("returns nil") {
                    expect(NetworkResponseHeader.header(from: response)).to(beNil())
                }
            }
            context("with contentType header") {
                let header = [contentTypeHeader: "ContentType"]
                let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                let responseHeader = NetworkResponseHeader.header(from: response)
                it("returns response header with correct contentType") {
                    expect(responseHeader?.contentType) == "ContentType"
                }
            }
            context("with invalid contentLength header") {
                let header = [contentLengthHeader: "ContentLength"]
                let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                let responseHeader = NetworkResponseHeader.header(from: response)
                it("returns response header without contentLength value") {
                    expect(responseHeader?.contentLength).to(beNil())
                }
            }
            context("with correct contentLength header") {
                let header = [contentLengthHeader: "1"]
                let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                let responseHeader = NetworkResponseHeader.header(from: response)
                it("returns response header without contentLength value") {
                    expect(responseHeader?.contentLength) == 1
                }
            }
            context("with lastModified header") {
                let header = [lastModifiedHeader: "LastModified"]
                let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                let responseHeader = NetworkResponseHeader.header(from: response)
                it("returns response header with lastModified value") {
                    expect(responseHeader?.lastModified) == "LastModified"
                }
            }
            context("with eTag header") {
                let header = [eTagHeader: "ETag"]
                let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                let responseHeader = NetworkResponseHeader.header(from: response)
                it("returns response header with eTag value") {
                    expect(responseHeader?.eTag) == "ETag"
                }
            }
            context("without header") {
                let header = [String: String]()
                let response = HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 0, httpVersion: nil, headerFields: header)!
                let responseHeader = NetworkResponseHeader.header(from: response)
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

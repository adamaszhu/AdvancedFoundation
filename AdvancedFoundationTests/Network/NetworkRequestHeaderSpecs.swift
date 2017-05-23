class NetworkRequestHeaderSpecs: QuickSpec {
    
    override func spec() {
        describe("calls init(ifModifiedSince:ifNoneMatch:contentType:contentLength)") {
            context("with explicit values") {
                let networkRequestHeader = NetworkRequestHeader(ifModifiedSince: "IfModifiedSince", ifNoneMatch: "IfNoneMatch", contentType: "ContentType", contentLength: 1)
                it("returns NetworkResponseHeader with correct contentType") {
                    expect(networkRequestHeader.contentType) == "ContentType"
                }
                it("returns NetworkResponseHeader with correct contentLength") {
                    expect(networkRequestHeader.contentLength) == 1
                }
                it("returns NetworkResponseHeader with correct ifModifiedSince") {
                    expect(networkRequestHeader.ifModifiedSince) == "IfModifiedSince"
                }
                it("returns NetworkResponseHeader with correct ifNoneMatch") {
                    expect(networkRequestHeader.ifNoneMatch) == "IfNoneMatch"
                }
            }
            context("with default values") {
                let networkRequestHeader = NetworkRequestHeader()
                it("returns NetworkResponseHeader without contentType") {
                    expect(networkRequestHeader.contentType).to(beNil())
                }
                it("returns NetworkResponseHeader without contentLength") {
                    expect(networkRequestHeader.contentLength).to(beNil())
                }
                it("returns NetworkResponseHeader without ifModifiedSince") {
                    expect(networkRequestHeader.ifModifiedSince).to(beNil())
                }
                it("returns NetworkResponseHeader without ifNoneMatch") {
                    expect(networkRequestHeader.ifNoneMatch).to(beNil())
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

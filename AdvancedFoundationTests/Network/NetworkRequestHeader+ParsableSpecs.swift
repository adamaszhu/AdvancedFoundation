class NetworkRequestHeaderParserSpecs: QuickSpec {
    
    override func spec() {
        let ifModifiedSinceHeader = "If-Modified-Since"
        let ifNoneMatchHeader = "If-None-Match"
        let contentTypeHeader = "Content-Type"
        let contentLengthHeader = "Content-Length"
        describe("calls convertToDictionary()") {
            context("with every header") {
                let requestHeaderDictionary = NetworkRequestHeader(ifModifiedSince: "IfModifiedSince", ifNoneMatch: "IfNoneMatch", contentType: "ContentType", contentLength: 0).dictionary
                it("returns dictionary with ifModifiedSince") {
                    expect(requestHeaderDictionary[ifModifiedSinceHeader]) == "IfModifiedSince"
                }
                it("returns dictionary with ifNoneMatch") {
                    expect(requestHeaderDictionary[ifNoneMatchHeader]) == "IfNoneMatch"
                }
                it("returns dictionary with contentType") {
                    expect(requestHeaderDictionary[contentTypeHeader]) == "ContentType"
                }
                it("returns dictionary with contentLength") {
                    expect(requestHeaderDictionary[contentLengthHeader]) == "0"
                }
            }
            context("without any header") {
                let requestHeaderDictionary = NetworkRequestHeader().dictionary
                it("returns dictionary without ifModifiedSince") {
                    expect(requestHeaderDictionary[ifModifiedSinceHeader]).to(beNil())
                }
                it("returns dictionary without ifNoneMatch") {
                    expect(requestHeaderDictionary[ifNoneMatchHeader]).to(beNil())
                }
                it("returns dictionary without contentType") {
                    expect(requestHeaderDictionary[contentTypeHeader]).to(beNil())
                }
                it("returns dictionary without contentLength") {
                    expect(requestHeaderDictionary[contentLengthHeader]).to(beNil())
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

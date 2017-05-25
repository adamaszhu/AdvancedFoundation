class NetworkRequestHeaderParserSpecs: QuickSpec {
    
    /**
     * All header keys.
     */
    private let ifModifiedSinceHeader = "If-Modified-Since"
    private let ifNoneMatchHeader = "If-None-Match"
    private let contentTypeHeader = "Content-Type"
    private let contentLengthHeader = "Content-Length"
    
    override func spec() {
        describe("calls convertToDictionary()") {
            context("with every header") {
                let requestHeaderDictionary = NetworkRequestHeader(ifModifiedSince: "IfModifiedSince", ifNoneMatch: "IfNoneMatch", contentType: "ContentType", contentLength: 0).convertToDictionary()
                it("returns dictionary with ifModifiedSince") {
                    expect(requestHeaderDictionary[self.ifModifiedSinceHeader]) == "IfModifiedSince"
                }
                it("returns dictionary with ifNoneMatch") {
                    expect(requestHeaderDictionary[self.ifNoneMatchHeader]) == "IfNoneMatch"
                }
                it("returns dictionary with contentType") {
                    expect(requestHeaderDictionary[self.contentTypeHeader]) == "ContentType"
                }
                it("returns dictionary with contentLength") {
                    expect(requestHeaderDictionary[self.contentLengthHeader]) == "0"
                }
            }
            context("without any header") {
                let requestHeaderDictionary = NetworkRequestHeader().convertToDictionary()
                it("returns dictionary without ifModifiedSince") {
                    expect(requestHeaderDictionary[self.ifModifiedSinceHeader]).to(beNil())
                }
                it("returns dictionary without ifNoneMatch") {
                    expect(requestHeaderDictionary[self.ifNoneMatchHeader]).to(beNil())
                }
                it("returns dictionary without contentType") {
                    expect(requestHeaderDictionary[self.contentTypeHeader]).to(beNil())
                }
                it("returns dictionary without contentLength") {
                    expect(requestHeaderDictionary[self.contentLengthHeader]).to(beNil())
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

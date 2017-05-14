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
                let requestHeaderDictionary = NetworkRequestHeader(ifModifiedSince: "ifModifiedSince", ifNoneMatch: "ifNoneMatch", contentType: "contentType", contentLength: 0).convertToDictionary()
                it("returns dictionary with ifModifiedSince") {
                    expect(requestHeaderDictionary[self.ifModifiedSinceHeader]) == "ifModifiedSince"
                }
                it("returns dictionary with ifNoneMatch") {
                    expect(requestHeaderDictionary[self.ifNoneMatchHeader]) == "ifNoneMatch"
                }
                it("returns dictionary with contentType") {
                    expect(requestHeaderDictionary[self.contentTypeHeader]) == "contentType"
                }
                it("returns dictionary with contentLength") {
                    expect(requestHeaderDictionary[self.contentLengthHeader]) == "0"
                }
            }
            context("without any header") {
                let requestHeaderDictionary = NetworkRequestHeader(ifModifiedSince: nil, ifNoneMatch: nil, contentType: nil, contentLength: nil).convertToDictionary()
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

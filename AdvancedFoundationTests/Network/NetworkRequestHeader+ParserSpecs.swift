class NetworkRequestHeaderParserSpecs: QuickSpec {
    
    /**
     * All header keys.
     */
    private static let ifModifiedSinceHeader = "If-Modified-Since"
    private static let ifNoneMatchHeader = "If-None-Match"
    private static let contentTypeHeader = "Content-Type"
    private static let contentLengthHeader = "Content-Length"
    
    override func spec() {
        describe("calls convertToDictionary()") {
            context("with every header") {
                let requestHeaderDictionary = NetworkRequestHeader(ifModifiedSince: "IfModifiedSince", ifNoneMatch: "IfNoneMatch", contentType: "ContentType", contentLength: 0).convertToDictionary()
                it("returns dictionary with ifModifiedSince") {
                    expect(requestHeaderDictionary[NetworkRequestHeaderParserSpecs.ifModifiedSinceHeader]) == "IfModifiedSince"
                }
                it("returns dictionary with ifNoneMatch") {
                    expect(requestHeaderDictionary[NetworkRequestHeaderParserSpecs.ifNoneMatchHeader]) == "IfNoneMatch"
                }
                it("returns dictionary with contentType") {
                    expect(requestHeaderDictionary[NetworkRequestHeaderParserSpecs.contentTypeHeader]) == "ContentType"
                }
                it("returns dictionary with contentLength") {
                    expect(requestHeaderDictionary[NetworkRequestHeaderParserSpecs.contentLengthHeader]) == "0"
                }
            }
            context("without any header") {
                let requestHeaderDictionary = NetworkRequestHeader().convertToDictionary()
                it("returns dictionary without ifModifiedSince") {
                    expect(requestHeaderDictionary[NetworkRequestHeaderParserSpecs.ifModifiedSinceHeader]).to(beNil())
                }
                it("returns dictionary without ifNoneMatch") {
                    expect(requestHeaderDictionary[NetworkRequestHeaderParserSpecs.ifNoneMatchHeader]).to(beNil())
                }
                it("returns dictionary without contentType") {
                    expect(requestHeaderDictionary[NetworkRequestHeaderParserSpecs.contentTypeHeader]).to(beNil())
                }
                it("returns dictionary without contentLength") {
                    expect(requestHeaderDictionary[NetworkRequestHeaderParserSpecs.contentLengthHeader]).to(beNil())
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

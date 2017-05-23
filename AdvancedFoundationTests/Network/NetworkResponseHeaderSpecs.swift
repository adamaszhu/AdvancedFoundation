class NetworkResponseHeaderSpecs: QuickSpec {
    
    override func spec() {
        describe("calls init(contentType:contentLength:lastModified:eTag)") {
            let networkResponseHeader = NetworkResponseHeader(contentType: "ContentType", contentLength: 1, lastModified: "LastModified", eTag: "ETag")
            it("returns NetworkResponseHeader with correct contentType") {
                expect(networkResponseHeader.contentType) == "ContentType"
            }
            it("returns NetworkResponseHeader with correct contentLength") {
                expect(networkResponseHeader.contentLength) == 1
            }
            it("returns NetworkResponseHeader with correct lastModified") {
                expect(networkResponseHeader.lastModified) == "LastModified"
            }
            it("returns NetworkResponseHeader with correct eTag") {
                expect(networkResponseHeader.eTag) == "ETag"
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

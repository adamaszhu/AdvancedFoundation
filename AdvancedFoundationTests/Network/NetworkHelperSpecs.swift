class NetworkHelperHelperSpecs: QuickSpec {
    
    // FUTUREWORK: Test the cache function
    
    var results: Dictionary<String, NetworkHelperSpecsTask> = [:]
    
    override func spec() {
        let networkHelper = NetworkHelper(identifier: "NetworkHelper")
        networkHelper.networkHelperDelegate = self
        describe("has isNetworkAvailable") {
            it("is true") {
                expect(NetworkHelper.isNetworkAvailable) == true
            }
        }
        describe("calls get(fromURL:with:asDownloadTask)") {
            context("with invalid url") {
                let identifier = networkHelper.get(fromURL: "http://adamaszhu.com:8080/api/invalid")!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives error") {
                    expect(self.results[identifier]?.error).toEventually(beNil())
                }
            }
            context("with valid url") {
                let identifier = networkHelper.get(fromURL: "http://adamaszhu.com:8080/api/test")!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives response") {
                    expect(self.results[identifier]?.header).toEventuallyNot(beNil())
                }
                it("receives data") {
                    expect(self.results[identifier]?.data).toEventuallyNot(beNil())
                }
            }
            context("with valid header") {
                // TODO: Test the header.
            }
            context("with invalid header") {
                // TODO: Test the invalid header.
            }
            context("with task a download task") {
                let identifier = networkHelper.get(fromURL: "http://adamaszhu.com:8080/api/test", asDownloadTask: true)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives percentage") {
                    expect(self.results[identifier]?.percentage).toEventuallyNot(beNil())
                }
                it("receives url") {
                    expect(self.results[identifier]?.url).toEventuallyNot(beNil())
                }
            }
            context("with task a normal task") {
                let identifier = networkHelper.get(fromURL: "http://adamaszhu.com:8080/api/test", asDownloadTask: false)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives response") {
                    expect(self.results[identifier]?.header).toEventuallyNot(beNil())
                }
                it("receives data") {
                    expect(self.results[identifier]?.data).toEventuallyNot(beNil())
                }
            }
        }
        //post(toURL urlString: String, with header: NetworkRequestHeader? = nil, with body: Data, as type: NetworkBodyType, asUploadTask isUploadTask: Bool = false) -> String?
        //post(toURL urlString: String, with header: NetworkRequestHeader? = nil, with formData: FormData, asUploadTask isUploadTask: Bool = false) -> String?
        //
        //delete(atURL urlString: String, with header: NetworkRequestHeader? = nil) -> String?
        //reset()
        //clearCache()
        //clearCache(forURL urlString: String)
        describe("calls findTask(of)") {
            // COMMENT: This has been tested in other tests.
        }
        describe("calls remove(_)") {
            // COMMENT: This has been tested in other tests.
        }
        describe("calls dispatchError(for:withMessage)") {
            // COMMENT: This has been tested in other tests.
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

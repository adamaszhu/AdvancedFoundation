class NetworkHelperHelperSpecs: QuickSpec {

    // FUTUREWORK: Test the cache function
    
    // COMMENT: Change it to server to use real web service.
    let api = APIMocker.mocker
    let invalidAPI = "http://test"
    
    var results: Dictionary<String, NetworkHelperSpecsTask> = [:]

    override func spec() {
        let networkHelper = NetworkHelper(identifier: "NetworkHelper")
        if api == .mocker {
            let urlSessionMocker = URLSessionMocker()
            urlSessionMocker.urlSessionDelegate = networkHelper
            networkHelper.normalSession = urlSessionMocker
            networkHelper.backgroundSession = urlSessionMocker
        }
        networkHelper.networkHelperDelegate = self
        describe("has isNetworkAvailable") {
            it("is true") {
                expect(NetworkHelper.isNetworkAvailable) == true
            }
        }
        describe("has standard") {
            it("is not nil") {
                expect(NetworkHelper.standard).toNot(beNil())
            }
        }
        describe("calls init(identifier:cache)") {
            it("returns object") {
                expect(NetworkHelper(identifier: "ID", cache: URLCache.shared)).toNot(beNil())
            }
        }
        describe("calls get(fromURL:with:asDownloadTask)") {
            context("with valid url and header") {
                let identifier = networkHelper.get(fromURL: api.rawValue, with: APIMocker.mocker.header)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives response") {
                    expect(self.results[identifier]?.header?.eTag) == "Success"
                }
                it("receives data") {
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
            context("with invalid url") {
                let identifier = networkHelper.get(fromURL: invalidAPI, with: APIMocker.mocker.header)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives error") {
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with invalid header") {
                let identifier = networkHelper.get(fromURL: api.rawValue, with: NetworkRequestHeader())!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives error") {
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with a download task") {
                let identifier = networkHelper.get(fromURL: api.rawValue, with: APIMocker.mocker.header, asDownloadTask: true)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives percentage") {
                    expect(self.results[identifier]?.percentage).toEventuallyNot(beNil())
                }
                it("receives url") {
                    expect(self.results[identifier]?.url).toEventuallyNot(beNil())
                }
            }
            context("with a normal task") {
                let identifier = networkHelper.get(fromURL: api.rawValue, with: APIMocker.mocker.header, asDownloadTask: false)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives response") {
                    expect(self.results[identifier]?.header?.eTag) == "Success"
                }
                it("receives data") {
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
        }/*
//         describe("calls post(toURL:with:with:as:asUploadTask)") {
//         context("with invalid url") {
//         let formData = FormData(fields: [])
//         let identifier = networkHelper.post(toURL: invalidURL, with: formData)!
//         results[identifier] = NetworkHelperSpecsTask()
//         it("receives error") {
//         expect(self.results[identifier]?.error).toEventuallyNot(beNil())
//         }
//         }
//         context("with valid url") {
//         let formData = FormData(fields: [])
//         let identifier = networkHelper.post(toURL: validURL, with: formData)!
//         results[identifier] = NetworkHelperSpecsTask()
//         it("receives response") {
//         expect(self.results[identifier]?.header).toEventuallyNot(beNil())
//         }
//         it("receives data") {
//         expect(self.results[identifier]?.data).toEventuallyNot(beNil())
//         }
//         }
//         context("with valid header") {
//         // TODO: Test the header.
//         }
//         context("with invalid header") {
//         // TODO: Test the invalid header.
//         }
//         context("with valid form") {
//         // TODO: Test the form data.
//         }
//         context("with invalid form") {
//         // TODO: Test the invalid form data.
//         }
//         context("with a upload task") {
//         let formData = FormData(fields: [])
//         let identifier = networkHelper.post(toURL: validURL, with: formData, asUploadTask: true)!
//         results[identifier] = NetworkHelperSpecsTask()
//         it("receives response") {
//         expect(self.results[identifier]?.header).toEventuallyNot(beNil())
//         }
//         it("receives data") {
//         expect(self.results[identifier]?.data).toEventuallyNot(beNil())
//         }
//         }
//         context("with a normal task") {
//         let formData = FormData(fields: [])
//         let identifier = networkHelper.post(toURL: validURL, with: formData, asUploadTask: false)!
//         results[identifier] = NetworkHelperSpecsTask()
//         it("receives response") {
//         expect(self.results[identifier]?.header).toEventuallyNot(beNil())
//         }
//         it("receives data") {
//         expect(self.results[identifier]?.data).toEventuallyNot(beNil())
//         }
//         }
//         }
//         describe("calls post(toURL:with:as:with:asUploadTask)") {
//         context("with invalid url") {
//         let identifier = networkHelper.post(toURL: invalidURL, with: Data(), as: .text)!
//         results[identifier] = NetworkHelperSpecsTask()
//         it("receives error") {
//         expect(self.results[identifier]?.error).toEventuallyNot(beNil())
//         }
//         }
//         context("with valid url") {
//         let identifier = networkHelper.post(toURL: validURL, with: Data(), as: .text)!
//         results[identifier] = NetworkHelperSpecsTask()
//         it("receives response") {
//         expect(self.results[identifier]?.header).toEventuallyNot(beNil())
//         }
//         it("receives data") {
//         expect(self.results[identifier]?.data).toEventuallyNot(beNil())
//         }
//         }
//         context("with valid header") {
//         // TODO: Test the header.
//         }
//         context("with invalid header") {
//         // TODO: Test the invalid header.
//         }
//         context("with valid data") {
//         // TODO: Test the form data.
//         }
//         context("with invalid data") {
//         // TODO: Test the invalid form data.
//         }
//         context("with correct type") {
//         // TODO: Test the type.
//         }
//         context("with invalid type") {
//         // TODO: Test the invalid type.
//         }
//         context("with a upload task") {
//         let identifier = networkHelper.post(toURL: validURL, with: Data(), as: .text, asUploadTask: true)!
//         results[identifier] = NetworkHelperSpecsTask()
//         it("receives response") {
//         expect(self.results[identifier]?.header).toEventuallyNot(beNil())
//         }
//         it("receives data") {
//         expect(self.results[identifier]?.data).toEventuallyNot(beNil())
//         }
//         }
//         context("with a normal task") {
//         let identifier = networkHelper.post(toURL: validURL, with: Data(), as: .text, asUploadTask: false)!
//         results[identifier] = NetworkHelperSpecsTask()
//         it("receives response") {
//         expect(self.results[identifier]?.header).toEventuallyNot(beNil())
//         }
//         it("receives data") {
//         expect(self.results[identifier]?.data).toEventuallyNot(beNil())
//         }
//         }
//         }
//         describe("calls delete(atURL:with)") {
//         context("with invalid url") {
//         let identifier = networkHelper.delete(atURL: invalidURL)!
//         results[identifier] = NetworkHelperSpecsTask()
//         it("receives error") {
//         expect(self.results[identifier]?.error).toEventuallyNot(beNil())
//         }
//         }
//         context("with valid url") {
//         let identifier = networkHelper.delete(atURL: validURL)!
//         results[identifier] = NetworkHelperSpecsTask()
//         it("receives response") {
//         expect(self.results[identifier]?.header).toEventuallyNot(beNil())
//         }
//         it("receives data") {
//         expect(self.results[identifier]?.data).toEventuallyNot(beNil())
//         }
//         }
//         context("with valid header") {
//         // TODO: Test the header.
//         }
//         context("with invalid header") {
//         // TODO: Test the invalid header.
//         }
//         }
//         //reset()
//         //clearCache()
//         //clearCache(forURL urlString: String)
         // append(_ data: Data, toCacheOf task: NetworkTask)
//         describe("calls findTask(of)") {
//         // COMMENT: This has been tested in other tests.
//         }
//         describe("calls remove(_)") {
//         // COMMENT: This has been tested in other tests.
//         }
//         describe("calls dispatchError(for:withMessage)") {
//         // COMMENT: This has been tested in other tests.
//         }*/
    }

}

import Quick
import Nimble
@testable import AdvancedFoundation

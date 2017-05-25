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
                let identifier = networkHelper.get(fromURL: api.rawValue, with: api.header)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives response") {
                    expect(self.results[identifier]?.header?.eTag) == "Success"
                }
                it("receives data") {
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
            context("with invalid url") {
                let identifier = networkHelper.get(fromURL: invalidAPI, with: api.header)!
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
            context("with type as a download task") {
                let identifier = networkHelper.get(fromURL: api.rawValue, with: api.header, asDownloadTask: true)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives percentage") {
                    expect(self.results[identifier]?.percentage).toEventuallyNot(beNil())
                }
                it("receives url") {
                    expect(self.results[identifier]?.url).toEventuallyNot(beNil())
                }
            }
            context("with type as a normal task") {
                let identifier = networkHelper.get(fromURL: api.rawValue, with: api.header, asDownloadTask: false)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives response") {
                    expect(self.results[identifier]?.header?.eTag) == "Success"
                }
                it("receives data") {
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
        }
        describe("calls post(toURL:with:with:asUploadTask)") {
            context("with valid url, form data and header") {
                let identifier = networkHelper.post(toURL: api.rawValue, with: api.formData, with: api.header)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives response") {
                    expect(self.results[identifier]?.header?.eTag) == "Success"
                }
                it("receives data") {
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
            context("with invalid url") {
                let identifier = networkHelper.post(toURL: invalidAPI, with: api.formData, with: api.header)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives error") {
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with invalid header") {
                let identifier = networkHelper.post(toURL: api.rawValue, with: api.formData, with: NetworkRequestHeader())!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives error") {
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with invalid form data") {
                let identifier = networkHelper.post(toURL: api.rawValue, with: FormData(fields: []), with: api.header)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives error") {
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with type as an upload task") {
                let identifier = networkHelper.post(toURL: api.rawValue, with: api.formData, with: api.header, asUploadTask: true)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives response") {
                    expect(self.results[identifier]?.header?.eTag) == "Success"
                }
                it("receives data") {
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
            context("with type as a normal task") {
                let identifier = networkHelper.post(toURL: api.rawValue, with: api.formData, with: api.header, asUploadTask: false)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives response") {
                    expect(self.results[identifier]?.header?.eTag) == "Success"
                }
                it("receives data") {
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
        }
        describe("calls post(toURL:with:as:with:asUploadTask)") {
            context("with valid url, body and header") {
                let identifier = networkHelper.post(toURL: api.rawValue, with: api.body, as: .text, with: api.header)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives response") {
                    expect(self.results[identifier]?.header?.eTag) == "Success"
                }
                it("receives data") {
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
            context("with invalid url") {
                let identifier = networkHelper.post(toURL: invalidAPI, with: api.body, as: .text, with: api.header)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives error") {
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with invalid header") {
                let identifier = networkHelper.post(toURL: api.rawValue, with: api.body, as: .text, with: NetworkRequestHeader())!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives error") {
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with invalid body") {
                let identifier = networkHelper.post(toURL: api.rawValue, with: Data(), as: .text, with: api.header)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives error") {
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with type as an upload task") {
                let identifier = networkHelper.post(toURL: api.rawValue, with: api.body, as: .text, with: api.header, asUploadTask: true)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives response") {
                    expect(self.results[identifier]?.header?.eTag) == "Success"
                }
                it("receives data") {
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
            context("with type as a normal task") {
                let identifier = networkHelper.post(toURL: api.rawValue, with: api.body, as: .text, with: api.header, asUploadTask: false)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives response") {
                    expect(self.results[identifier]?.header?.eTag) == "Success"
                }
                it("receives data") {
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
        }
        describe("calls delete(atURL:with)") {
            context("with valid url and header") {
                let identifier = networkHelper.delete(atURL: api.rawValue, with: api.header)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives response") {
                    expect(self.results[identifier]?.header?.eTag) == "Success"
                }
                it("receives data") {
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
            context("with invalid url") {
                let identifier = networkHelper.delete(atURL: invalidAPI, with: api.header)!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives error") {
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with invalid header") {
                let identifier = networkHelper.delete(atURL: api.rawValue, with: NetworkRequestHeader())!
                results[identifier] = NetworkHelperSpecsTask()
                it("receives error") {
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
        }
        describe("calls reset()") {
            _ = networkHelper.get(fromURL: invalidAPI, with: api.header)!
            it("has no task") {
                networkHelper.reset()
                expect(networkHelper.tasks.count) == 0
            }
        }
        describe("calls clearCache()") {
            // TODO: Test the cache function
        }
        describe("calls clearCache(forURL)") {
            // TODO: Test the cache function
        }
        describe("calls append(_:toCacheOf)") {
            // COMMENT: This has been tested in other functions.
        }
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

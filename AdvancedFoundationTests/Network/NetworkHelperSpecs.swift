class NetworkHelperHelperSpecs: QuickSpec {
    
    // FUTUREWORK: Test the cache function
    
    var results = [String: NetworkHelperSpecsTask]()
    
    override func spec() {
        // Change it to server to use real web service.
        let api = APIMocker.mocker
        let invalidAPI = "http://test"
        let networkHelper = NetworkHelper(identifier: "NetworkHelper")
        if api == .mocker {
            let urlSessionMocker = URLSessionMocker()
            urlSessionMocker.urlSessionDelegate = networkHelper
            networkHelper.normalSession = urlSessionMocker
            networkHelper.backgroundSession = urlSessionMocker
        }
        networkHelper.delegate = self
        beforeEach {
            networkHelper.reset()
        }
        describe("has standard") {
            it("is not nil") {
                expect(NetworkHelper.standard).toNot(beNil())
            }
        }
        describe("has isNetworkAvailable") {
            it("is true") {
                expect(networkHelper.isNetworkAvailable) == true
            }
        }
        describe("calls init(identifier:cache)") {
            it("returns object") {
                expect(NetworkHelper(identifier: "ID", cache: URLCache.shared)).toNot(beNil())
            }
        }
        describe("calls get(fromURL:with:asDownloadTask)") {
            context("with valid url and header") {
                it("receives response") {
                    let identifier = networkHelper.getData(fromURL: api.rawValue, with: api.header)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.header?.eTag).toEventually(equal("Success"))
                }
                it("receives data") {
                    let identifier = networkHelper.getData(fromURL: api.rawValue, with: api.header)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
            context("with invalid url") {
                it("receives error") {
                    let identifier = networkHelper.getData(fromURL: invalidAPI, with: api.header)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with invalid header") {
                it("receives error") {
                    let identifier = networkHelper.getData(fromURL: api.rawValue, with: NetworkRequestHeader())!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with type as a download task") {
                it("receives percentage") {
                    let identifier = networkHelper.getData(fromURL: api.rawValue, with: api.header, asDownloadTask: true)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.percentage).toEventuallyNot(beNil())
                }
                it("receives url") {
                    let identifier = networkHelper.getData(fromURL: api.rawValue, with: api.header, asDownloadTask: true)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.url).toEventuallyNot(beNil())
                }
            }
            context("with type as a normal task") {
                it("receives response") {
                    let identifier = networkHelper.getData(fromURL: api.rawValue, with: api.header, asDownloadTask: false)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.header?.eTag).toEventually(equal("Success"))
                }
                it("receives data") {
                    let identifier = networkHelper.getData(fromURL: api.rawValue, with: api.header, asDownloadTask: false)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
        }
        describe("calls post(toURL:with:with:asUploadTask)") {
            context("with valid url, form data and header") {
                it("receives response") {
                    let identifier = networkHelper.postData(toURL: api.rawValue, with: api.formData, with: api.header)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.header?.eTag).toEventually(equal("Success"))
                }
                it("receives data") {
                    let identifier = networkHelper.postData(toURL: api.rawValue, with: api.formData, with: api.header)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
            context("with invalid url") {
                it("receives error") {
                    let identifier = networkHelper.postData(toURL: invalidAPI, with: api.formData, with: api.header)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with invalid header") {
                it("receives error") {
                    let identifier = networkHelper.postData(toURL: api.rawValue, with: api.formData, with: NetworkRequestHeader())!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with invalid form data") {
                it("receives error") {
                    let identifier = networkHelper.postData(toURL: api.rawValue, with: FormData(fields: []), with: api.header)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with type as an upload task") {
                it("receives response") {
                    let identifier = networkHelper.postData(toURL: api.rawValue, with: api.formData, with: api.header, asUploadTask: true)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.header?.eTag).toEventually(equal("Success"))
                }
                it("receives data") {
                    let identifier = networkHelper.postData(toURL: api.rawValue, with: api.formData, with: api.header, asUploadTask: true)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
            context("with type as a normal task") {
                it("receives response") {
                    let identifier = networkHelper.postData(toURL: api.rawValue, with: api.formData, with: api.header, asUploadTask: false)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.header?.eTag).toEventually(equal("Success"))
                }
                it("receives data") {
                    let identifier = networkHelper.postData(toURL: api.rawValue, with: api.formData, with: api.header, asUploadTask: false)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
        }
        describe("calls post(toURL:with:as:with:asUploadTask)") {
            context("with valid url, body and header") {
                it("receives response") {
                    let identifier = networkHelper.postData(toURL: api.rawValue, with: api.body, as: .text, with: api.header)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.header?.eTag).toEventually(equal("Success"))
                }
                it("receives data") {
                    let identifier = networkHelper.postData(toURL: api.rawValue, with: api.body, as: .text, with: api.header)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
            context("with invalid url") {
                it("receives error") {
                    let identifier = networkHelper.postData(toURL: invalidAPI, with: api.body, as: .text, with: api.header)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with invalid header") {
                it("receives error") {
                    let identifier = networkHelper.postData(toURL: api.rawValue, with: api.body, as: .text, with: NetworkRequestHeader())!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with invalid body") {
                it("receives error") {
                    let identifier = networkHelper.postData(toURL: api.rawValue, with: Data(), as: .text, with: api.header)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with type as an upload task") {
                it("receives response") {
                    let identifier = networkHelper.postData(toURL: api.rawValue, with: api.body, as: .text, with: api.header, asUploadTask: true)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.header?.eTag).toEventually(equal("Success"))
                }
                it("receives data") {
                    let identifier = networkHelper.postData(toURL: api.rawValue, with: api.body, as: .text, with: api.header, asUploadTask: true)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
            context("with type as a normal task") {
                it("receives response") {
                    let identifier = networkHelper.postData(toURL: api.rawValue, with: api.body, as: .text, with: api.header, asUploadTask: false)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.header?.eTag).toEventually(equal("Success"))
                }
                it("receives data") {
                    let identifier = networkHelper.postData(toURL: api.rawValue, with: api.body, as: .text, with: api.header, asUploadTask: false)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
        }
        describe("calls delete(atURL:with)") {
            context("with valid url and header") {
                it("receives response") {
                    let identifier = networkHelper.deleteData(atURL: api.rawValue, with: api.header)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.header?.eTag).toEventually(equal("Success"))
                }
                it("receives data") {
                    let identifier = networkHelper.deleteData(atURL: api.rawValue, with: api.header)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.data?.count).toEventually(equal("Success".data(using: .utf8)?.count))
                }
            }
            context("with invalid url") {
                it("receives error") {
                    let identifier = networkHelper.deleteData(atURL: invalidAPI, with: api.header)!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
            context("with invalid header") {
                it("receives error") {
                    let identifier = networkHelper.deleteData(atURL: api.rawValue, with: NetworkRequestHeader())!
                    self.results[identifier] = NetworkHelperSpecsTask()
                    expect(self.results[identifier]?.error).toEventuallyNot(beNil())
                }
            }
        }
        describe("calls reset()") {
            it("has no task") {
                _ = networkHelper.getData(fromURL: invalidAPI, with: api.header)!
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
            // This has been tested in other functions.
        }
        describe("calls findTask(of)") {
            // This has been tested in other tests.
        }
        describe("calls remove(_)") {
            // This has been tested in other tests.
        }
        describe("calls dispatchError(for:withMessage)") {
            // This has been tested in other tests.
        }
    }
}

import Foundation
import Quick
import Nimble
@testable import AdvancedFoundation

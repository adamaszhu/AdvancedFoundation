class NetworkTaskSpecs: QuickSpec {
    
    override func spec() {
        let identifier = IDGeneratorMocker().uniqueID
        let cache = Data()
        describe("calls init(task:idGenerator:cache)") {
            context("with download task") {
                let downloadTask = NetworkTask(task: URLSessionDownloadTask(), identifier: identifier, cache: cache)
                it("returns task with download type") {
                    expect(downloadTask.type == .download) == true
                }
                it("returns task with correct id") {
                    expect(downloadTask.identifier) == "ID"
                }
                it("returns task with empty cache") {
                    expect(downloadTask.cache.count) == 0
                }
                it("returns task with correct session task") {
                    expect(downloadTask.task is URLSessionDownloadTask) == true
                }
            }
            context("with upload task") {
                let uploadTask = NetworkTask(task: URLSessionUploadTask(), identifier: identifier, cache: cache)
                it("returns task with upload type") {
                    expect(uploadTask.type == .upload) == true
                }
                it("returns task with correct id") {
                    expect(uploadTask.identifier) == "ID"
                }
                it("returns task with empty cache") {
                    expect(uploadTask.cache.count) == 0
                }
                it("returns task with correct session task") {
                    expect(uploadTask.task is URLSessionUploadTask) == true
                }
            }
            context("with stream task") {
                let streamTask = NetworkTask(task: URLSessionStreamTask(), identifier: identifier, cache: cache)
                it("returns task with stream type") {
                    expect(streamTask.type == .stream) == true
                }
                it("returns task with unique id") {
                    expect(streamTask.identifier) == "ID"
                }
                it("returns task with empty cache") {
                    expect(streamTask.cache.count) == 0
                }
                it("returns task with correct session task") {
                    expect(streamTask.task is URLSessionStreamTask) == true
                }
            }
            context("with data task") {
                let dataTask = NetworkTask(task: URLSessionDataTask(), identifier: identifier, cache: cache)
                it("returns task with data type") {
                    expect(dataTask.type == .data) == true
                }
                it("returns task with unique id") {
                    expect(dataTask.identifier) == "ID"
                }
                it("returns task with empty cache") {
                    expect(dataTask.cache.count) == 0
                }
                it("returns task with correct session task") {
                    expect(dataTask.task is URLSessionDataTask) == true
                }
            }
            context("with any task") {
                let task = NetworkTask(task: URLSessionTask(), identifier: identifier, cache: cache)
                it("returns task with data type") {
                    expect(task.type == .data) == true
                }
                it("returns task with unique id") {
                    expect(task.identifier) == "ID"
                }
                it("returns task with empty cache") {
                    expect(task.cache.count) == 0
                }
            }
        }
        describe("calls append(_)") {
            var task = NetworkTask(task: URLSessionTask(), identifier: identifier, cache: cache)
            task.append("Test".data(using: .utf8)!)
            it("has new cached") {
                expect(String(data: task.cache, encoding: .utf8)) == "Test"
            }
        }
        describe("calls cancel()") {
            // The result is not noticeable.
        }
    }
}

import Foundation
import Quick
import Nimble
@testable import AdvancedFoundation

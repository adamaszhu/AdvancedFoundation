class NetworkTaskSpecs: QuickSpec {
    
    override func spec() {
        describe("calls init(task)") {
            let downloadTask = NetworkTask(task: URLSessionDownloadTask())
            let uploadTask = NetworkTask(task: URLSessionUploadTask())
            let streamTask = NetworkTask(task: URLSessionStreamTask())
            let dataTask = NetworkTask(task: URLSessionDataTask())
            let task = NetworkTask(task: URLSessionTask())
            context("with download task") {
                it("returns task with download type") {
                    expect(downloadTask.type == .download) == true
                }
                it("returns task with unique id") {
                    expect(downloadTask.identifier) != uploadTask.identifier
                }
                it("returns task with empty cache") {
                    expect(downloadTask.cache.count) == 0
                }
                it("returns task with correct session task") {
                    expect(downloadTask.task is URLSessionDownloadTask) == true
                }
            }
            context("with upload task") {
                it("returns task with upload type") {
                    expect(uploadTask.type == .upload) == true
                }
                it("returns task with unique id") {
                    expect(uploadTask.identifier) != streamTask.identifier
                }
                it("returns task with empty cache") {
                    expect(uploadTask.cache.count) == 0
                }
                it("returns task with correct session task") {
                    expect(uploadTask.task is URLSessionUploadTask) == true
                }
            }
            context("with stream task") {
                it("returns task with stream type") {
                    expect(streamTask.type == .stream) == true
                }
                it("returns task with unique id") {
                    expect(streamTask.identifier) != dataTask.identifier
                }
                it("returns task with empty cache") {
                    expect(streamTask.cache.count) == 0
                }
                it("returns task with correct session task") {
                    expect(streamTask.task is URLSessionStreamTask) == true
                }
            }
            context("with data task") {
                it("returns task with data type") {
                    expect(dataTask.type == .data) == true
                }
                it("returns task with unique id") {
                    expect(dataTask.identifier) != task.identifier
                }
                it("returns task with empty cache") {
                    expect(dataTask.cache.count) == 0
                }
                it("returns task with correct session task") {
                    expect(dataTask.task is URLSessionDataTask) == true
                }
            }
            context("with any task") {
                it("returns task with data type") {
                    expect(task.type == .data) == true
                }
                it("returns task with unique id") {
                    expect(task.identifier) != downloadTask.identifier
                }
                it("returns task with empty cache") {
                    expect(task.cache.count) == 0
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

class NetworkTaskEquatableSpecs: QuickSpec {
    
    override func spec() {
        describe("uses ==") {
            let idGenerator = IDGenerator.standard
            let cache = Data()
            let firstTask = NetworkTask(task: URLSessionTask(), identifier: idGenerator.uniqueID, cache: cache)
            let secondTask = NetworkTask(task: URLSessionTask(), identifier: idGenerator.uniqueID, cache: cache)
            context("with equal tasks") {
                it("returns true") {
                    expect(firstTask == firstTask) == true
                }
            }
            context("with non equal tasks") {
                it("returns false") {
                    expect(firstTask == secondTask) == false
                }
            }
        }
    }
}

import Foundation
import Quick
import Nimble
@testable import AdvancedFoundation

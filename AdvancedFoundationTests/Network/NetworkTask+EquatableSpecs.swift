class NetworkTaskEquatableSpecs: QuickSpec {
    
    override func spec() {
        describe("uses ==") {
            let firstTask = NetworkTask(with: URLSessionTask())
            let secondTask = NetworkTask(with: URLSessionTask())
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

import Quick
import Nimble
@testable import AdvancedFoundation

class ArrayMutableSpecs: QuickSpec {

    override func spec() {
        let nonDuplicatedArray = ["First", "Second", "Third"]
        let duplicatedArray = ["First", "Second", "Third", "Second", "First"]
        describe("calls removeDuplicates()") {
            context("with duplicates") {
                it("returns array with no duplicates") {
                    var array = duplicatedArray
                    array.removeDuplicates()
                    expect(array) == nonDuplicatedArray
                }
            }
            context("without duplicates") {
                it("returns array with no duplicates") {
                    var array = nonDuplicatedArray
                    array.removeDuplicates()
                    expect(array) == nonDuplicatedArray
                }
            }
        }
        describe("calls removingDuplicates()") {
            context("with duplicates") {
                it("returns array with no duplicates") {
                    let array = duplicatedArray.removingDuplicates()
                    expect(array) == nonDuplicatedArray
                }
            }
            context("without duplicates") {
                it("returns array with no duplicates") {
                    let array = nonDuplicatedArray.removingDuplicates()
                    expect(array) == nonDuplicatedArray
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation

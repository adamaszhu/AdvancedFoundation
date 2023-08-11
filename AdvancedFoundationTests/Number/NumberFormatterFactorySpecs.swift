final class NumberFormatterFactorySpecs: QuickSpec {

    private let number = NSNumber(value: 1)

    override func spec() {
        describe("calls currencyFormatter(for)") {
            let currencyFormatter = NumberFormatterFactory.currencyFormatter(for: .mandarin)
            context("for mandarin") {
                it("returns a correct number formatter") {
                    expect(currencyFormatter.string(from: self.number)) == "¥1.00"
                }
            }
            context("for english") {
                let currencyFormatter = NumberFormatterFactory.currencyFormatter(for: .english)
                it("returns a correct number formatter") {
                    expect(currencyFormatter.string(from: self.number)) == "$1.00"
                }
            }
        }
    }
}

import Nimble
import Quick
import Foundation
@testable import AdvancedFoundation

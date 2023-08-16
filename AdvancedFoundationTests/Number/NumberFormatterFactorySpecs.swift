final class NumberFormatterFactorySpecs: QuickSpec {

    override func spec() {
        describe("calls currencyFormatter(for)") {
            let number = NSNumber(value: 1)
            context("for mandarin") {
                let currencyFormatter = NumberFormatterFactory.currencyFormatter(for: .mandarin)
                it("returns a correct number formatter") {
                    expect(currencyFormatter.string(from: number)) == "¥1.00"
                }
            }
            context("for english") {
                let currencyFormatter = NumberFormatterFactory.currencyFormatter(for: .english)
                it("returns a correct number formatter") {
                    expect(currencyFormatter.string(from: number)) == "$1.00"
                }
            }
        }
        describe("calls decimalFormatter()") {
            let decimalFormatter = NumberFormatterFactory.decimalFormatter()
            context("with long number") {
                it("returns a correct number formatter") {
                    let number = NSNumber(value: 10000.5)
                    expect(decimalFormatter.string(from: number)) == "10,000.5"
                }
            }
            context("with short number") {
                let number = NSNumber(value: 1.5)
                expect(decimalFormatter.string(from: number)) == "1.5"
            }
        }
    }
}

import Nimble
import Quick
import Foundation
@testable import AdvancedFoundation

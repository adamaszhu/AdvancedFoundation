final class PercentageSpecs: QuickSpec {

    override func spec() {
        describe("has the projected value") {
            context("with a lower precision value") {
                var percentageMocker = PercentageMocker()
                percentageMocker.percentage = 0.5555
                it("returns a percentage string") {
                    expect(percentageMocker.$percentage) == "55.55%"
                }
            }
            context("with a higher precision") {
                var percentageMocker = PercentageMocker()
                percentageMocker.percentage = 0.55555555555
                it("returns a percentage string") {
                    expect(percentageMocker.$percentage) == "55.555%"
                }
            }
        }
    }
}

fileprivate struct PercentageMocker {
    @Percentage(precision: 3)
    var percentage: Double = 0
}

import Nimble
import Quick
@testable import AdvancedFoundation

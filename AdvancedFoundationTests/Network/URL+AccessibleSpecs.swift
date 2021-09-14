class URLAccessibleSpecs: QuickSpec {
    
    override func spec() {
        describe("has parameters") {
            let basePath = "https://host.com"
            context("with parameters") {
                let url = URL(string: basePath + "?parameter1=value1")!
                it("returns the parameter") {
                    expect(url.parameters) == ["parameter1": "value1"]
                }
            }
            context("without parameters") {
                let url = URL(string: basePath)!
                it("returns nil") {
                    expect(url.parameters).to(beNil())
                }
            }
        }
    }
}

import Foundation
import Quick
import Nimble
@testable import AdvancedFoundation

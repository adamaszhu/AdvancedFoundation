class UserDefaultsAccessable: QuickSpec {
    
    override func spec() {
        describe("set a subscription") {
            context("with an existing value") {
                let userDefaults = UserDefaults(suiteName: "1")
                userDefaults?["key"] = "value1"
                it("overrides the value") {
                    userDefaults?["key"] = "value"
                    let value: String? = userDefaults?["key"]
                    expect(value) == "value"
                }
            }
            context("with an existing value but a different type") {
                let userDefaults = UserDefaults(suiteName: "2")
                userDefaults?["key"] = 0
                it("overrides the value") {
                    userDefaults?["key"] = "value"
                    let value: String? = userDefaults?["key"]
                    expect(value) == "value"
                }
            }
            context("without an existing value") {
                let userDefaults = UserDefaults(suiteName: "3")
                it("writes the value") {
                    userDefaults?["key"] = "value"
                    let value: String? = userDefaults?["key"]
                    expect(value) == "value"
                }
            }
        }
        describe("get a subscription") {
            context("with an existing value") {
                let userDefaults = UserDefaults(suiteName: "4")
                userDefaults?["key"] = "value"
                it("returns the value") {
                    let value: String? = userDefaults?["key"]
                    expect(value) == "value"
                }
            }
            context("with an existing value but a different type") {
                let userDefaults = UserDefaults(suiteName: "5")
                userDefaults?["key"] = 0
                it("returns nil") {
                    let value: String? = userDefaults?["key"]
                    expect(value).to(beNil())
                }
            }
            context("without an existing value") {
                let userDefaults = UserDefaults(suiteName: "6")
                it("returns nil") {
                    let value: String? = userDefaults?["key"]
                    expect(value).to(beNil())
                }
            }
        }
    }
}

import Foundation
import Quick
import Nimble
@testable import AdvancedFoundation

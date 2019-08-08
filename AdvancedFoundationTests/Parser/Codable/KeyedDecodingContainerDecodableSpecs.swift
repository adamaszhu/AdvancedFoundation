class KeyedDecodingContainerDecodableSpecs: QuickSpec {
    
    override func spec() {
        describe("calls decodeArrayIfPresent(for)") {
            context("with the key") {
                let jsonString = """
{\"attribute1\":\"value1\",
\"attribute2\":[{\"arrayAttribute1\":\"arrayValue1\"},{\"arrayAttribute2\":\"arrayValue2\"}],
\"attribute3\":0,
\"attribute4\":{\"subAttribute1\":\"subValue1\"}}
"""
                let data = jsonString.data(using: .utf8)!
                let json = try? JSONDecoder().decode(JSON.self, from: data)
                it("parses the attribute") {
                    expect(json?.attribute2?.count) == 2
                }
            }
            context("without the key") {
                let jsonString = """
{\"attribute1\":\"value1\",
\"attribute3\":0,
\"attribute4\":{\"subAttribute1\":\"subValue1\"}}
"""
                let data = jsonString.data(using: .utf8)!
                let json = try? JSONDecoder().decode(JSON.self, from: data)
                it("parses the attribute as nil") {
                    expect(json).toNot(beNil())
                    expect(json?.attribute2).to(beNil())
                }
            }
            context("with an incorrect key") {
                let jsonString = """
{\"attribute1\":\"value1\",
\"attribute2\":0,
\"attribute3\":0,
\"attribute4\":{\"subAttribute1\":\"subValue1\"}}
"""
                let data = jsonString.data(using: .utf8)!
                let json = try? JSONDecoder().decode(JSON.self, from: data)
                it("parses the attribute as nil") {
                    expect(json).toNot(beNil())
                    expect(json?.attribute2).to(beNil())
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation

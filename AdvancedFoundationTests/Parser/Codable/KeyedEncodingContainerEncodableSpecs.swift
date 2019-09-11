class KeyedEncodingContainerDecodableSpecs: QuickSpec {
    
    override func spec() {
        describe("calls encode(_:for)") {
            context("for string values") {
                context("with the key") {
                    let json = JSON(attribute1: "value1", attribute2: [])
                    let data = try? JSONEncoder().encode(json)
                    let jsonString = String(data: data ?? Data(), encoding: .utf8)
                    it("parses the attribute") {
                        expect(jsonString) == "{\"attribute1\":\"value1\",\"attribute2\":[]}"
                    }
                }
                context("without the key") {
                    let json = JSON(attribute2: [])
                    let data = try? JSONEncoder().encode(json)
                    let jsonString = String(data: data ?? Data(), encoding: .utf8)
                    it("parses the attribute as null") {
                        expect(jsonString) == "{\"attribute1\":null,\"attribute2\":[]}"
                    }
                }
            }
        }
        describe("calls encodeIfPresent(_:for)") {
            context("for string values") {
                context("with the key") {
                    let json = OptionalJSON(attribute1: "value1")
                    let data = try? JSONEncoder().encode(json)
                    let jsonString = String(data: data ?? Data(), encoding: .utf8)
                    it("parses the attribute") {
                        expect(jsonString) == "{\"attribute1\":\"value1\"}"
                    }
                }
                context("without the key") {
                    let json = OptionalJSON()
                    let data = try? JSONEncoder().encode(json)
                    let jsonString = String(data: data ?? Data(), encoding: .utf8)
                    it("encodes nothing") {
                        expect(jsonString) == "{}"
                    }
                }
            }
            context("for double values") {
                context("with the key") {
                    let json = OptionalJSON(attribute3: 0)
                    let data = try? JSONEncoder().encode(json)
                    let jsonString = String(data: data ?? Data(), encoding: .utf8)
                    it("encodes the attribute") {
                        expect(jsonString) == "{\"attribute3\":0}"
                    }
                }
            }
            context("for dictionary values") {
                context("with the key") {
                    let json = OptionalJSON(attribute4: ["subAttribute1":"subValue1"])
                    let data = try? JSONEncoder().encode(json)
                    let jsonString = String(data: data ?? Data(), encoding: .utf8)
                    it("parses the attribute") {
                        expect(jsonString) == "{\"attribute4\":{\"subAttribute1\":\"subValue1\"}}"
                    }
                }
            }
            context("for bool values") {
                context("with the key") {
                    let json = OptionalJSON(attribute5: true)
                    let data = try? JSONEncoder().encode(json)
                    let jsonString = String(data: data ?? Data(), encoding: .utf8)
                    it("parses the attribute") {
                        expect(jsonString) == "{\"attribute5\":true}"
                    }
                }
            }
        }
        describe("calls encodeArray(_:for)") {
            context("with the key") {
                let json = JSON(attribute1: "value1", attribute2: [["arrayAttribute1":"arrayValue1"],["arrayAttribute2":"arrayValue2"]])
                let data = try? JSONEncoder().encode(json)
                let jsonString = String(data: data ?? Data(), encoding: .utf8)
                it("parses the attribute") {
                    expect(jsonString) == "{\"attribute1\":\"value1\",\"attribute2\":[{\"arrayAttribute1\":\"arrayValue1\"},{\"arrayAttribute2\":\"arrayValue2\"}]}"
                }
            }
            context("without the key") {
                let json = JSON(attribute1: "value1")
                let data = try? JSONEncoder().encode(json)
                let jsonString = String(data: data ?? Data(), encoding: .utf8)
                it("parses the attribute as null") {
                    expect(jsonString) == "{\"attribute1\":\"value1\",\"attribute2\":null}"
                }
            }
        }
        describe("calls encodeArrayIfPresent(_:for)") {
            context("with the key") {
                let json = OptionalJSON(attribute2: [["arrayAttribute1":"arrayValue1"],["arrayAttribute2":"arrayValue2"]])
                let data = try? JSONEncoder().encode(json)
                let jsonString = String(data: data ?? Data(), encoding: .utf8)
                it("parses the attribute") {
                    expect(jsonString) == "{\"attribute2\":[{\"arrayAttribute1\":\"arrayValue1\"},{\"arrayAttribute2\":\"arrayValue2\"}]}"
                }
            }
            context("without the key") {
                let json = OptionalJSON()
                let data = try? JSONEncoder().encode(json)
                let jsonString = String(data: data ?? Data(), encoding: .utf8)
                it("encodes nothing") {
                    expect(jsonString) == "{}"
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation

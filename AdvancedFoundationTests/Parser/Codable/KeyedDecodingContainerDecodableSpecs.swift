class KeyedDecodingContainerDecodableSpecs: QuickSpec {
    
    override func spec() {
        describe("calls decodeArrayIfPresent(for)") {
            context("for string values") {
                context("with the key") {
                    let jsonString = "{\"attribute1\":\"value1\"}"
                    let data = jsonString.data(using: .utf8)!
                    let json = try? JSONDecoder().decode(JSON.self, from: data)
                    it("parses the attribute") {
                        expect(json?.attribute1) == "value1"
                    }
                }
                context("without the key") {
                    let jsonString = "{}"
                    let data = jsonString.data(using: .utf8)!
                    let json = try? JSONDecoder().decode(JSON.self, from: data)
                    it("parses the attribute as nil") {
                        expect(json).toNot(beNil())
                        expect(json?.attribute1).to(beNil())
                    }
                }
                context("with an incorrect key") {
                    let jsonString = "{\"attribute1\":0}"
                    let data = jsonString.data(using: .utf8)!
                    let action = {
                        try JSONDecoder().decode(JSON.self, from: data)
                    }
                    it("parses the attribute with exception") {
                        expectException(in: action)
                    }
                }
            }
            context("with the key") {
                let jsonString = "{\"attribute2\":[{\"arrayAttribute1\":\"arrayValue1\"},{\"arrayAttribute2\":\"arrayValue2\"}]}"
                let data = jsonString.data(using: .utf8)!
                let json = try? JSONDecoder().decode(JSON.self, from: data)
                it("parses the attribute") {
                    expect(json?.attribute2?.count) == 2
                }
            }
            context("without the key") {
                let jsonString = "{}"
                let data = jsonString.data(using: .utf8)!
                let json = try? JSONDecoder().decode(JSON.self, from: data)
                it("parses the attribute as nil") {
                    expect(json).toNot(beNil())
                    expect(json?.attribute2).to(beNil())
                }
            }
            context("with an incorrect key") {
                let jsonString = "{\"attribute2\":0}"
                let data = jsonString.data(using: .utf8)!
                let json = try? JSONDecoder().decode(JSON.self, from: data)
                it("parses the attribute as nil") {
                    expect(json).toNot(beNil())
                    expect(json?.attribute2).to(beNil())
                }
            }
        }
        describe("calls decodeIfPresent(for)") {
            context("for double values") {
                context("with the key") {
                    let jsonString = "{\"attribute3\":0}"
                    let data = jsonString.data(using: .utf8)!
                    let json = try? JSONDecoder().decode(JSON.self, from: data)
                    it("parses the attribute") {
                        expect(json?.attribute3) == 0
                    }
                }
                context("without the key") {
                    let jsonString = "{}"
                    let data = jsonString.data(using: .utf8)!
                    let json = try? JSONDecoder().decode(JSON.self, from: data)
                    it("parses the attribute as nil") {
                        expect(json).toNot(beNil())
                        expect(json?.attribute3).to(beNil())
                    }
                }
                context("with an incorrect key") {
                    let jsonString = "{\"attribute3\":\"value3\"}"
                    let data = jsonString.data(using: .utf8)!
                    let action = {
                        try JSONDecoder().decode(JSON.self, from: data)
                    }
                    it("parses the attribute with exception") {
                        expectException(in: action)
                    }
                }
            }
            context("for dictionary values") {
                context("with the key") {
                    let jsonString = "{\"attribute4\":{\"subAttribute1\":\"subValue1\"}}"
                    let data = jsonString.data(using: .utf8)!
                    let json = try? JSONDecoder().decode(JSON.self, from: data)
                    it("parses the attribute") {
                        expect(json?.attribute4?.keys.count) == 1
                    }
                }
                context("without the key") {
                    let jsonString = "{}"
                    let data = jsonString.data(using: .utf8)!
                    let json = try? JSONDecoder().decode(JSON.self, from: data)
                    it("parses the attribute as nil") {
                        expect(json).toNot(beNil())
                        expect(json?.attribute4).to(beNil())
                    }
                }
                context("with an incorrect key") {
                    let jsonString = "{\"attribute4\":0}"
                    let data = jsonString.data(using: .utf8)!
                    let action = {
                        try JSONDecoder().decode(JSON.self, from: data)
                    }
                    it("parses the attribute with exception") {
                        expectException(in: action)
                    }
                }
            }
            context("for bool values") {
                context("with the key") {
                    let jsonString = "{\"attribute5\":true}"
                    let data = jsonString.data(using: .utf8)!
                    let json = try? JSONDecoder().decode(JSON.self, from: data)
                    it("parses the attribute") {
                        expect(json?.attribute5) == true
                    }
                }
                context("without the key") {
                    let jsonString = "{}"
                    let data = jsonString.data(using: .utf8)!
                    let json = try? JSONDecoder().decode(JSON.self, from: data)
                    it("parses the attribute as nil") {
                        expect(json).toNot(beNil())
                        expect(json?.attribute5).to(beNil())
                    }
                }
                context("with an incorrect key") {
                    let jsonString = "{\"attribute5\":0}"
                    let data = jsonString.data(using: .utf8)!
                    let action = {
                        try JSONDecoder().decode(JSON.self, from: data)
                    }
                    it("parses the attribute with exception") {
                        expectException(in: action)
                    }
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation

class JSONParserSpecs: QuickSpec {
    
    override func spec() {
        let json = "{\"attribute1\":\"value1\",\"attribute2\":[{\"arrayAttribute1\":\"arrayValue1\"},{\"arrayAttribute2\":\"arrayValue2\"}],\"attribute3\":0,\"attribute4\":{\"subattribute1\":\"subvalue1\"}}"
        let jsonParser = JSONParser(withString: json)
        describe("calls init(withString)") {
            context("with valid string") {
                it("returns parser with json") {
                    expect(jsonParser.getDictionary(atPath: ".")).notTo(beNil())
                }
            }
            context("with invalid string") {
                let jsonParser = JSONParser(withString: "test")
                it("returns parser with empty json") {
                    expect(jsonParser.getDictionary(atPath: ".")).to(beNil())
                }
            }
        }
        describe("calls init(withData)") {
            context("with valid data") {
                let jsonParser = JSONParser(withData: json.data(using: .utf8)!)
                it("returns parser with json") {
                    expect(jsonParser.getDictionary(atPath: ".")).notTo(beNil())
                }
            }
            context("with invalid data") {
                let jsonParser = JSONParser(withData: "test".data(using: .utf8)!)
                it("returns parser with empty json") {
                    expect(jsonParser.getDictionary(atPath: ".")).to(beNil())
                }
            }
        }
        describe("calls getString(atPath:fromNode)") {
            context("with incorrect path") {
                it("returns nil") {
                    expect(jsonParser.getDictionary(atPath: "////")).to(beNil())
                }
            }
            context("with correct path but wrong type") {
                
            }
            context("with correct absolute path and correct type") {
                
            }
            context("with correct relative path and correct type") {
                
            }
            context("with default node") {
                
            }
            context("with invalid node") {
                
            }
            context("with correct absolute path, correct type and node") {
                
            }
            context("with correct relative path, correct type and node") {
                
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation




//
//    func testGetString() {
//        var string = jsonParser.getString(atPath: "attribute2")
//        XCTAssertNil(string)
//        string = jsonParser.getString(atPath: "attribute5")
//        XCTAssertNil(string)
//        // COMMENT: Get the first segment.
//        string = jsonParser.getString(atPath: "")
//        XCTAssertNil(string)
//        string = jsonParser.getString(atPath: "/")
//        XCTAssertNil(string)
//        string = jsonParser.getString(atPath: "/attribute1")
//        XCTAssertEqual(string, "value1")
//        string = jsonParser.getString(atPath: "attribute4/subattribute1")
//        XCTAssertEqual(string, "subvalue1")
//        // COMMENT: Array case.
//        string = jsonParser.getString(atPath: "attribute2[2]")
//        XCTAssertNil(string)
//        string = jsonParser.getString(atPath: "attribute2[0]")
//        XCTAssertNil(string)
//        string = jsonParser.getString(atPath: "attribute2[0]/arrayAttribute1")
//        XCTAssertEqual(string, "arrayValue1")
//        // COMMENT: Normal case.
//        string = jsonParser.getString(atPath: "attribute4/subattribute1")
//        XCTAssertEqual(string, "subvalue1")
//        // COMMENT: Array element.
//        string = jsonParser.getString(atPath: "attribute1[0]")
//        XCTAssertNil(string)
//        // COMMENT: Invalid element.
//        string = jsonParser.getString(atPath: "attribute2/arrayAttribute1")
//        XCTAssertNil(string)
//    }
//
//    func testGetArray() {
//        var array = jsonParser.getArray(atPath: "attribute1")
//        XCTAssertNil(array)
//        array = jsonParser.getArray(atPath: "attribute5")
//        XCTAssertNil(array)
//        // COMMENT: Get the first segment.
//        array = jsonParser.getArray(atPath: "")
//        XCTAssertNil(array)
//        array = jsonParser.getArray(atPath: "/")
//        XCTAssertNil(array)
//        array = jsonParser.getArray(atPath: "/attribute1")
//        XCTAssertNil(array)
//        array = jsonParser.getArray(atPath: "attribute4/subattribute1")
//        XCTAssertNil(array)
//        // COMMENT: Array case.
//        array = jsonParser.getArray(atPath: "attribute2[2]")
//        XCTAssertNil(array)
//        array = jsonParser.getArray(atPath: "attribute2[0]")
//        XCTAssertNil(array)
//        array = jsonParser.getArray(atPath: "attribute2[0]/arrayAttribute1")
//        XCTAssertNil(array)
//        // COMMENT: Normal case.
//        array = jsonParser.getArray(atPath: "attribute4/subattribute1")
//        XCTAssertNil(array)
//        // COMMENT: Array element.
//        array = jsonParser.getArray(atPath: "attribute1[0]")
//        XCTAssertNil(array)
//        // COMMENT: Invalid element.
//        array = jsonParser.getArray(atPath: "attribute2")
//        XCTAssertNil(array)
//        array = jsonParser.getArray(atPath: "attribute2/arrayAttribute1")
//        XCTAssertNil(array)
//    }
//
//    func testGetDouble() {
//        var d = jsonParser.getDouble(atPath: "attribute2")
//        XCTAssertNil(d)
//        d = jsonParser.getDouble(atPath: "attribute3")
//        XCTAssertEqual(d, 0)
//        d = jsonParser.getDouble(atPath: "attribute5")
//        XCTAssertNil(d)
//        // COMMENT: Get the first segment.
//        d = jsonParser.getDouble(atPath: "")
//        XCTAssertNil(d)
//        d = jsonParser.getDouble(atPath: "/")
//        XCTAssertNil(d)
//        d = jsonParser.getDouble(atPath: "/attribute1")
//        XCTAssertNil(d)
//        d = jsonParser.getDouble(atPath: "attribute4/subattribute1")
//        XCTAssertNil(d)
//        // COMMENT: Array case.
//        d = jsonParser.getDouble(atPath: "attribute2[2]")
//        XCTAssertNil(d)
//        d = jsonParser.getDouble(atPath: "attribute2[0]")
//        XCTAssertNil(d)
//        d = jsonParser.getDouble(atPath: "attribute2[0]/arrayAttribute1")
//        XCTAssertNil(d)
//        // COMMENT: Normal case.
//        d = jsonParser.getDouble(atPath: "attribute4/subattribute1")
//        XCTAssertNil(d)
//        // COMMENT: Array element.
//        d = jsonParser.getDouble(atPath: "attribute1[0]")
//        XCTAssertNil(d)
//        // COMMENT: Invalid element.
//        d = jsonParser.getDouble(atPath: "attribute2/arrayAttribute1")
//        XCTAssertNil(d)
//    }
//}

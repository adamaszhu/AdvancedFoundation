class JSONParserSpecs: QuickSpec {
    
    override func spec() {
        let json = "{\"attribute1\":\"value1\",\"attribute2\":[{\"arrayAttribute1\":\"arrayValue1\"},{\"arrayAttribute2\":\"arrayValue2\"}],\"attribute3\":0,\"attribute4\":{\"subAttribute1\":\"subValue1\"}}"
        let jsonParser = JSONParser(string: json)!
        let currentNode = jsonParser.dictionary(atPath: ".")
        describe("calls init(string)") {
            context("with valid string") {
                it("returns parser with json") {
                    expect(jsonParser.dictionary(atPath: ".")).notTo(beNil())
                }
            }
            context("with invalid string") {
                let jsonParser = JSONParser(string: "test")
                it("returns parser with empty json") {
                    expect(jsonParser).to(beNil())
                }
            }
        }
        describe("calls init(data)") {
            context("with valid data") {
                let jsonParser = JSONParser(data: json.data(using: .utf8)!)!
                it("returns parser with json") {
                    expect(jsonParser.dictionary(atPath: ".")).notTo(beNil())
                }
            }
            context("with invalid data") {
                let jsonParser = JSONParser(data: "test".data(using: .utf8)!)
                it("returns parser with empty json") {
                    expect(jsonParser).to(beNil())
                }
            }
        }
        describe("calls string(atPath:fromNode)") {
            context("with root path") {
                it("returns nil") {
                    expect(jsonParser.string(atPath: "/")).to(beNil())
                }
            }
            context("with incorrect path") {
                it("returns nil") {
                    expect(jsonParser.string(atPath: "///")).to(beNil())
                }
            }
            context("with non existing path") {
                it("returns nil") {
                    expect(jsonParser.string(atPath: "attribute5")).to(beNil())
                }
            }
            context("with correct path but wrong type") {
                it("returns nil") {
                    expect(jsonParser.string(atPath: "attribute2")).to(beNil())
                }
            }
            context("with self node in path and correct type") {
                it("returns value1") {
                    expect(jsonParser.string(atPath: "./attribute1")) == "value1"
                }
            }
            context("with correct absolute path and correct type") {
                it("returns value1") {
                    expect(jsonParser.string(atPath: "/attribute1")) == "value1"
                }
            }
            context("with correct relative path and correct type") {
                it("returns value1") {
                    expect(jsonParser.string(atPath: "attribute1")) == "value1"
                }
            }
            context("with invalid node") {
                it("returns nil") {
                    expect(jsonParser.string(atPath: "attribute1", fromNode: 1)).to(beNil())
                }
            }
            context("with non existing path and correct node") {
                it("returns nil") {
                    expect(jsonParser.string(atPath: "attribute5", fromNode: currentNode)).to(beNil())
                }
            }
            context("with correct path, correct node but wrong type") {
                it("returns nil") {
                    expect(jsonParser.string(atPath: "attribute2", fromNode: currentNode)).to(beNil())
                }
            }
            context("with self node in path, correct type and correct node") {
                it("returns value1") {
                    expect(jsonParser.string(atPath: "./attribute1", fromNode: currentNode)) == "value1"
                }
            }
            context("with correct absolute path, correct type and correct node") {
                it("returns value1 working as absolute path only") {
                    expect(jsonParser.string(atPath: "/attribute1", fromNode: currentNode)) == "value1"
                }
            }
            context("with correct related path, correct type and correct node") {
                it("returns value1") {
                    expect(jsonParser.string(atPath: "attribute1", fromNode: currentNode)) == "value1"
                }
            }
        }
        describe("calls array(atPath:fromNode)") {
            context("with root path") {
                it("returns nil") {
                    expect(jsonParser.array(atPath: "/")).to(beNil())
                }
            }
            context("with incorrect path") {
                it("returns nil") {
                    expect(jsonParser.array(atPath: "///")).to(beNil())
                }
            }
            context("with non existing path") {
                it("returns nil") {
                    expect(jsonParser.array(atPath: "attribute5")).to(beNil())
                }
            }
            context("with correct path but wrong type") {
                it("returns nil") {
                    expect(jsonParser.array(atPath: "attribute1")).to(beNil())
                }
            }
            context("with self node in path and correct type") {
                it("returns the array") {
                    expect(jsonParser.array(atPath: "./attribute2")?.count) == 2
                }
            }
            context("with correct absolute path and correct type") {
                it("returns the array") {
                    expect(jsonParser.array(atPath: "/attribute2")?.count) == 2
                }
            }
            context("with correct relative path and correct type") {
                it("returns the array") {
                    expect(jsonParser.array(atPath: "attribute2")?.count) == 2
                }
            }
            context("with invalid node") {
                it("returns nil") {
                    expect(jsonParser.array(atPath: "attribute2", fromNode: 1)).to(beNil())
                }
            }
            context("with non existing path and correct node") {
                it("returns nil") {
                    expect(jsonParser.array(atPath: "attribute5", fromNode: currentNode)).to(beNil())
                }
            }
            context("with correct path, correct node but wrong type") {
                it("returns nil") {
                    expect(jsonParser.array(atPath: "attribute1", fromNode: currentNode)).to(beNil())
                }
            }
            context("with self node in path, correct type and correct node") {
                it("returns the array") {
                    expect(jsonParser.array(atPath: "./attribute2", fromNode: currentNode)?.count) == 2
                }
            }
            context("with correct absolute path, correct type and correct node") {
                it("returns the array working as absolute path only") {
                    expect(jsonParser.array(atPath: "/attribute2", fromNode: currentNode)?.count) == 2
                }
            }
            context("with correct related path, correct type and correct node") {
                it("returns the array") {
                    expect(jsonParser.array(atPath: "attribute2", fromNode: currentNode)?.count) == 2
                }
            }
            context("with correct related path, correct type and aiming at sub node") {
                it("returns the arrayValue1") {
                    expect(jsonParser.string(atPath: "attribute2[0]/arrayAttribute1")) == "arrayValue1"
                }
            }
        }
        describe("calls double(atPath:fromNode)") {
            context("with root path") {
                it("returns nil") {
                    expect(jsonParser.double(atPath: "/")).to(beNil())
                }
            }
            context("with incorrect path") {
                it("returns nil") {
                    expect(jsonParser.double(atPath: "///")).to(beNil())
                }
            }
            context("with non existing path") {
                it("returns nil") {
                    expect(jsonParser.double(atPath: "attribute5")).to(beNil())
                }
            }
            context("with correct path but wrong type") {
                it("returns nil") {
                    expect(jsonParser.double(atPath: "attribute1")).to(beNil())
                }
            }
            context("with self node in path and correct type") {
                it("returns 0") {
                    expect(jsonParser.double(atPath: "./attribute3")) == 0
                }
            }
            context("with correct absolute path and correct type") {
                it("returns 0") {
                    expect(jsonParser.double(atPath: "/attribute3")) == 0
                }
            }
            context("with correct relative path and correct type") {
                it("returns 0") {
                    expect(jsonParser.double(atPath: "attribute3")) == 0
                }
            }
            context("with invalid node") {
                it("returns nil") {
                    expect(jsonParser.double(atPath: "attribute3", fromNode: 1)).to(beNil())
                }
            }
            context("with non existing path and correct node") {
                it("returns nil") {
                    expect(jsonParser.double(atPath: "attribute5", fromNode: currentNode)).to(beNil())
                }
            }
            context("with correct path, correct node but wrong type") {
                it("returns nil") {
                    expect(jsonParser.double(atPath: "attribute1", fromNode: currentNode)).to(beNil())
                }
            }
            context("with self node in path, correct type and correct node") {
                it("returns 0") {
                    expect(jsonParser.double(atPath: "./attribute3", fromNode: currentNode)) == 0
                }
            }
            context("with correct absolute path, correct type and correct node") {
                it("returns 0 working as absolute path only") {
                    expect(jsonParser.double(atPath: "/attribute3", fromNode: currentNode)) == 0
                }
            }
            context("with correct related path, correct type and correct node") {
                it("returns 0") {
                    expect(jsonParser.double(atPath: "attribute3", fromNode: currentNode)) == 0
                }
            }
        }
        describe("calls dictionary(atPath:fromNode)") {
            context("with root path") {
                it("returns nil") {
                    expect(jsonParser.dictionary(atPath: "/")).to(beNil())
                }
            }
            context("with incorrect path") {
                it("returns nil") {
                    expect(jsonParser.dictionary(atPath: "///")).to(beNil())
                }
            }
            context("with non existing path") {
                it("returns nil") {
                    expect(jsonParser.dictionary(atPath: "attribute5")).to(beNil())
                }
            }
            context("with correct path but wrong type") {
                it("returns nil") {
                    expect(jsonParser.dictionary(atPath: "attribute1")).to(beNil())
                }
            }
            context("with self node in path and correct type") {
                it("returns the dictionary") {
                    expect(jsonParser.dictionary(atPath: "./attribute4")).notTo(beNil())
                }
            }
            context("with correct absolute path and correct type") {
                it("returns the dictionary") {
                    expect(jsonParser.dictionary(atPath: "/attribute4")).notTo(beNil())
                }
            }
            context("with correct relative path and correct type") {
                it("returns the dictionary") {
                    expect(jsonParser.dictionary(atPath: "attribute4")).notTo(beNil())
                }
            }
            context("with invalid node") {
                it("returns nil") {
                    expect(jsonParser.dictionary(atPath: "attribute4", fromNode: 1)).to(beNil())
                }
            }
            context("with non existing path and correct node") {
                it("returns nil") {
                    expect(jsonParser.dictionary(atPath: "attribute5", fromNode: currentNode)).to(beNil())
                }
            }
            context("with correct path, correct node but wrong type") {
                it("returns nil") {
                    expect(jsonParser.dictionary(atPath: "attribute1", fromNode: currentNode)).to(beNil())
                }
            }
            context("with self node in path, correct type and correct node") {
                it("returns the dictionary") {
                    expect(jsonParser.dictionary(atPath: "./attribute4", fromNode: currentNode)).notTo(beNil())
                }
            }
            context("with correct absolute path, correct type and correct node") {
                it("returns the dictionary working as absolute path only") {
                    expect(jsonParser.dictionary(atPath: "/attribute4", fromNode: currentNode)).notTo(beNil())
                }
            }
            context("with correct related path, correct type and correct node") {
                it("returns the dictionary") {
                    expect(jsonParser.dictionary(atPath: "attribute4", fromNode: currentNode)).notTo(beNil())
                }
            }
            context("with correct related path, correct type and aiming at sub node") {
                it("returns the subValue1") {
                    expect(jsonParser.string(atPath: "attribute4/subAttribute1")) == "subValue1"
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation


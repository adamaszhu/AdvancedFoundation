class CoreDataHelperSpecs: QuickSpec {
    
    override func spec() {
        let coreDataHelper = CoreDataHelper(name: AppInfoAccessor.shared.bundleName!)!
        afterEach {
            _ = coreDataHelper.deleteAllObjects(withType: Test.self)
        }
        describe("has standard helper") {
            let coreDataHelper = CoreDataHelper.standard
            it("is not nil") {
                expect(coreDataHelper).notTo(beNil())
            }
            it("is useable") {
                expect(coreDataHelper?.save()).notTo(beNil())
            }
        }
        describe("calls init(name)") {
            context("with existing name") {
                it("return helper") {
                    expect(coreDataHelper.save()).notTo(beNil())
                }
            }
            context("with not existing name") {
                let coreDataHelper = CoreDataHelper(name: "Test")
                it("return nil") {
                    expect(coreDataHelper).to(beNil())
                }
            }
        }
        describe("call createObject(withType)") {
            context("with valid type") {
                it("returns new object") {
                    expect(coreDataHelper.createObject(withType: Test.self)).notTo(beNil())
                }
                it("can be retrieved") {
                    let object = coreDataHelper.createObject(withType: Test.self)
                    object.testTitle = "Test"
                    _ = coreDataHelper.save()
                    expect(coreDataHelper.getObjects(withType: Test.self)?.first?.testTitle) == "Test"
                }
            }
            context("with invalid type") {
                it("throws exception") {
                    expect(coreDataHelper.createObject(withType: CoreDataHelperSpecs.self)).to(raiseException())
                }
            }
        }
        describe("calls getObjects(withType:withCondition:withArguments)") {
            beforeEach {
                var object = coreDataHelper.createObject(withType: Test.self)
                object.testTitle = "Test1"
                object = coreDataHelper.createObject(withType: Test.self)
                object.testTitle = "Test2"
                _ = coreDataHelper.save()
            }
            context("with invalid type") {
                it("returns nil") {
                    expect(coreDataHelper.getObjects(withType: CoreDataHelperSpecs.self)).to(raiseException())
                }
            }
            context("with valid type") {
                it("returns 2 objects") {
                    expect(coreDataHelper.getObjects(withType: Test.self)?.count) == 2
                }
            }
            context("with existing condition and arguments") {
                it("returns 1 objects") {
                    expect(coreDataHelper.getObjects(withType: Test.self, withCondition: "title=%@", withArguments: ["Test1"])?.count) == 1
                }
            }
            context("with non existing condition and arguments") {
                it("returns 0 objects") {
                    expect(coreDataHelper.getObjects(withType: Test.self, withCondition: "title=%@", withArguments: ["Test3"])?.count) == 0
                }
            }
        }
        describe("calls isObjectExisted(withType:withCondition:withArguments)") {
            beforeEach {
                var object = coreDataHelper.createObject(withType: Test.self)
                object.testTitle = "Test1"
                object = coreDataHelper.createObject(withType: Test.self)
                object.testTitle = "Test2"
                _ = coreDataHelper.save()
            }
            context("with invalid type") {
                it("returns nil") {
                    expect(coreDataHelper.isObjectExisted(withType: CoreDataHelperSpecs.self)).to(raiseException())
                }
            }
            context("with valid type") {
                it("returns true") {
                    expect(coreDataHelper.isObjectExisted(withType: Test.self)) == true
                }
            }
            context("with existing condition and arguments") {
                it("returns true") {
                    expect(coreDataHelper.isObjectExisted(withType: Test.self, withCondition: "title=%@", withArguments: ["Test1"])) == true
                }
            }
            context("with non existing condition and arguments") {
                it("returns false") {
                    expect(coreDataHelper.isObjectExisted(withType: Test.self, withCondition: "title=%@", withArguments: ["Test3"])) == false
                }
            }
        }
        describe("calls deleteObject(_)") {
            beforeEach {
                let object = coreDataHelper.createObject(withType: Test.self)
                object.testTitle = "Test"
                _ = coreDataHelper.save()
            }
            context("with existing object") {
                it("returns true") {
                    let object = (coreDataHelper.getObjects(withType: Test.self)?.first)!
                    expect(coreDataHelper.deleteObject(object)) == true
                }
            }
            context("with non existing object") {
                it("returns false") {
                    expect(coreDataHelper.deleteObject(Test())) == false
                }
            }
        }
        describe("calls deleteAllObjects(withType)") {
            beforeEach {
                let object = coreDataHelper.createObject(withType: Test.self)
                object.testTitle = "Test"
                _ = coreDataHelper.save()
            }
            context("with existing type") {
                it("returns true") {
                    expect(coreDataHelper.deleteAllObjects(withType: Test.self)) == true
                }
            }
            context("with non existing type") {
                it("returns nil") {
                    expect(coreDataHelper.deleteAllObjects(withType: CoreDataHelperSpecs.self)).to(raiseException())
                }
            }
        }
        describe("calls save()") {
            context("if changes have been made") {
                it("returns true") {
                    let object = coreDataHelper.createObject(withType: Test.self)
                    object.testTitle = "Test"
                    expect(coreDataHelper.save()) == true
                }
            }
            context("if no change is there") {
                it("returns false") {
                    expect(coreDataHelper.save()) == false
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

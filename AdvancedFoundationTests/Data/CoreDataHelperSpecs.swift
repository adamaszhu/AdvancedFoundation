class CoreDataHelperSpecs: QuickSpec {
    
    override func spec() {
        let coreDataHelper = CoreDataHelper(modelName: AppInfoAccessor.shared.bundleName!)!
        afterEach {
            coreDataHelper.deleteAllObjects(of: Test.self)
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
        describe("calls init(modelName:bundle)") {
            context("with existing name") {
                it("return helper") {
                    expect(coreDataHelper.save()).notTo(beNil())
                }
            }
            context("with not existing name") {
                let coreDataHelper = CoreDataHelper(modelName: "Test")
                it("return nil") {
                    expect(coreDataHelper).to(beNil())
                }
            }
            context("with incorrect bundle") {
                let coreDataHelper = CoreDataHelper(modelName: AppInfoAccessor.shared.bundleName!, bundle: Bundle())
                it("return nil") {
                    expect(coreDataHelper).to(beNil())
                }
            }
        }
        describe("call newObject(of)") {
            context("with valid type") {
                it("returns new object") {
                    expect(coreDataHelper.newObject(of: Test.self)).notTo(beNil())
                }
                it("can be retrieved") {
                    let object = coreDataHelper.newObject(of: Test.self)
                    object.testTitle = "Test"
                    coreDataHelper.save()
                    expect(coreDataHelper.objects(of: Test.self)?.first?.testTitle) == "Test"
                }
            }
            context("with invalid type") {
                it("throws exception") {
                    expect(coreDataHelper.newObject(of: CoreDataHelperSpecs.self)).to(raiseException())
                }
            }
        }
        describe("calls objects(of:withCondition:withArguments)") {
            beforeEach {
                var object = coreDataHelper.newObject(of: Test.self)
                object.testTitle = "Test1"
                object = coreDataHelper.newObject(of: Test.self)
                object.testTitle = "Test2"
                coreDataHelper.save()
            }
            context("with invalid type") {
                it("returns nil") {
                    expect(coreDataHelper.objects(of: CoreDataHelperSpecs.self)).to(raiseException())
                }
            }
            context("with valid type") {
                it("returns 2 objects") {
                    expect(coreDataHelper.objects(of: Test.self)?.count) == 2
                }
            }
            context("with existing condition and arguments") {
                it("returns 1 objects") {
                    expect(coreDataHelper.objects(of: Test.self, withCondition: "title=%@", withArguments: ["Test1"])?.count) == 1
                }
            }
            context("with non existing condition and arguments") {
                it("returns 0 objects") {
                    expect(coreDataHelper.objects(of: Test.self, withCondition: "title=%@", withArguments: ["Test3"])?.count) == 0
                }
            }
        }
        describe("calls isObjectExisted(of:withCondition:withArguments)") {
            beforeEach {
                var object = coreDataHelper.newObject(of: Test.self)
                object.testTitle = "Test1"
                object = coreDataHelper.newObject(of: Test.self)
                object.testTitle = "Test2"
                coreDataHelper.save()
            }
            context("with invalid type") {
                it("returns nil") {
                    expect(coreDataHelper.isObjectExisted(of: CoreDataHelperSpecs.self)).to(raiseException())
                }
            }
            context("with valid type") {
                it("returns true") {
                    expect(coreDataHelper.isObjectExisted(of: Test.self)) == true
                }
            }
            context("with existing condition and arguments") {
                it("returns true") {
                    expect(coreDataHelper.isObjectExisted(of: Test.self, withCondition: "title=%@", withArguments: ["Test1"])) == true
                }
            }
            context("with non existing condition and arguments") {
                it("returns false") {
                    expect(coreDataHelper.isObjectExisted(of: Test.self, withCondition: "title=%@", withArguments: ["Test3"])) == false
                }
            }
        }
        describe("calls delete(_)") {
            beforeEach {
                let object = coreDataHelper.newObject(of: Test.self)
                object.testTitle = "Test"
                coreDataHelper.save()
            }
            context("with existing object") {
                it("returns true") {
                    let object = (coreDataHelper.objects(of: Test.self)?.first)!
                    expect(coreDataHelper.delete(object)) == true
                }
            }
            context("with non existing object") {
                it("returns false") {
                    expect(coreDataHelper.delete(Test())) == false
                }
            }
        }
        describe("calls deleteAllObjects(of)") {
            beforeEach {
                let object = coreDataHelper.newObject(of: Test.self)
                object.testTitle = "Test"
                coreDataHelper.save()
            }
            context("with existing type") {
                it("returns true") {
                    expect(coreDataHelper.deleteAllObjects(of: Test.self)) == true
                }
            }
            context("with non existing type") {
                it("returns nil") {
                    expect(coreDataHelper.deleteAllObjects(of: CoreDataHelperSpecs.self)).to(raiseException())
                }
            }
        }
        describe("calls save()") {
            context("if changes have been made") {
                it("returns true") {
                    let object = coreDataHelper.newObject(of: Test.self)
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

class CoreDataHelperSpecs: QuickSpec {
    
    override func spec() {
        let coreDataHelper = CoreDataHelper(withName: AppInfoAccessor.shared.bundleName!)
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
        describe("calls init(withName)") {
            context("with existing name") {
                it("return useable helper") {
                    expect(coreDataHelper.save()).notTo(beNil())
                }
            }
            context("with not existing name") {
                let coreDataHelper = CoreDataHelper(withName: "Test")
                it("return unuseable helper") {
                    expect(coreDataHelper.save()).to(beNil())
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
                    object?.testTitle = "Test"
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
        describe("call getObjects(withType:withCondition:withArguments)") {
            beforeEach {
                var object = coreDataHelper.createObject(withType: Test.self)
                object?.testTitle = "Test1"
                object = coreDataHelper.createObject(withType: Test.self)
                object?.testTitle = "Test2"
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
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation





//    /**
//     * Get the object list of a specific class type of object.
//     * - parameter type: The type of class need to be retrieved.
//     * - parameter condition: The condition of the object.
//     * - parameter arguments: The list to be fit into the condition.
//     * - returns: A list of object. Nil will be returned if there has been an error.
//     */
//    public func getObjects(withType type: AnyClass, withCondition condition: String? = nil, withArguments arguments: Array<Any>? = nil) -> Array<NSManagedObject>? {
//        guard let context = context else {
//            return nil
//        }
//        do {
//            let request = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: type))
//            if condition != nil {
//                let predicate = NSPredicate(format: condition!, argumentArray: arguments)
//                request.predicate = predicate
//            }
//            guard let objects = try context.fetch(request) as? Array<NSManagedObject> else {
//                Logger.standard.logError(dataError)
//                return nil
//            }
//            return objects
//        } catch let error {
//            Logger.standard.logError(error)
//            return nil
//        }
//    }
//
//    /**
//     * Judge whether an object with spedific condition exists or not.
//     * - parameter type: The type of class need to be retrieved.
//     * - parameter condition: The condition of the object.
//     * - parameter arguments: The list to be fit into the condition.
//     * - returns: Whether the object exists or not. Nil will be returned if there has been an error.
//     */
//    public func isObjectExisted(withType type: AnyClass, withCondition condition: String? = nil, withArguments arguments: Array<Any>? = nil) -> Bool? {
//        guard let objects = getObjects(withType: type, withCondition: condition, withArguments: arguments) else {
//            return nil
//        }
//        return objects.count > 0
//    }
//
//    /**
//     * Delete a spedific object.
//     * - parameter object: The object to be deleted.
//     * - returns: Whether the object has been deleted or not. Nil will be returned if there has been an error.
//     */
//    public func deleteObject(_ object: NSManagedObject) -> Bool? {
//        guard let context = context else {
//            return nil
//        }
//        context.delete(object)
//        return save()
//    }
//
//    /**
//     * Delete all objects belonging to a specific class type.
//     * - parameter type: The type of objects should be deleted.
//     * - returns: Whether the object has been deleted or not. Nil will be returned if there has been an error.
//     */
//    public func deleteAllObjects(withType type: AnyClass) -> Bool? {
//        guard let objects = getObjects(withType: type) else {
//            return nil
//        }
//        var result: Bool?
//        for object in objects {
//            result = deleteObject(object)
//            if result != true {
//                return result
//            }
//        }
//        return true
//    }
//
//
//    /**
//     * Save any unsaved change.
//     * returns: Whether new changes have been saved or not. Nil if there is an error.
//     */
//    public func save() -> Bool? {
//        guard let context = context else {
//            return nil
//        }
//        if !context.hasChanges {
//            return false
//        }
//        do {
//            try context.save()
//            return true
//        } catch let error {
//            Logger.standard.logError(error)
//            return nil
//        }
//    }
//
//    /**
//     * Get the core data context according to the name of the model.
//     * - parameter name: The name of the model.
//     */
//    private func updateContext(fromModel name: String) {
//        // COMMENT: The directory used to store the Core Data store file. This code uses a directory in the application's documents Application Support directory.
//        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        guard let url = urls.last?.appendingPathComponent(name).appendingPathExtension(sqlAppendix) else {
//            Logger.standard.logError(modelNameError, withDetail: name)
//            return
//        }
//        // COMMENT: The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
//        guard let modelURL = Bundle.main.url(forResource: name, withExtension: "momd") else {
//            Logger.standard.logError(modelNameError, withDetail: name)
//            return
//        }
//        guard let model = NSManagedObjectModel(contentsOf: modelURL) else {
//            Logger.standard.logError(modelNameError, withDetail: name)
//            return
//        }
//        // COMMENT: The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail. Create the coordinator and store
//        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
//        // COMMENT: Add automatic version migration.
//        let options = [NSInferMappingModelAutomaticallyOption: true, NSMigratePersistentStoresAutomaticallyOption: true]
//        do {
//            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: options)
//        } catch let error {
//            Logger.standard.logError(error)
//            return
//        }
//        context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//        context?.persistentStoreCoordinator = coordinator
//    }
//
//
//
//
//    //    /**
//    //     * System error.
//    //     */
//    //    private static let bundleNameError = "The bundle name cannot be retrieved."
//    //    private static let operationError = "The operation can not be finished."
//    //
//    //
//
//    //
//    //
//    //
//    //
//    //
//}
//
//import Foundation
//import CoreData
//


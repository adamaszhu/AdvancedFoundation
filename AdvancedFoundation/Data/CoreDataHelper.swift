/**
 * CoreDataHelper is used to perform basic level core data interaction.
 * - author: Adamas
 * - version: 1.0.0
 * - date: 02/05/2017
 */
public class CoreDataHelper {
    
    /**
     * SQL file appendix.
     */
    private let sqlAppendix = "sqlite"
    
    /**
     * System error.
     */
    private let modelNameError = "The model cannot be found."
    private let dataError = "The retrieved data isn't a NSManagedObject object list."
    
    /**
     * Get the singleton object.
     */
    public static let standard: CoreDataHelper? = {
        guard let bundleName = AppInfoAccessor.shared.bundleName else {
            return nil
        }
        return CoreDataHelper(name: bundleName)
    }()
    
    /**
     * The context of the core data.
     */
    private var context: NSManagedObjectContext
    
    /**
     * Initialize the object.
     * - parameter name: The name of the model.
     */
    public init?(name: String) {
        // COMMENT: The directory used to store the Core Data store file. This code uses a directory in the application's documents Application Support directory.
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        guard let url = urls.last?.appendingPathComponent(name).appendingPathExtension(sqlAppendix) else {
            Logger.standard.logError(modelNameError, withDetail: name)
            return nil
        }
        // COMMENT: The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        guard let modelURL = Bundle.main.url(forResource: name, withExtension: "momd") else {
            Logger.standard.logError(modelNameError, withDetail: name)
            return nil
        }
        guard let model = NSManagedObjectModel(contentsOf: modelURL) else {
            Logger.standard.logError(modelNameError, withDetail: name)
            return nil
        }
        // COMMENT: The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail. Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        // COMMENT: Add automatic version migration.
        let options = [NSInferMappingModelAutomaticallyOption: true, NSMigratePersistentStoresAutomaticallyOption: true]
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: options)
        } catch let error {
            Logger.standard.logError(error)
            return nil
        }
        context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = coordinator
    }
    
    /**
     * Prepare an object for inserting to the core data.
     * - parameter type: The class of the object that need to be inserted.
     * - returns: The object for insertion.
     */
    public func createObject(withType type: AnyClass) -> NSManagedObject {
        let object = NSEntityDescription.insertNewObject(forEntityName: String(describing: type), into: context)
        return object
    }
    
    /**
     * Get the object list of a specific class type of object.
     * - parameter type: The type of class need to be retrieved.
     * - parameter condition: The condition of the object.
     * - parameter arguments: The list to be fit into the condition.
     * - returns: A list of object. Nil will be returned if there has been an error.
     */
    public func getObjects(withType type: AnyClass, withCondition condition: String? = nil, withArguments arguments: Array<Any>? = nil) -> Array<NSManagedObject>? {
        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: type))
            if let condition = condition {
                let predicate = NSPredicate(format: condition, argumentArray: arguments)
                request.predicate = predicate
            }
            guard let objects = try context.fetch(request) as? Array<NSManagedObject> else {
                Logger.standard.logError(dataError)
                return nil
            }
            return objects
        } catch let error {
            Logger.standard.logError(error)
            return nil
        }
    }
    
    /**
     * Judge whether an object with spedific condition exists or not.
     * - parameter type: The type of class need to be retrieved.
     * - parameter condition: The condition of the object.
     * - parameter arguments: The list to be fit into the condition.
     * - returns: Whether the object exists or not. Nil will be returned if there has been an error.
     */
    public func isObjectExisted(withType type: AnyClass, withCondition condition: String? = nil, withArguments arguments: Array<Any>? = nil) -> Bool? {
        guard let objects = getObjects(withType: type, withCondition: condition, withArguments: arguments) else {
            return nil
        }
        return objects.count > 0
    }
    
    /**
     * Delete a spedific object.
     * - parameter object: The object to be deleted.
     * - returns: Whether the object has been deleted or not. Nil will be returned if there has been an error.
     */
    public func deleteObject(_ object: NSManagedObject) -> Bool? {
        context.delete(object)
        return save()
    }
    
    /**
     * Delete all objects belonging to a specific class type.
     * - parameter type: The type of objects should be deleted.
     * - returns: Whether the object has been deleted or not. Nil will be returned if there has been an error.
     */
    public func deleteAllObjects(withType type: AnyClass) -> Bool? {
        guard let objects = getObjects(withType: type) else {
            return nil
        }
        var result: Bool?
        for object in objects {
            result = deleteObject(object)
            if result != true {
                return result
            }
        }
        return true
    }
    
    
    /**
     * Save any unsaved change.
     * returns: Whether new changes have been saved or not. Nil if there is an error.
     */
    public func save() -> Bool? {
        guard context.hasChanges else {
            return false
        }
        do {
            try context.save()
            return true
        } catch let error {
            Logger.standard.logError(error)
            return nil
        }
    }
    
}

import Foundation
import CoreData



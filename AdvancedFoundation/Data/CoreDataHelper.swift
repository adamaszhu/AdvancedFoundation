/// CoreDataHelper is used to perform basic level core data interaction.
///
/// - author: Adamas
/// - version: 1.5.0
/// - date: 24/07/2019
public class CoreDataHelper {
    
    /// Get the singleton object.
    public static let standard: CoreDataHelper? = {
        guard let bundleName = AppInfoAccessor.standard.bundleName else {
            return nil
        }
        return CoreDataHelper(modelName: bundleName)
    }()
    
    /// The context of the core data.
    private var context: NSManagedObjectContext
    
    /// Initialize the object.
    ///
    /// - Parameters:
    ///   - modelName: The name of the model.
    ///   - bundle: The bundle that the model belongs to.
    ///   - fileManager: The file system that hosts the model.
    public init?(modelName: String,
                 bundle: Bundle = .main,
                 fileManager: FileManager = .default) {
        // The directory used to store the Core Data store file. This code uses a directory in the application's documents Application Support directory.
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        guard var url = urls.last else {
            Logger.standard.logError(Self.modelNameError, withDetail: modelName)
            return nil
        }
        url = url.appendingPathComponent(modelName)
        url = url.appendingPathExtension(Self.sqlFileSuffix)
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        guard let modelURL = bundle.url(forResource: modelName,
                                        withExtension: Self.modelFileSuffix) else {
            Logger.standard.logError(Self.modelNameError, withDetail: modelName)
            return nil
        }
        guard let model = NSManagedObjectModel(contentsOf: modelURL) else {
            Logger.standard.logError(Self.modelNameError, withDetail: modelName)
            return nil
        }
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail. Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        // Add automatic version migration.
        let options = [NSInferMappingModelAutomaticallyOption: true,
                 NSMigratePersistentStoresAutomaticallyOption: true]
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                               configurationName: nil,
                                               at: url,
                                               options: options)
        } catch let error {
            Logger.standard.log(error)
            return nil
        }
        context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = coordinator
    }
    
    /// Prepare an object for inserting to the core data.
    ///
    /// - Parameter type: The class of the object that need to be inserted.
    /// - Returns: The object for insertion.
    public func object(of type: AnyClass) -> NSManagedObject {
        NSEntityDescription.insertNewObject(forEntityName: String(describing: type),
                                            into: context)
    }
    
    /// Get the object list of a specific class type of object.
    ///
    /// - Parameters:
    ///   - type: The type of class need to be retrieved.
    ///   - condition: The condition of the object.
    ///   - arguments: The list to be fit into the condition.
    /// - Returns: A list of object. Nil will be returned if there has been an error.
    public func objects(of type: AnyClass,
                        withCondition condition: String? = nil,
                        withArguments arguments: [Any]? = nil) -> [NSManagedObject]? {
        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: type))
            if let condition = condition {
                let predicate = NSPredicate(format: condition, argumentArray: arguments)
                request.predicate = predicate
            }
            guard let objects = try context.fetch(request) as? [NSManagedObject] else {
                Logger.standard.logError(Self.dataTypeError)
                return nil
            }
            return objects
        } catch let error {
            Logger.standard.log(error)
            return nil
        }
    }
    
    /// Judge whether an object with spedific condition exists or not.
    ///
    /// - Parameters:
    ///   - type: The type of class need to be retrieved.
    ///   - condition: The condition of the object.
    ///   - arguments: The list to be fit into the condition.
    /// - Returns: Whether the object exists or not. Nil will be returned if there has been an error.
    public func isObjectExisted(of type: AnyClass,
                                withCondition condition: String? = nil,
                                withArguments arguments: [Any]? = nil) -> Bool? {
        guard let objects = objects(of: type,
                                    withCondition: condition,
                                    withArguments: arguments) else {
            return nil
        }
        return objects.count > 0
    }
    
    /// Delete a spedific object.
    ///
    /// - Parameter object: The object to be deleted.
    /// - Returns: Whether the object has been deleted or not. Nil will be returned if there has been an error.
    @discardableResult
    public func delete(_ object: NSManagedObject) -> Bool? {
        context.delete(object)
        return saveChanges()
    }
    
    /// Delete all objects belonging to a specific class type.
    ///
    /// - Parameter type: The type of objects should be deleted.
    /// - Returns: Whether the object has been deleted or not. Nil will be returned if there has been an error.
    @discardableResult
    public func deleteObjects(of type: AnyClass) -> Bool? {
        guard let objects = objects(of: type) else {
            return nil
        }
        for object in objects {
            if delete(object) != true {
                return false
            }
        }
        return true
    }
    
    
    /// Save any unsaved change.
    ///
    /// - Returns: Whether new changes have been saved or not. Nil if there is an error.
    @discardableResult
    public func saveChanges() -> Bool? {
        guard context.hasChanges else {
            return false
        }
        do {
            try context.save()
            return true
        } catch let error {
            Logger.standard.log(error)
            return nil
        }
    }
    
    /// Reset the context
    ///
    /// - Returns: Whether the context has been reseted or not.
    @discardableResult
    public func resetChanges() -> Bool {
        guard context.hasChanges else {
            return false
        }
        context.reset()
        return true
    }
}

/// Constants
private extension CoreDataHelper {
    
    /// SQL file suffix.
    static let sqlFileSuffix = "sqlite"
    
    /// Model file suffix
    static let modelFileSuffix = "momd"
    
    /// System errors.
    static let modelNameError = "The model cannot be found."
    static let dataTypeError = "The retrieved data isn't a NSManagedObject object list."
}

import CoreData
import Foundation

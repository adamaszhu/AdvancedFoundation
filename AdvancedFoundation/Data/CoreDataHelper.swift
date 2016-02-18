import Foundation
import CoreData

/**
 * CoreDataHelper is used to perform basic level core data interaction.
 * - version 1.1 - 20160218
 * - author Adamas
 */
public class CoreDataHelper: AnyObject {
    
    /**
     * The context of the core data.
     */
    private var context: NSManagedObjectContext
    
    public init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    /**
     * Prepare an object for insertion.
     * - parameter objectClass The class of the object that need to be inserted.
     * - return The object for insertion.
     */
    public func prepareInsertObject(objectClass: AnyClass) -> AnyObject {
        let object = NSEntityDescription .insertNewObjectForEntityForName(String(objectClass), inManagedObjectContext: context)
        return object
    }
    
    /**
     * Insert the object.
     * - return Whether the object has been inserted or not.
     */
    public func insertObject() -> Bool {
        do {
            try context.save()
            return true
        } catch _ {
            return false
        }
    }
    
    /**
     * Get the object list of a specific class type of object.
     * - parameter objectClass The type of class need to be retrieved.
     * - return A list of object.
     */
    public func getObjectList(objectClass: AnyClass) -> Array<AnyObject> {
        let request = NSFetchRequest(entityName: String(objectClass))
        do {
            let objectList = try context.executeFetchRequest(request)
            return objectList
        } catch _ {
            return []
        }
    }
    
    /**
     * Delete a spedific object.
     * - parameter object The object to be deleted.
     * - return Whether the object has been deleted successfully or not.
     */
    public func deleteObject(object: AnyObject) -> Bool {
        if !object.isKindOfClass(NSManagedObject) {
            return false
        }
        context.deleteObject(object as! NSManagedObject)
        return true
    }
    
    /**
     * Delete all objects belonging to a specific class type.
     * - parameter objectClass The type of objects should be deleted.
     * - return Whether the objects has been deleted successfully or not.
     */
    public func deleteAllObjects(objectClass: AnyClass) -> Bool {
        let objectList = getObjectList(objectClass)
        for object in objectList {
            if !deleteObject(object) {
                return false
            }
        }
        return true
    }
    
}

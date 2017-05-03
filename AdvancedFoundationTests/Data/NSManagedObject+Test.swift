/**
 * NSManagedObject+Test is used to mock a Test object, since the Test class is in AdvancedFoundationHost bundle.
 */
extension NSManagedObject {
    
    var testTitle: String? {
        get {
            return value(forKey: "title") as? String
        }
        set {
            setValue(newValue, forKey: "title")
        }
    }
    
}

import CoreData

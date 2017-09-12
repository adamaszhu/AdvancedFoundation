class IDGeneratorMocker: IDGenerator {
    
    override var uniqueID: String {
        return "ID"
    }
    
}

@testable import AdvancedFoundation

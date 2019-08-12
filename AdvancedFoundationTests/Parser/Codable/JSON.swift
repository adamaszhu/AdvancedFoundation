struct JSON {
    
    let attribute1: String
    let attribute2: [[String: String]]
    
    init(attribute1: String = "",
         attribute2: [[String: String]] = []) {
        self.attribute1 = attribute1
        self.attribute2 = attribute2
    }
}

enum JSONKeys: CodingKey {
    case attribute1
    case attribute2
}

extension JSON: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder ~~> JSONKeys.self
        self.init(attribute1: try container *> .attribute1,
                  attribute2: try container **> .attribute2)
    }
    
    public func encode(to encoder: Encoder) throws {
        let container = encoder ~~> JSONKeys.self
        try container <*? .attribute1 <~~ attribute1
        try container <*? .attribute2 <~~ attribute2
    }
}

@testable import AdvancedFoundation

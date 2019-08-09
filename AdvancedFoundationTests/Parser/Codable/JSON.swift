struct JSON {
    let attribute1: String?
    let attribute2: [[String: String]]?
    let attribute3: Double?
    let attribute4: [String: String]?
    let attribute5: Bool?
    
    init(attribute1: String? = nil,
         attribute2: [[String: String]]? = nil,
         attribute3: Double? = nil,
         attribute4: [String: String]? = nil,
         attribute5: Bool? = nil) {
        self.attribute1 = attribute1
        self.attribute2 = attribute2
        self.attribute3 = attribute3
        self.attribute4 = attribute4
        self.attribute5 = attribute5
    }
}

enum JSONKeys: CodingKey {
    case attribute1
    case attribute2
    case attribute3
    case attribute4
    case attribute5
}

extension JSON: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder ~~> JSONKeys.self
        self.init(attribute1: try container *> .attribute1,
                  attribute2: try container **> .attribute2,
                  attribute3: try container *> .attribute3,
                  attribute4: try container *> .attribute4,
                  attribute5: try container *> .attribute5)
    }
    
    public func encode(to encoder: Encoder) throws {
        let container = encoder ~~> JSONKeys.self
        try container <* .attribute1 <~~ attribute1
        try container <* .attribute2 <~~ attribute2
        try container <* .attribute3 <~~ attribute3
        try container <* .attribute4 <~~ attribute4
        try container <* .attribute5 <~~ attribute5
    }
}

@testable import AdvancedFoundation

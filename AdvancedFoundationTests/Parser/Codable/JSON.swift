struct JSON {
    let attribute1: String?
    let attribute2: [[String: String]]?
    let attribute3: Double?
    let attribute4: [String: String]?
    let attribute5: Bool?
}

enum JSONKeys: CodingKey {
    case attribute1
    case attribute2
    case attribute3
    case attribute4
    case attribute5
}

extension JSON: Decodable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder ~~> JSONKeys.self
        self.init(attribute1: try container *> .attribute1,
                  attribute2: try container **> .attribute2,
                  attribute3: try container *> .attribute3,
                  attribute4: try container *> .attribute4,
                  attribute5: try container *> .attribute5)
    }
}

@testable import AdvancedFoundation

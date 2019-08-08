infix operator ~>: CodableKeyPrecedence

struct JSON {
    let attribute1: String?
    let attribute2: [[String: String]]?
    let attribute3: Int?
    let attribute4: [String: String]?
}

enum JSONKeys: CodingKey {
    case attribute1
    case attribute2
    case attribute3
    case attribute4
}

extension JSON: Decodable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder ~> JSONKeys.self
        self.init(attribute1: "",
                  attribute2: try container ~> .attribute2,
                  attribute3: 0,
                  attribute4: [:])
    }
}

@testable import AdvancedFoundation

//
//  KeyedDecodingContainer+Decodable.swift
//  AdvancedFoundation
//
//  Created by Adamas Zhu on 8/8/19.
//  Copyright © 2019 Adamas. All rights reserved.
//

import Foundation

public extension KeyedDecodingContainer {
    
    func decodeArrayIfPresent<O: Decodable>(for key: K) throws -> [O]? {
        guard var unkeyedContainer = try? nestedUnkeyedContainer(forKey: key) else {
            // Exception should be thrown if the value is not an array. But there is no way to detect the existance of an array key.
            return nil
        }
        var array = [O]()
        while !unkeyedContainer.isAtEnd {
            let object = try unkeyedContainer.decode(O.self)
            array.append(object)
        }
        return array
    }
}

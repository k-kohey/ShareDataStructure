//
//  EntityParser.swift
//  RalmDataStructure
//
//  Created by Kohei Kawaguchi on 2019/05/31.
//  Copyright © 2019 Kohei Kawaguchi. All rights reserved.
//

import Foundation
import RealmSwift

typealias DogParser = RealmObjectParser<Dog, GraphQLAPI.Dog>

final class RealmObjectParser<RealmObject: Object & Decodable, EncodableObject: Encodable> {
    // 外部から入れる
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    
    func parse<P>(from entity: P) -> RealmObject? {
        switch entity {
        case is RealmObject:
            return entity as? RealmObject
        case is EncodableObject:
            guard let entity = entity as? EncodableObject,
                let json = try? encoder.encode(entity) else { return nil }
            return try? decoder.decode(RealmObject.self, from: json)
        default:
            return nil
        }
    }
}

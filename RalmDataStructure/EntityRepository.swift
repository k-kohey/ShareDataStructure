//
//  EntityRepository.swift
//  RalmDataStructure
//
//  Created by Kohei Kawaguchi on 2019/05/31.
//  Copyright © 2019 Kohei Kawaguchi. All rights reserved.
//

import Foundation

protocol EntityConvertiable: Codable {
    var id: String { get set }
}

final class EntityRepository {
    // 外部から入れる
    let store = EntityStore()
    let api = GraphQLAPI()
    let parser = EntityParser()
    
    func fetch(id: String) -> EntityConvertiable {
        return api.fetch(id: id)
    }
    
    func save(_ entity: EntityConvertiable) {
        guard let entity = parser.realmObject(from: entity) else { return }
        store.save(entity)
    }
}

final class EntityParser {
    // 外部から入れる
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    
    func realmObject(from entity: EntityConvertiable) -> RealmEntity? {
        switch entity {
        case is RealmEntity:
            return entity as? RealmEntity
        case is GraphQLAPI.GeneratedEntity:
            let entity = entity as! GraphQLAPI.GeneratedEntity
            let json = try! encoder.encode(entity)
            return try? decoder.decode(RealmEntity.self, from: json)
        default:
            return nil
        }
    }
    
    func graphQLObject(from entity: EntityConvertiable) {
        // 割愛
    }
}

//
//  EntityRepository.swift
//  RalmDataStructure
//
//  Created by Kohei Kawaguchi on 2019/05/31.
//  Copyright © 2019 Kohei Kawaguchi. All rights reserved.
//

import Foundation

final class DogRepository {
    // 外部から入れる
    private let store = DogStore()
    private let api = GraphQLAPI()
    private let parser = DogParser()
    
    func fetch(id: String) -> Dogable {
        return api.fetch(id: id)
    }
    
    func save(_ entity: Dogable) {
        guard let entity = parser.parse(from: entity) else { return }
        store.save(entity)
    }
}

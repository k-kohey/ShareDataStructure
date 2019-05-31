//
//  EntityStore.swift
//  RalmDataStructure
//
//  Created by Kohei Kawaguchi on 2019/05/31.
//  Copyright © 2019 Kohei Kawaguchi. All rights reserved.
//

import Foundation
import RealmSwift

class RealmEntity: Object, EntityConvertiable {
    @objc dynamic var id = ""
}

final class EntityStore {
    let realm = try! Realm()
    
    func save(_ entity: RealmEntity) {
        try! realm.write {
            realm.add(entity)
        }
    }
    
    func load(id: String) -> RealmEntity {
        return RealmEntity()
    }
}

//
//  EntityStore.swift
//  RalmDataStructure
//
//  Created by Kohei Kawaguchi on 2019/05/31.
//  Copyright © 2019 Kohei Kawaguchi. All rights reserved.
//

import Foundation
import RealmSwift

final class DogStore {
    private let realm = try! Realm()
    
    func save(_ entity: Dog) {
        try! realm.write {
            realm.add(entity)
        }
    }
    
    func load(id: String) -> Dog {
        return Dog()
    }
}

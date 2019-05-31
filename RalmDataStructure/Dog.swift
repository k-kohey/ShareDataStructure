//
//  RealmEntity.swift
//  RalmDataStructure
//
//  Created by Kohei Kawaguchi on 2019/05/31.
//  Copyright © 2019 Kohei Kawaguchi. All rights reserved.
//

import RealmSwift

class Dog: Object, Dogable {
    @objc dynamic var id = ""
}

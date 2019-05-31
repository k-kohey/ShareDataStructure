//
//  GraphQLAPI.swift
//  RalmDataStructure
//
//  Created by Kohei Kawaguchi on 2019/05/31.
//  Copyright © 2019 Kohei Kawaguchi. All rights reserved.
//

import Foundation

final class GraphQLAPI {
    struct GeneratedEntity {
        var id: String
    }
    
    func fetch(id: String) -> GeneratedEntity {
        return GeneratedEntity(id: "")
    }
}

extension GraphQLAPI.GeneratedEntity: EntityConvertiable, Encodable {}

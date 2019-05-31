//
//  GraphQLAPI.swift
//  RalmDataStructure
//
//  Created by Kohei Kawaguchi on 2019/05/31.
//  Copyright © 2019 Kohei Kawaguchi. All rights reserved.
//

import Foundation

final class GraphQLAPI {
    struct Dog {
        var id: String
    }
    
    func fetch(id: String) -> Dog {
        return Dog(id: "")
    }
}

extension GraphQLAPI.Dog: Dogable, Encodable {}

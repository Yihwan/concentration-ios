//
//  Card.swift
//  concentration
//
//  Created by Alter Ego on 2/3/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import Foundation

// structs: no inheritance, structs are VALUE-types (classes are reference-types) with copy-on-write semantics.
struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

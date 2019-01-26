//
//  MCItem.swift
//  BrainPie
//
//  Created by Ahmad Karkouty on 1/26/19.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit
import IGListKit

class MCItem: ListDiffable {
    let id: String
    let answer: String
    
    
    init(id: String, answer: String) {
        self.id = id
        self.answer = answer
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        
        guard let object = object as? MCItem else { return false }
        return id == object.id
    }
}


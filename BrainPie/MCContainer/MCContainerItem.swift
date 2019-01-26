//
//  MCContainerItem.swift
//  BrainPie
//
//  Created by Ahmad Karkouty on 1/26/19.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit
import IGListKit

class MCContainerItem: ListDiffable {
    let id: String
    
    
    init(id: String) {
        self.id = id
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        
        guard let object = object as? MCContainerItem else { return false }
        return id == object.id
    }
}



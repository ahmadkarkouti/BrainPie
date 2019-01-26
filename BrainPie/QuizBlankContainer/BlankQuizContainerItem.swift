//
//  BlankQuizContainerItem.swift
//  BrainPie
//
//  Created by Ahmad Karkouty on 1/26/19.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit
import IGListKit

class BlankQuizContainerItem: ListDiffable {
    let id: String
    let question: String
    
    
    init(id: String, question: String) {
        self.id = id
        self.question = question
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        
        guard let object = object as? BlankQuizContainerItem else { return false }
        return id == object.id
    }
}


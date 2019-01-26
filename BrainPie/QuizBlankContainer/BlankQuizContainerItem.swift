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
    let correct: String
    let option1: String
    let option2: String
    let option3: String
    let option4: String
    
    
    init(id: String, question: String, correct: String, option1: String, option2: String, option3: String, option4: String) {
        self.id = id
        self.question = question
        self.correct = correct
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.option4 = option4
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        
        guard let object = object as? BlankQuizContainerItem else { return false }
        return id == object.id
    }
}


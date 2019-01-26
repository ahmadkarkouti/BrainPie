//
//  ImageQuizContainerItem.swift
//  BrainPie
//
//  Created by Ahmad Karkouty on 1/26/19.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit
import IGListKit

class ImageQuizContainerItem: ListDiffable {
    let id: String
    let image: [String]
    let question: String
    let correct: String
    
    
    init(id: String, image: [String], question: String, correct: String) {
        self.id = id
        self.image = image
        self.question = question
        self.correct = correct
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        
        guard let object = object as? ImageQuizContainerItem else { return false }
        return id == object.id
    }
}


//
//  BlankQuizContainerSectionController.swift
//  BrainPie
//
//  Created by Ahmad Karkouty on 1/26/19.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit
import IGListKit

final class BlankQuizContainerSectionController: ListSectionController {
    
    private var object: BlankQuizContainerItem?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 50)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cellClass: String = BlankQuizContainerCell.reuseIdentifier
        let cell = collectionContext!.dequeueReusableCell(withNibName: cellClass, bundle: Bundle.main, for: self, at: index) as! BlankQuizContainerCell
        
        guard let object = object else { fatalError() }
        
        cell.viewModel = BlankQuizContainerCell.ViewModel(id: object.id, question: object.question, correct: object.correct, option1: object.option1, option2: object.option2, option3: object.option3, option4: object.option4)
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? BlankQuizContainerItem
    }
}


//
//  MCSectionController.swift
//  BrainPie
//
//  Created by Ahmad Karkouty on 1/26/19.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit
import IGListKit

final class MCSectionController: ListSectionController {
    
    private var object: MCItem?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 60)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cellClass: String = MCCell.reuseIdentifier
        let cell = collectionContext!.dequeueReusableCell(withNibName: cellClass, bundle: Bundle.main, for: self, at: index) as! MCCell
        
        guard let object = object else { fatalError() }
        
        cell.viewModel = MCCell.ViewModel(id: object.id, answer: object.answer)
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? MCItem
    }
}


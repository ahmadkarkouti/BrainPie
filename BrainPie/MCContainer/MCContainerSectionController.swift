//
//  MCContainerSectionController.swift
//  BrainPie
//
//  Created by Ahmad Karkouty on 1/26/19.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//
import UIKit
import IGListKit

final class MCContainerSectionController: ListSectionController {
    
    private var object: MCContainerItem?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 454)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cellClass: String = MCContainerCell.reuseIdentifier
        let cell = collectionContext!.dequeueReusableCell(withNibName: cellClass, bundle: Bundle.main, for: self, at: index) as! MCContainerCell
        
        guard let object = object else { fatalError() }
        
        cell.viewModel = MCContainerCell.ViewModel(id: object.id)
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? MCContainerItem
    }
}


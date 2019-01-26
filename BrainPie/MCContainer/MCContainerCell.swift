
//
//  MCContainerCell.swift
//  BrainPie
//
//  Created by Ahmad Karkouty on 1/26/19.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit
import Reusable
import IGListKit

class MCContainerCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: QuizViewController())
    }()
    
    struct ViewModel {
        let id: String
        
    }
    
    var viewModel: ViewModel? {
        didSet {
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }

}

extension MCContainerCell: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return ([MCItem(id: "1", answer: "This is the answer"),
                 MCItem(id: "2", answer: "This is the answer"),
                 MCItem(id: "3", answer: "This is the answer"),
                 MCItem(id: "4", answer: "This is the answer")])
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is MCItem:
            return MCSectionController()
        default:
            return MCSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    
    
}

//
//  QuizViewController.swift
//  BrainPie
//
//  Created by Ahmad Karkouty on 1/26/19.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit
import IGListKit

class QuizViewController: UIViewController {
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.fillSuperview()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
}

extension QuizViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return ([ImageQuizContainerItem(id: "1", image: [#imageLiteral(resourceName: "bread"),#imageLiteral(resourceName: "bread"),#imageLiteral(resourceName: "bread"),#imageLiteral(resourceName: "bread")], question: "What is this food?"),
                 BlankQuizContainerItem(id: "2", question: "What is _______!")]) as [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is ImageQuizContainerItem:
            return ImageQuizContainerSectionController()
        case is BlankQuizContainerItem:
            return BlankQuizContainerSectionController()
        default:
            return ImageQuizContainerSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    
    
}

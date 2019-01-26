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
    
    var objects = [ListDiffable]()
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.fillSuperview()
        collectionView.isPagingEnabled = true
        setupCollectionView()

        for item in QuizEngine.shared.question {
                self.objects.append(MCContainerItem(id: item.question))
        }
            
        self.adapter.reloadData(completion: nil)
        
    }
    
    func setupCollectionView() {
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        
    }
    
}

extension QuizViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return objects
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is MCContainerItem:
            return MCContainerSectionController()
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

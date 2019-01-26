
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
    
    var objects = [ListDiffable]()
    
    @IBOutlet weak var statusLabel: UILabel!
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: QuizViewController())
    }()
    
    struct ViewModel {
        let id: String
        
    }
    
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            objects.removeAll()
            let questions = QuizEngine.shared.question
            
            questions.forEach { (question) in
                if question.question == viewModel.id {
                    switch question.type {
                    case "blank":
                        objects.append(BlankQuizContainerItem(id: question.question, question: question.question, correct: question.answer, option1: question.option1, option2: question.option2, option3: question.option3, option4: question.option4))
                    default:
                        objects.append(ImageQuizContainerItem(id: question.question, image: [question.option1, question.option2, question.option3, question.option4], question: question.question, correct: question.answer))
                    }
                }
            }
            
            self.adapter.reloadData(completion: nil)
            
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
        return objects
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is BlankQuizContainerItem:
            return BlankQuizContainerSectionController()
        case is ImageQuizContainerItem:
            let controller = ImageQuizContainerSectionController()
            controller.didTapInterests = { (selected) -> Void in
                self.statusLabel.text = selected
            }
            return controller
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

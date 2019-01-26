//
//  BlankQuizContainerCell.swift
//  BrainPie
//
//  Created by Ahmad Karkouty on 1/26/19.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit
import Reusable

class BlankQuizContainerCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet weak var questionLabel: UILabel!
    struct ViewModel {
        let id: String
        let question: String
        
    }
    
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else {return}
            questionLabel.text = viewModel.question
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

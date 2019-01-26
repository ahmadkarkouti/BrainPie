//
//  MCCell.swift
//  BrainPie
//
//  Created by Ahmad Karkouty on 1/26/19.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit
import Reusable

class MCCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var answerLabel: UILabel!
    
    struct ViewModel {
        let id: String
        let answer: String
        
    }
    
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else {return}
            answerLabel.text = viewModel.answer
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

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
    
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var optionLabel2: UILabel!
    @IBOutlet weak var optionLabel3: UILabel!
    @IBOutlet weak var optionLabel4: UILabel!
    
    
    @IBOutlet weak var questionLabel: UILabel!
    struct ViewModel {
        let id: String
        let question: String
        let correct: String
        let option1: String
        let option2: String
        let option3: String
        let option4: String
        
    }
    
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else {return}
            questionLabel.text = viewModel.question
            optionLabel.text = viewModel.option1
            optionLabel2.text = viewModel.option2
            optionLabel3.text = viewModel.option3
            optionLabel4.text = viewModel.option4
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func handleAnswer(selected: String) {
        guard let viewModel = viewModel else {return}
        if viewModel.option1 == viewModel.correct {
            optionLabel.alpha = 1
            optionLabel2.alpha = 0.5
            optionLabel3.alpha = 0.5
            optionLabel4.alpha = 0.5
        }
        
        if viewModel.option2 == viewModel.correct {
            optionLabel.alpha = 0.5
            optionLabel2.alpha = 1
            optionLabel3.alpha = 0.5
            optionLabel4.alpha = 0.5
        }
        
        if viewModel.option3 == viewModel.correct {
            optionLabel.alpha = 0.5
            optionLabel2.alpha = 0.5
            optionLabel3.alpha = 1
            optionLabel4.alpha = 0.5
        }
        
        if viewModel.option4 == viewModel.correct {
            optionLabel.alpha = 0.5
            optionLabel2.alpha = 0.5
            optionLabel3.alpha = 0.5
            optionLabel4.alpha = 1
        }
        
    }
    
    @IBAction func firstClicked(_ sender: Any) {
        guard let viewModel = viewModel else {return}
        handleAnswer(selected: viewModel.option1)
    
    }
    
    @IBAction func secondClicked(_ sender: Any) {
        guard let viewModel = viewModel else {return}
        handleAnswer(selected: viewModel.option2)
    }
    
    @IBAction func thirdClicked(_ sender: Any) {
        guard let viewModel = viewModel else {return}
        handleAnswer(selected: viewModel.option3)
    }
    
    @IBAction func fourthClicked(_ sender: Any) {
        guard let viewModel = viewModel else {return}
        handleAnswer(selected: viewModel.option4)
    }
    
    
}

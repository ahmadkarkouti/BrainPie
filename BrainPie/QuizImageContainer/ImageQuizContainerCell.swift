//
//  ImageQuizContainerCell.swift
//  BrainPie
//
//  Created by Ahmad Karkouty on 1/26/19.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit
import Reusable
import SDWebImage

class ImageQuizContainerCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var fourthImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    
    struct ViewModel {
        let id: String
        let question: String
        let images: [String]
        let correct: String
        let didTapItem: (_ selected: String) -> Void?
        
    }
    
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else {return}
            print(viewModel.images)
            firstImage.sd_setImage(with: URL(string: viewModel.images[0]), completed: nil)
            secondImage.sd_setImage(with: URL(string: viewModel.images[1]), completed: nil)
            thirdImage.sd_setImage(with: URL(string: viewModel.images[2]), completed: nil)
            fourthImage.sd_setImage(with: URL(string: viewModel.images[3]), completed: nil)
            questionLabel.text = viewModel.question
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    let available: CGFloat = 1
    let faded: CGFloat = 0.5
    
    func checkAnswer(selected: String) {
        guard let viewModel = viewModel else {return}
        if selected == viewModel.correct {
            viewModel.didTapItem("Correct")
        } else {
            viewModel.didTapItem("Wrong")
        }
        if viewModel.images[0] == viewModel.correct {
            firstImage.alpha = 1
            secondImage.alpha = 0.5
            thirdImage.alpha = 0.5
            fourthImage.alpha = 0.5
        }
        
        if viewModel.images[1] == viewModel.correct {
            firstImage.alpha = 0.5
            secondImage.alpha = 1
            thirdImage.alpha = 0.5
            fourthImage.alpha = 0.5
        }
        
        if viewModel.images[2] == viewModel.correct {
            firstImage.alpha = 0.5
            secondImage.alpha = 0.5
            thirdImage.alpha = 1
            fourthImage.alpha = 0.5
        }
        
        if viewModel.images[3] == viewModel.correct {
            firstImage.alpha = 0.5
            secondImage.alpha = 0.5
            thirdImage.alpha = 0.5
            fourthImage.alpha = 1
        }
        
    }
    
    @IBAction func firstClicked(_ sender: Any) {
        guard let viewModel = viewModel else {return}
        checkAnswer(selected: viewModel.images[0])
    }
    
    @IBAction func secondClicked(_ sender: Any) {
        guard let viewModel = viewModel else {return}
        checkAnswer(selected: viewModel.images[2])
    
    }
    
    @IBAction func thirdClicked(_ sender: Any) {
        guard let viewModel = viewModel else {return}
        checkAnswer(selected: viewModel.images[1])
    }
    
    @IBAction func fourthClicked(_ sender: Any) {
        guard let viewModel = viewModel else {return}
        checkAnswer(selected: viewModel.images[3])
    }
    
    
}

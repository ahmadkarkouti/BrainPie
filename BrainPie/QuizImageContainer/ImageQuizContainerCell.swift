//
//  ImageQuizContainerCell.swift
//  BrainPie
//
//  Created by Ahmad Karkouty on 1/26/19.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit
import Reusable

class ImageQuizContainerCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var fourthImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    struct ViewModel {
        let id: String
        let question: String
        let images: [UIImage]
        
    }
    
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else {return}
            firstImage.image = viewModel.images[0]
            secondImage.image = viewModel.images[1]
            thirdImage.image = viewModel.images[2]
            fourthImage.image = viewModel.images[3]
            questionLabel.text = viewModel.question
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

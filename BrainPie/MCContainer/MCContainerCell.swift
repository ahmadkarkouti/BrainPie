
//
//  MCContainerCell.swift
//  BrainPie
//
//  Created by Ahmad Karkouty on 1/26/19.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit
import Reusable

class MCContainerCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var collectionView: UICollectionView!
    struct ViewModel {
        let id: String
        
    }
    
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else {return}
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

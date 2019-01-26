//
//  LessonsViewController.swift
//  BrainPie
//
//  Created by Franck-Stephane Ndame Mpouli on 26/01/2019.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit

class LessonsViewController: UIViewController {
    
    var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        return iv
    }()
    let lessonsLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    let csButton: UIButton = {
        let btn = UIButton(type: .system)
        return btn
    }()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8862745098, alpha: 1)
        let stackView =  UIStackView(arrangedSubviews: [imageView,lessonsLabel,csButton])
        stackView.distribution = .fill
        stackView.alignment = .center
        view.addSubview(stackView)

        
    }
    
    
}

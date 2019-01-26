//
//  LanguageCollectionViewCell.swift
//  BrainPie
//
//  Created by Franck-Stephane Ndame Mpouli on 26/01/2019.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit

class LanguageCollectionViewCell: UICollectionViewCell {
    
    var languageInfo: UILabel = {
        let str = UILabel()
        str.numberOfLines = 0
        let attributes = setAttributes(string: "Swahilli", size: 50, weight: .heavy, color: .white)
        attributes.append(setAttributes(string: "\nThe most spoken language in Africa", size: 15, weight: .bold, color: .white))
        
        str.attributedText = attributes
        str.textAlignment = .center
        return str
    }()
    
    var startButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .white
        btn.applyShadow(cornerRadius: 25, opacity: 0.05)
        let attributedText = NSMutableAttributedString(string: "Start", attributes: [.font: UIFont.systemFont(ofSize: 22, weight: .bold), .foregroundColor: UIColor.black])
        btn.setAttributedTitle(attributedText, for: .normal)
        return btn
    }()
    var containerView: UIView?
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        containerView = shadowView(withImage: #imageLiteral(resourceName: "course1"))
        guard let cv = containerView else {return}
        addSubview(cv)
        cv.fillSuperview()
        setupViews(cv)
    }
    
    fileprivate func setupViews(_ cv: UIView) {
        let stackview = CustomStackView(arrangedSubviews: [languageInfo, startButton])
        stackview.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5), size: CGSize(width: 260, height: 185))
        cv.addSubview(stackview)
        stackview.centerXAnchor.constraint(equalTo: cv.centerXAnchor, constant: 0).isActive = true
        stackview.centerYAnchor.constraint(equalTo: cv.centerYAnchor, constant: 0).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


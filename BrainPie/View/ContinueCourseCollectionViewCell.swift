//
//  ContinueCourseCollectionViewCell.swift
//  BrainPie
//
//  Created by Franck-Stephane Ndame Mpouli on 26/01/2019.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit

class ContinueCourseCollectionViewCell: UICollectionViewCell {
    
    let countryImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "south-africa")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let countryLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        let attibutes = setAttributes(string: "Afrikaans", size: 19, weight: .bold)
        attibutes.append(setAttributes(string: "\nLevel 1", size: 15, weight: .regular, color: #colorLiteral(red: 0.6941176471, green: 0.6941176471, blue: 0.6941176471, alpha: 1)))
        lbl.attributedText = attibutes
        lbl.textAlignment = .center
        return lbl
    }()
    
    let startButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.clipsToBounds = true
        btn.applyBorder(width: 1.5)
        let attributes = setAttributes(string: "Continue", weight: .bold, color: .lightGray)
        btn.setAttributedTitle(attributes, for: .normal)
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    var containerView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        containerView = shadowView(corner: 5, sRadius: 11, offset: CGSize(width: 0, height: 3), opacity: 0.1)
        guard let containerView = containerView else {return}
        addSubview(containerView)
        containerView.fillSuperview()
        startButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 142).isActive = true
        countryImage.heightAnchor.constraint(equalToConstant: 48).isActive = true
        countryImage.widthAnchor.constraint(equalToConstant: 70).isActive = true
        let stackView = CustomStackView(arrangedSubviews: [countryImage,countryLabel,startButton])
        containerView.addSubview(stackView)
        stackView.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .zero, size: CGSize(width: 160, height: 150))
        stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

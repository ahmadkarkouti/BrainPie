//
//  UIView_extension.swift
//  Deletos
//
//  Created by Franck-Stephane Ndame Mpouli on 24/01/2019.
//  Copyright © 2019 Diet Brain. All rights reserved.
//

import UIKit

struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

extension UIView {
    
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    
    func applyShadow(cornerRadius: CGFloat = 15, shadowRadius: CGFloat = 15, shadowOffset: CGSize = CGSize(width: 0, height: 10), opacity: Float = 0.1) {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = opacity
    }
    
    func shadowView(withImage: UIImage) -> UIView {
        let v = UIView()
        v.applyShadow(opacity: 0.1)
        let inner = UIView()
        inner.applyShadow(opacity: 0)
        inner.clipsToBounds = true
        inner.backgroundColor = .green
        v.addSubview(inner)
        inner.fillSuperview()
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = withImage
        inner.addSubview(iv)
        iv.fillSuperview()
        return v
    }
    
    func shadowView(corner: CGFloat = 15, sRadius: CGFloat = 15, offset: CGSize = CGSize.init(width: 0, height: 10), opacity: Float = 0.1) -> UIView {
        let v = UIView()
        v.applyShadow(cornerRadius: corner, shadowRadius: sRadius, shadowOffset: offset, opacity: opacity)
        let inner = UIView()
        inner.applyShadow(cornerRadius: corner, opacity: 0)
        inner.clipsToBounds = true
        inner.backgroundColor = .white
        v.addSubview(inner)
        inner.fillSuperview()
        return v
    }
    
    func applyBorder(color: CGColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1), width: CGFloat = 1) {
        self.layer.borderColor = color
        self.layer.borderWidth = width
    }
    
    
    
}


class CustomStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.distribution = .fill
        self.alignment = .center
        self.axis = .vertical
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension Optional where Wrapped == String {
    
    func unwrap(defaultValue: String = "") -> String {
        return self ?? defaultValue
    }
}

func setAttributes(string: String, size: CGFloat = 17, weight: UIFont.Weight = .regular, color: UIColor = .black) -> NSMutableAttributedString {
    let attributedText = NSMutableAttributedString(string: string, attributes: [.font: UIFont.systemFont(ofSize: size, weight: weight), .foregroundColor: color])
    
    return attributedText
}



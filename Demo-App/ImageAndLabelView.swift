//
//  ImageAndLabelView.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 01/04/23.
//

import UIKit

class ImageAndLabelView: UIView {

        let stackView: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.alignment = .center
            stack.spacing = 8
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
    
        let spacing = UIView()
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor,multiplier: 0.8).isActive = true
            return imageView
        }()
        
        let label:  UILabel = {
            let label = UILabel()
            label.text = "Help Centre"
            label.lineBreakMode = .byWordWrapping
            label.textColor = .black
            label.adjustsFontSizeToFitWidth = true
            label.font = UIFont.systemFont(ofSize: 29, weight: .light)
            
            let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
            label.font = fontMetrics.scaledFont(for: label.font)
            label.adjustsFontForContentSizeCategory = true
            
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor,multiplier: 0.7).isActive = true
        return imageView
    }()
    
    let trailingspace = UIView()
        
    init(image: UIImage?, text: String) {
        super.init(frame: .zero)
        imageView.image = image
        label.text = text
        
        imageView.alpha = 0.4
        
        stackView.addArrangedSubview(spacing)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(chevronImageView)
        stackView.addArrangedSubview(trailingspace)
        
        addSubview(stackView)
        
        
        stackView.distribution = .fill
        
        spacing.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: bounds.height * 0.05),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bounds.height * 0.05),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: bounds.width * 0.05),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -bounds.width * 0.05),
            
            spacing.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.02),
            imageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            trailingspace.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.02)
        ])
    }
    
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

//
//  ProfileView.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 01/04/23.
//

import UIKit

class ProfileView: UIView {
    
    
    
     let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image6")
         imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
     let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let editButton : UIButton = {
        let button = UIButton()
        button.configuration = .borderless()
        button.configuration?.baseBackgroundColor = UIColor(named: "book")
        button.configuration?.baseForegroundColor = .black
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
     func setupView() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(editButton)
        
        let stackView = UIStackView(arrangedSubviews: [imageView, nameLabel, editButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
           // imageView.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.4),
           // imageView.heightAnchor.constraint(equalTo: widthAnchor,multiplier: 0.4),
            
            editButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            editButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
        ])
         
        
    }
}


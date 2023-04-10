//
//  SpecialistCell.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 12/03/23.
//

import UIKit

class SpecialistCell: UICollectionViewCell {
    
    static let identifier = "SpecialistCell"
    
    let departmentImage : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "heart")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let departmentName :  UILabel = {
        let label = UILabel()
       
        label.lineBreakMode = .byTruncatingTail
        label.textColor = .black
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setConstrains()
    }
    
    
    func setConstrains(){
        contentView.addSubview(departmentImage)
        contentView.addSubview(departmentName)
       
        
        layer.cornerRadius = 10
        layer.shadowColor = UIColor(named: "shadow")?.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 5
         
         contentView.backgroundColor = UIColor(named: "white")
         contentView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            departmentImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            departmentImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            departmentImage.widthAnchor.constraint(equalTo: contentView.widthAnchor ,constant: -10),
            departmentImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
            departmentImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5)
        ])
        
        departmentImage.backgroundColor = UIColor(named: "white")
        
        NSLayoutConstraint.activate([
            departmentName.topAnchor.constraint(equalTo: departmentImage.bottomAnchor),
          //  departmentName.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1),
            departmentName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            departmentName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            departmentName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        
        contentView.sizeToFit()
    }
}

class CollectionHeaderView: UICollectionReusableView {
    static let identifier = "header"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setConstrains()
    }
    
    let title :  UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func setConstrains(){
          
        addSubview(title)
        title.backgroundColor = UIColor(named: "white")
        
        layer.cornerRadius = 10
        layer.shadowColor = UIColor(named: "shadow")?.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 5
        
        clipsToBounds = true
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

class CollectionFooterView: UICollectionReusableView {
    
    static let identifier = "footer"
    
    let button : UIButton = {
       let button = UIButton()
        button.configuration = .borderedTinted()
        button.setTitle("View All Specialist", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setConstrains()
    }
    
    func setConstrains(){
        addSubview(button)
        
        
        layer.cornerRadius = 10
        layer.shadowColor = UIColor(named: "shadow")?.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 5
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            button.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10)
        ])
        
    }
}


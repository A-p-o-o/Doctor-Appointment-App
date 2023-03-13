//
//  SpecialistCell.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 12/03/23.
//

import UIKit

class SpecialistCell: UICollectionViewCell {
    
    static let identifier = "SpecialistCell"
    
    let doctorImage : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "image6")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let departmentName : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Department Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let departDescription : UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "Avenir next", size: 16)
        label.text = "Book appointment for bleeding gums, toothache, cavities and more "
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
        addSubview(doctorImage)
        addSubview(departmentName)
        addSubview(departDescription)
        
       
        
        NSLayoutConstraint.activate([
           doctorImage.topAnchor.constraint(equalTo: topAnchor),
           doctorImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
           doctorImage.widthAnchor.constraint(equalTo: widthAnchor),
           doctorImage.leadingAnchor.constraint(equalTo: leadingAnchor),
           doctorImage.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            departmentName.topAnchor.constraint(equalTo: doctorImage.bottomAnchor),
           departmentName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
           departmentName.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
           departmentName.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            departDescription.topAnchor.constraint(equalTo: departmentName.bottomAnchor),
           departDescription.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
           departDescription.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
           departDescription.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10)
        ])
        
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
    
    let title : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Title"
        label.font = UIFont(name: "Avenir next", size: 25)
        label.textAlignment = .center
        label.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func setConstrains(){
          
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            title.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10)
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
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            button.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10)
        ])
        
    }
}


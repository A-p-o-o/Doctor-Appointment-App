//
//  DoctorCell.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 12/03/23.
//

import UIKit

class DoctorCell: UICollectionViewCell {
    
    static let identifier = "DoctorCell"
    
    let imageview : UIImageView = {
        let imageView = UIImageView()
         imageView.image = UIImage(named: "image6")
         imageView.contentMode = .scaleAspectFill
         //imageView.layer.cornerRadius = 10
         imageView.clipsToBounds = true
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()
    
    let name : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let department: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Department"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let experience : UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont(name: "Avenir next", size: 15)
        label.text = "2 years of experience"
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
        addSubview(imageview)
        addSubview(name)
        addSubview(department)
        addSubview(experience)
        
        
        
        NSLayoutConstraint.activate([
            imageview.topAnchor.constraint(equalTo: topAnchor),
            imageview.heightAnchor.constraint(equalTo: heightAnchor),
            imageview.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageview.widthAnchor.constraint(equalTo: heightAnchor)
        ])
        
        imageview.layer.borderWidth = 2
        imageview.layer.borderColor = UIColor(red: 1.0, green: 0.84, blue: 0.0, alpha: 1.0).cgColor
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: topAnchor),
            name.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.33),
            name.leadingAnchor.constraint(equalTo: imageview.trailingAnchor,constant: 10),
            name.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            department.topAnchor.constraint(equalTo: name.bottomAnchor),
            department.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.33),
            department.leadingAnchor.constraint(equalTo: imageview.trailingAnchor,constant: 10),
            department.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            experience.topAnchor.constraint(equalTo: department.bottomAnchor),
            experience.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.33),
            experience.leadingAnchor.constraint(equalTo: imageview.trailingAnchor,constant: 10),
            experience.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
}

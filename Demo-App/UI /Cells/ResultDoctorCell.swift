//
//  ResultDoctorCell.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 13/03/23.
//

import UIKit

class ResultDoctorCell: UITableViewCell {
    
    static let identifier = "ResultDoctorCell"
    let profile : UIImageView = {
        let imageView = UIImageView()
         imageView.image = UIImage(named: "image6")
         imageView.contentMode = .scaleAspectFill

         imageView.clipsToBounds = true
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()
    
    let name : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.text = "Name"
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let department: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.text = "Department"
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let experience : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Avenir next", size: 15)
        label.adjustsFontSizeToFitWidth = true
        label.text = "2 years of experience"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstrains()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setConstrains()
    }
    
    func setConstrains(){
        
        contentView.addSubview(profile)
        contentView.addSubview(name)
        contentView.addSubview(department)
        contentView.addSubview(experience)
        
        
        
        NSLayoutConstraint.activate([
            profile.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            profile.heightAnchor.constraint(equalTo: contentView.heightAnchor,constant: -10),
            profile.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            profile.widthAnchor.constraint(equalTo: contentView.heightAnchor,constant: -10),
            profile.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5)
        ])
        
        profile.layer.borderWidth = 2
        profile.layer.borderColor = UIColor(red: 1.0, green: 0.84, blue: 0.0, alpha: 1.0).cgColor
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            name.heightAnchor.constraint(equalTo: contentView.heightAnchor,multiplier: 0.33),
            name.leadingAnchor.constraint(equalTo: profile.trailingAnchor,constant: 10),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            department.topAnchor.constraint(equalTo: name.bottomAnchor),
            department.heightAnchor.constraint(equalTo: contentView.heightAnchor,multiplier: 0.33),
            department.leadingAnchor.constraint(equalTo: profile.trailingAnchor,constant: 10),
            department.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            experience.topAnchor.constraint(equalTo: department.bottomAnchor),
            //experience.heightAnchor.constraint(equalTo: contentView.heightAnchor,multiplier: 0.33),
            experience.leadingAnchor.constraint(equalTo: profile.trailingAnchor,constant: 10),
            experience.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            experience.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5)
        ])
    }
    
}

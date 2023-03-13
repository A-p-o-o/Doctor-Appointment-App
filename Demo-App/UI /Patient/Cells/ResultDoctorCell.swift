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
        label.textColor = .black
        label.text = "Name"
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let department: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Department"
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let experience : UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
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
        
        addSubview(profile)
        addSubview(name)
        addSubview(department)
        addSubview(experience)
        
        
        
        NSLayoutConstraint.activate([
            profile.topAnchor.constraint(equalTo: topAnchor),
            profile.heightAnchor.constraint(equalTo: heightAnchor),
            profile.leadingAnchor.constraint(equalTo: leadingAnchor),
            profile.widthAnchor.constraint(equalTo: heightAnchor)
        ])
        
        profile.layer.borderWidth = 2
        profile.layer.borderColor = UIColor(red: 1.0, green: 0.84, blue: 0.0, alpha: 1.0).cgColor
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: topAnchor),
            name.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.33),
            name.leadingAnchor.constraint(equalTo: profile.trailingAnchor,constant: 10),
            name.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            department.topAnchor.constraint(equalTo: name.bottomAnchor),
            department.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.33),
            department.leadingAnchor.constraint(equalTo: profile.trailingAnchor,constant: 10),
            department.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            experience.topAnchor.constraint(equalTo: department.bottomAnchor),
            experience.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.33),
            experience.leadingAnchor.constraint(equalTo: profile.trailingAnchor,constant: 10),
            experience.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}

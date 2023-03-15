//
//  DoctorProfile.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 15/03/23.
//

import UIKit

class DoctorProfile: UIView {
    
    let doctor : Doctor?

    let photo : UIImageView = {
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
        label.text = "Dr. Naveen Kumar Dugar "
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "Avenir Next", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
       // label.backgroundColor = .red
        return label
    }()
    
    let department : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.text = "Department"
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
       // label.backgroundColor = .blue
        return label
    }()
    
    let experience :  UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Avenir next", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.text = "2 years of experience"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
     init(doctor : Doctor) {
         self.doctor = doctor
         super.init(frame: .zero)
         setViews()
    }
    
    required init?(coder: NSCoder) {
        self.doctor = nil
        super.init(coder: coder)
    }
    
    
    
    func setViews(){
        
        addSubview(photo)
        addSubview(name)
        addSubview(department)
        addSubview(experience)
        
        name.text = "Dr \(doctor!.name)"
        department.text = "\(doctor!.department)".uppercased()
        experience.text = "\(doctor!.experience) years of experience"
        
        
        
        NSLayoutConstraint.activate([
            photo.centerYAnchor.constraint(equalTo: centerYAnchor),
            photo.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            photo.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
        
        
        photo.layer.cornerRadius = (bounds.height)  * 0.8 / 2
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            name.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            name.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35)
        ])
        
        
        
        NSLayoutConstraint.activate([
            department.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            department.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            department.topAnchor.constraint(equalTo: name.bottomAnchor,constant: -10),
            department.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35)
        ])
        
        NSLayoutConstraint.activate([
            experience.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            experience.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            experience.topAnchor.constraint(equalTo: department.bottomAnchor,constant: -10),
            experience.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
        ])
        
        

    }
}

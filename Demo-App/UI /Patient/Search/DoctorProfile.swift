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
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let department : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.text = "Department"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    let experience = LabelImageLabel()
    let patients = LabelImageLabel()
    let rating = LabelImageLabel()
    
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
        addSubview(patients)
        addSubview(rating)
        
        name.text = "Dr \(doctor!.name)"
        department.text = "\(doctor!.department)".uppercased()
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: topAnchor),
            photo.centerXAnchor.constraint(equalTo: centerXAnchor),
            photo.heightAnchor.constraint(equalTo : heightAnchor,multiplier: 0.5),
            photo.widthAnchor.constraint(equalTo : heightAnchor,multiplier: 0.5),
        ])
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: photo.bottomAnchor,constant: 10),
            name.centerXAnchor.constraint(equalTo: centerXAnchor),
            name.heightAnchor.constraint(equalTo : heightAnchor,multiplier: 0.0),
            name.widthAnchor.constraint(equalTo : heightAnchor,multiplier: 0.0),
        ])
        
        NSLayoutConstraint.activate([
            department.topAnchor.constraint(equalTo: name.bottomAnchor,constant: 10),
            department.centerXAnchor.constraint(equalTo: centerXAnchor),
            department.heightAnchor.constraint(equalTo : heightAnchor,multiplier: 0.0),
            department.widthAnchor.constraint(equalTo : heightAnchor,multiplier: 0.0),
        ])
        
        NSLayoutConstraint.activate([
            experience.bottomAnchor.constraint(equalTo: department.bottomAnchor,constant: -10),
            experience.leadingAnchor.constraint(equalTo: leadingAnchor),
            experience.heightAnchor.constraint(equalTo : heightAnchor,multiplier: 0.0),
            experience.widthAnchor.constraint(equalTo : heightAnchor,multiplier: 0.0),
        ])
        
        NSLayoutConstraint.activate([
            patients.bottomAnchor.constraint(equalTo: department.bottomAnchor,constant: -10),
            patients.leadingAnchor.constraint(equalTo: experience.trailingAnchor,constant: 20),
            patients.heightAnchor.constraint(equalTo : heightAnchor,multiplier: 0.0),
            patients.widthAnchor.constraint(equalTo : heightAnchor,multiplier: 0.0),
        ])
        
        NSLayoutConstraint.activate([
            rating.bottomAnchor.constraint(equalTo: department.bottomAnchor,constant: -10),
            rating.leadingAnchor.constraint(equalTo: patients.trailingAnchor,constant: 20),
            rating.heightAnchor.constraint(equalTo : heightAnchor,multiplier: 0.0),
            rating.widthAnchor.constraint(equalTo : heightAnchor,multiplier: 0.0),
        ])
        
        
    }
}

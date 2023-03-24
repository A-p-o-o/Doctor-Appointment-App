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
        label.textAlignment = .center
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
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print(frame.height)
    }
    
    
    
    func setViews(){
        
        addSubview(photo)
        addSubview(name)
        addSubview(department)
        addSubview(stack)
        
        name.text = "Dr \(doctor!.name)"
        department.text = "\(doctor!.department)".uppercased()
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: topAnchor),
            photo.centerXAnchor.constraint(equalTo: centerXAnchor),
            photo.heightAnchor.constraint(equalTo : heightAnchor,multiplier: 0.65),
            photo.widthAnchor.constraint(equalTo : heightAnchor,multiplier: 0.65),
        ])
        
        photo.layer.cornerRadius = photo.frame.width / 2
        
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: photo.bottomAnchor,constant: 10),
            name.centerXAnchor.constraint(equalTo: centerXAnchor),
            name.heightAnchor.constraint(equalTo : heightAnchor,multiplier: 0.06),
            name.widthAnchor.constraint(equalTo : widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            department.topAnchor.constraint(equalTo: name.bottomAnchor,constant: 10),
            department.centerXAnchor.constraint(equalTo: centerXAnchor),
            department.heightAnchor.constraint(equalTo : heightAnchor,multiplier: 0.06),
            department.widthAnchor.constraint(equalTo : widthAnchor),
        ])
        
       
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: department.bottomAnchor,constant: 10),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            stack.bottomAnchor.constraint(equalTo : bottomAnchor,constant: -10),
        ])
        
        stack.addArrangedSubview(experience)
        stack.addArrangedSubview(patients)
        stack.addArrangedSubview(rating)
        
        patients.titleLabel.text = "Patients"
        patients.infoLabel.text = "480+"
        patients.image.image = UIImage(systemName: "person.3.fill")!.withTintColor(.blue, renderingMode: .alwaysOriginal)
        
        rating.titleLabel.text = "Rating"
        rating.infoLabel.text = "3.5"
        rating.image.image = UIImage(systemName: "star.fill")!.withTintColor(UIColor(named: "ratings")!, renderingMode: .alwaysOriginal)
    }
}

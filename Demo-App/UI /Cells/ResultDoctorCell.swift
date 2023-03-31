//
//  ResultDoctorCell.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 13/03/23.
//

import UIKit

class ResultDoctorCell: UICollectionViewCell{
    
    static let identifier = "ResultDoctorCell"
    let profile : UIImageView = {
        let imageView = UIImageView()
         imageView.image = UIImage(named: "image6")
         imageView.contentMode = .scaleAspectFit

         imageView.clipsToBounds = true
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()
    
    let name : UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let department: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.textColor = .darkGray
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let experience : UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.textColor = .darkGray
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 14, weight: .ultraLight)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
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
        
        contentView.addSubview(profile)
        contentView.addSubview(name)
        contentView.addSubview(department)
        contentView.addSubview(experience)
        
        let heightSpacing = contentView.frame.height * 0.04
        let widthSpacing = contentView.frame.width * 0.02
        
        
        NSLayoutConstraint.activate([
          
            profile.heightAnchor.constraint(equalTo: contentView.heightAnchor,constant:  -5),
            profile.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: widthSpacing),
            profile.widthAnchor.constraint(equalTo: contentView.heightAnchor,constant: -5),
            profile.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        profile.layer.borderWidth = 2
        profile.layer.borderColor = UIColor(named: "radius")?.cgColor

        
        
        


        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: contentView.topAnchor,constant: heightSpacing),
            name.heightAnchor.constraint(greaterThanOrEqualTo: contentView.heightAnchor,multiplier: 0.33),
            name.leadingAnchor.constraint(equalTo: profile.trailingAnchor,constant: widthSpacing),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -widthSpacing)
        ])
        
        NSLayoutConstraint.activate([
            department.topAnchor.constraint(equalTo: name.bottomAnchor,constant: heightSpacing),
            department.heightAnchor.constraint(greaterThanOrEqualTo: contentView.heightAnchor,multiplier: 0.28),
            department.leadingAnchor.constraint(equalTo: profile.trailingAnchor,constant: widthSpacing),
            department.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -widthSpacing)
        ])

        NSLayoutConstraint.activate([
            experience.topAnchor.constraint(equalTo: department.bottomAnchor,constant: heightSpacing/2),
           
            experience.leadingAnchor.constraint(equalTo: profile.trailingAnchor,constant: widthSpacing),
            experience.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -widthSpacing),
            experience.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -(2*heightSpacing))
        ])
        
        
        profile.layer.cornerRadius = 5
        profile.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        profile.layer.shadowOpacity = 0.8
        profile.layer.shadowOffset = CGSize(width: 4, height: 4)
        profile.layer.shadowRadius = 5
        
        name.layer.cornerRadius = 5
        name.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        name.layer.shadowOpacity = 0.8
        name.layer.shadowOffset = CGSize(width: 4, height: 4)
        name.layer.shadowRadius = 5
        
        department.layer.cornerRadius = 5
        department.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        department.layer.shadowOpacity = 0.8
        department.layer.shadowOffset = CGSize(width: 4, height: 4)
        department.layer.shadowRadius = 5

        
        experience.layer.cornerRadius = 5
        experience.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        experience.layer.shadowOpacity = 0.8
        experience.layer.shadowOffset = CGSize(width: 4, height: 4)
        experience.layer.shadowRadius = 5
    }
    
}

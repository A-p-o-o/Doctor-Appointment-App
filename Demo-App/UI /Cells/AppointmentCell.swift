//
//  AppointmentCell.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 21/03/23.
//

import UIKit

class AppointmentCell: UITableViewCell {
    
    static let identifier = "AppointmentCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    let doctorImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = imageView.frame.height / 2
         imageView.clipsToBounds = true
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()
    
    let doctorName : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let department :  UILabel = {
        let label = UILabel()
        label.text = "DepartMent"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let type :  UILabel = {
        let label = UILabel()
        label.text = "Physical"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .red
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let time : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 1
        label.text = "Date : dd:MM:yyyy"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    func setConstrains(){
        
        contentView.addSubview(doctorImage)
        contentView.addSubview(doctorName)
        contentView.addSubview(time)
        contentView.addSubview(department)
        contentView.addSubview(type)
        
        let widthSpacing = contentView.frame.width * 0.02
        let heightSpacing = contentView.frame.height * 0.08
        
        let width = contentView.frame.width * 0.23
        let labelWidth = contentView.frame.width * 0.55
        
        NSLayoutConstraint.activate([
            doctorImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            doctorImage.heightAnchor.constraint(equalToConstant: width),
            doctorImage.widthAnchor.constraint(equalToConstant: width),
            doctorImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: widthSpacing)
        ])
        
        doctorImage.layer.cornerRadius = width / 2
        doctorImage.layer.borderWidth = 2
        doctorImage.layer.borderColor = UIColor(named: "radius")?.cgColor
        
        NSLayoutConstraint.activate([
            doctorName.leadingAnchor.constraint(equalTo: doctorImage.trailingAnchor, constant: widthSpacing),
            doctorName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: heightSpacing),
            doctorName.widthAnchor.constraint(equalToConstant: labelWidth),
            doctorName.bottomAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
           time.leadingAnchor.constraint(equalTo: doctorImage.trailingAnchor, constant: widthSpacing),
           time.topAnchor.constraint(equalTo: doctorName.bottomAnchor, constant: heightSpacing),
           time.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -widthSpacing),
           time.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -heightSpacing)
        ])
        
        NSLayoutConstraint.activate([
            department.leadingAnchor.constraint(equalTo: doctorName.trailingAnchor, constant: widthSpacing),
            department.topAnchor.constraint(equalTo: contentView.topAnchor, constant: heightSpacing),
            department.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -widthSpacing),
            department.bottomAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            type.leadingAnchor.constraint(equalTo: department.leadingAnchor),
            type.topAnchor.constraint(equalTo: department.bottomAnchor, constant: heightSpacing),
            type.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -widthSpacing),
            type.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -heightSpacing)
        ])
    }
    
}

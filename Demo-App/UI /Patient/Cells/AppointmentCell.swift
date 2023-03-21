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
         imageView.image = UIImage(named: "image6")
         imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.height / 2
         imageView.clipsToBounds = true
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()
    
    let doctorName : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.text = "Name : ********    Department : ********"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
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
        
        
        let widthEdge = contentView.frame.width * 0.02
        let heightEdge = contentView.frame.height * 0.08
        
        let width = contentView.frame.width * 0.23
        
        
        NSLayoutConstraint.activate([
            doctorImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            doctorImage.heightAnchor.constraint(equalToConstant: width),
            doctorImage.widthAnchor.constraint(equalToConstant: width),
            doctorImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: widthEdge)
        ])
        
        doctorImage.layer.cornerRadius = width / 2
        
        
        NSLayoutConstraint.activate([
            doctorName.leadingAnchor.constraint(equalTo: doctorImage.trailingAnchor, constant: widthEdge),
            doctorName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: heightEdge),
            doctorName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -widthEdge),
            doctorName.bottomAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
           time.leadingAnchor.constraint(equalTo: doctorImage.trailingAnchor, constant: widthEdge),
           time.topAnchor.constraint(equalTo: doctorName.bottomAnchor, constant: heightEdge),
           time.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -widthEdge),
           time.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -heightEdge)
        ])
        
        
    }
    
}

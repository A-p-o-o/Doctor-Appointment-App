//
//  DateAndPatientsCell.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 03/04/23.
//

import UIKit

class DateAndPatientsCell: UICollectionViewCell {
    
    static let identifier = "DateAndPatientsCell"
    
    let leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "calendar.badge.clock")?.withTintColor(UIColor(named: "book")!, renderingMode: .alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let leftTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.2")?.withTintColor(UIColor(named: "book")!, renderingMode: .alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let rightTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "No. of Appointments"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        
        let height = frame.height
        let width = frame.width
        
        let heightSpacing = height * 0.05
        let widthSpacing = width * 0.02
        
        addSubview(leftImageView)
        addSubview(leftTitleLabel)
        addSubview(rightImageView)
        addSubview(rightTitleLabel)
        
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.shadowColor = UIColor(named: "shadow")?.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 5
        
        backgroundColor = .white
        
        NSLayoutConstraint.activate([
            leftImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: widthSpacing),
            leftImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftImageView.widthAnchor.constraint(equalToConstant: (height - (4 * widthSpacing))),
            leftImageView.heightAnchor.constraint(equalToConstant: (height - (4 * widthSpacing))),
            
            leftTitleLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: widthSpacing),
            leftTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: heightSpacing),
            leftTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -heightSpacing),
            leftTitleLabel.trailingAnchor.constraint(equalTo: centerXAnchor),
            
            
            rightImageView.leadingAnchor.constraint(equalTo: centerXAnchor, constant: widthSpacing),
            rightImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightImageView.widthAnchor.constraint(equalToConstant: (height - (4 * widthSpacing))),
            rightImageView.heightAnchor.constraint(equalToConstant: (height - (4 * widthSpacing))),
            
            rightTitleLabel.leadingAnchor.constraint(equalTo: rightImageView.trailingAnchor,constant: widthSpacing),
            rightTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: heightSpacing),
            rightTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -heightSpacing),
            rightTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -widthSpacing),
        ])
        
    }
}

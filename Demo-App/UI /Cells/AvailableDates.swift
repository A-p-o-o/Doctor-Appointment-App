//
//  AvailableDates.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 14/03/23.
//

import UIKit

class AvailableDates: UICollectionViewCell {
    
    static let identifier = "availableDates"
    
    

    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Subtitle"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let infoLabel : UILabel = {
        let label = UILabel()
        label.text = "Info"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViews()
    }
    
    override func prepareForReuse() {
        layer.borderWidth = 0.0
        layer.borderColor = nil
    }
    
    
   func setViews(){
      
       contentView.addSubview(titleLabel)
       contentView.addSubview(infoLabel)
       
       backgroundColor = .white
       layer.shadowColor = UIColor(named: "shadow")?.cgColor
       layer.shadowOpacity = 0.7
       layer.shadowOffset = CGSize(width: 2, height: 2)
       layer.shadowRadius = 5
       layer.cornerRadius = 10
       
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
       
       NSLayoutConstraint.activate([
        infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
        infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
       ])

    }
}

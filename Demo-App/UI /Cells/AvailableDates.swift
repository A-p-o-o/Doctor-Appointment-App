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
      
       addSubview(titleLabel)
        addSubview(infoLabel)
       
       
       
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
       
       NSLayoutConstraint.activate([
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            infoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
       ])

    }
}

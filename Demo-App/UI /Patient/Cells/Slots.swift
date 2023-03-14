//
//  Slots.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 14/03/23.
//

import UIKit

class Slots: UICollectionViewCell {
    
    static let identifier = "SlotsCell"
   
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Time"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        
        label.clipsToBounds = true
       
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setviews()
    }
    
    func setviews(){
        contentView.addSubview(titleLabel)
        
        layer.cornerRadius = 10
        backgroundColor = .white.withAlphaComponent(0.5)
        clipsToBounds = true
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5)
        ])
    }
    
    
}

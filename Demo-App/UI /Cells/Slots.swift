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
        label.text = "dd-MM-yyyy"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .center
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
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
    
    override func prepareForReuse() {
        layer.borderWidth = 0.0
        layer.borderColor = nil
    }
    
    func setviews(){
        contentView.addSubview(titleLabel)
        
        layer.shadowColor = UIColor(named: "shadow")?.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 5
        layer.cornerRadius = 10
        
        backgroundColor = .white
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5)
        ])
    }
    
    
}

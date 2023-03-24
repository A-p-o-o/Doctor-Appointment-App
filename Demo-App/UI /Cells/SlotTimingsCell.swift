//
//  SlotTimingsCell.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 22/03/23.
//

import UIKit

class SlotTimingsCell: UICollectionViewCell {
    
    static let identifier = "SlotTimingsCell"
    
    
    let slotNoLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 1
        label.text = "Slot No"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startTimeLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 1
        label.text = "Start Time : 09:30-AM"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let endTimeLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 1
        label.text = "End Time : 09:30-AM"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstrains(){
        contentView.addSubview(slotNoLabel)
        contentView.addSubview(startTimeLabel)
        contentView.addSubview(endTimeLabel)
        
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 5
        
        let heightspace = contentView.frame.height * 0.025
        let widthspace = contentView.frame.width * 0.1
        
        let slotNoHeight = contentView.frame.height * 0.35
        
        NSLayoutConstraint.activate([
            slotNoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: heightspace),
            slotNoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: widthspace),
            slotNoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -widthspace),
            slotNoLabel.heightAnchor.constraint(equalToConstant: slotNoHeight)
        ])
        
        let timeHeight = contentView.frame.height * 0.275
        
        NSLayoutConstraint.activate([
            startTimeLabel.topAnchor.constraint(equalTo: slotNoLabel.bottomAnchor, constant: heightspace),
            startTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: widthspace),
            startTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -widthspace),
            startTimeLabel.heightAnchor.constraint(equalToConstant: timeHeight)
        ])
        
        NSLayoutConstraint.activate([
            endTimeLabel.topAnchor.constraint(equalTo: startTimeLabel.bottomAnchor, constant: heightspace),
            endTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: widthspace),
            endTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -widthspace),
            endTimeLabel.heightAnchor.constraint(equalToConstant: timeHeight)
        ])

    }
}

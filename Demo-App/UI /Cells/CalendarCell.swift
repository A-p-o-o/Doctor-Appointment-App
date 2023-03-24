//
//  CalendarCell.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 22/03/23.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    
    static let identifier = "CalendarCell"
    
    
    let month : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 1
        label.text = "Month"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = .systemGreen.withAlphaComponent(0.5)
        label.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let date : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 1
        label.text = "Date : dd:MM:yyyy"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
       
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let day : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Date : dd:MM:yyyy"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let availability : UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "closed"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
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
        
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemBlue.cgColor
        
        contentView.addSubview(month)
        contentView.addSubview(date)
        contentView.addSubview(day)
        contentView.addSubview(availability)
        
        
        
        
        let halfheight = contentView.frame.height * 0.5

        NSLayoutConstraint.activate([
            month.topAnchor.constraint(equalTo: contentView.topAnchor),
            month.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            month.heightAnchor.constraint(equalToConstant: halfheight * 0.5)
        ])
        NSLayoutConstraint.activate([
            date.topAnchor.constraint(equalTo: month.bottomAnchor),
            date.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            date.heightAnchor.constraint(equalToConstant: halfheight * 0.8)
        ])
        
        date.font = UIFont.systemFont(ofSize: halfheight, weight: .bold)
        
        NSLayoutConstraint.activate([
            day.topAnchor.constraint(equalTo: date.bottomAnchor),
            day.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            day.heightAnchor.constraint(equalToConstant: halfheight * 0.25)
        ])
        
        NSLayoutConstraint.activate([
            availability.topAnchor.constraint(equalTo: day.bottomAnchor),
            availability.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            availability.heightAnchor.constraint(equalToConstant: halfheight * 0.45)
        ])
        
        contentView.backgroundColor = .systemGreen.withAlphaComponent(0.1)
    }
    
}

//
//  PatientCell.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 04/04/23.
//

import UIKit

class PatientCell: UICollectionViewCell {
    
    static let identifier = "PatientCell"
    
    let stackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let imageview : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "patient")
         imageView.contentMode = .scaleAspectFit
         imageView.clipsToBounds = true
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()
    
    let name : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .headline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timing : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        let fontMetrics = UIFontMetrics(forTextStyle: .headline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let appointmentType :  UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        let fontMetrics = UIFontMetrics(forTextStyle: .headline)
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
        
        let heightSpacing = frame.height * 0.03
        let widthSpacing = frame.width * 0.03
        
        contentView.addSubview(stackView)
        stackView.spacing = heightSpacing
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: heightSpacing),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: widthSpacing),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -widthSpacing),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -heightSpacing)
        ])
        
        
        
        stackView.addArrangedSubview(imageview)
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(timing)
        stackView.addArrangedSubview(appointmentType)
        
        NSLayoutConstraint.activate([
            imageview.heightAnchor.constraint(equalToConstant: frame.height * 0.425),
            imageview.widthAnchor.constraint(equalToConstant: frame.height * 0.425),
            timing.heightAnchor.constraint(equalToConstant: frame.height * 0.141),
            appointmentType.heightAnchor.constraint(equalToConstant: frame.height * 0.141)
        ])
        
        imageview.layer.cornerRadius = (frame.height * 0.425) / 2
        
        layer.cornerRadius = 10
        layer.shadowColor = UIColor(named: "shadow")?.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 5
        backgroundColor = .white
    }
    
    func online(){
        appointmentType.textColor = .green
        appointmentType.text = "Online"
    }
    
    func Offline(){
        appointmentType.textColor = .red
        appointmentType.text = "Physical"
    }
    
}

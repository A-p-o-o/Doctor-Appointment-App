//
//  SurgeryView.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 10/03/23.
//

import UIKit

class SurgeryView: UIView {
    
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.text = "Safe and Secure surgeries by Expert Surgeons "
        label.font = UIFont(name: "futura", size: 25)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView = UIStackView()
    
    let image1 : UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "image")
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 35
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    
    let image2 : UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "image")
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 35
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    let image3 : UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "image")
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 35
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    let plusLabel : UILabel = {
        let label = UILabel()
        label.text = "20+"
        label.font = UIFont(name: "futura", size: 30)
        label.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        label.textAlignment = .center
        label.layer.cornerRadius = 35
        label.clipsToBounds = true
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    
    let leftLabel : UILabel = {
        let label = UILabel()
        label.text = "All insurances accepted & No Cost EMI available"
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.sizeToFit()
        label.font = UIFont(name: "futura", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rightLabel : UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(string: "Book Appointment")
        text.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: 16))
        label.textAlignment = .center
        label.attributedText = text
        label.font = UIFont(name: "futura", size: 15)
        label.backgroundColor = .systemBlue
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTopView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func setTopView(){
        
        addSubview(titleLabel)
        addSubview(stackView)
        addSubview(image1)
        addSubview(image2)
        addSubview(image3)
        addSubview(plusLabel)
        addSubview(leftLabel)
        addSubview(rightLabel)
        
        
        //TITLE LABEL
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor,constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            titleLabel.heightAnchor.constraint(equalToConstant: 70)
            
        ])
        
        NSLayoutConstraint.ac
        
        
        
        //IMAGE 1
        NSLayoutConstraint.activate([
            image1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 15),
            image1.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            image1.heightAnchor.constraint(equalToConstant: 70),
            image1.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        //IMAGE 2
        NSLayoutConstraint.activate([
            image2.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 15),
            image2.leadingAnchor.constraint(equalTo: image1.trailingAnchor,constant: 20),
            image2.heightAnchor.constraint(equalToConstant: 70),
            image2.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        //IMAGE 3
        NSLayoutConstraint.activate([
            image3.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 15),
            image3.leadingAnchor.constraint(equalTo: image2.trailingAnchor,constant: 20),
            image3.heightAnchor.constraint(equalToConstant: 70),
            image3.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        //IMAGE 4
        NSLayoutConstraint.activate([
            plusLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 15),
            plusLabel.leadingAnchor.constraint(equalTo: image3.trailingAnchor,constant: 20),
            plusLabel.heightAnchor.constraint(equalToConstant: 70),
            plusLabel.widthAnchor.constraint(equalToConstant: 70)
        ])
        

        //LEFT LABEL
        NSLayoutConstraint.activate([
            leftLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20),
            leftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            leftLabel.widthAnchor.constraint(equalToConstant: 150),
            leftLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        //RIGHT LABEL
        NSLayoutConstraint.activate([
            rightLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20),
            rightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            rightLabel.widthAnchor.constraint(equalToConstant: 150),
            rightLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    
}

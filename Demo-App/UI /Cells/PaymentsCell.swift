//
//  PaymentsCell.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 27/03/23.
//

import UIKit

class PaymentsCell: UITableViewCell {

    
    static let identifier = "PaymentCell"
    
    let paymentNameLabel :   UILabel = {
        let label = UILabel()
       
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let paymentImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "payment")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 0.4 * min(imageView.bounds.width, imageView.bounds.height)
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let containerView :  UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let spacingView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setConstrains(){
        
        contentView.addSubview(containerView)
        contentView.addSubview(spacingView)
        
        containerView.addSubview(paymentNameLabel)
        containerView.addSubview(paymentImage)
        
        containerView.layer.cornerRadius = 5
        containerView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        containerView.layer.shadowOpacity = 0.6
        containerView.layer.shadowOffset = CGSize(width: 0, height: -2)
        containerView.layer.shadowRadius = 5
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: contentView.frame.height * 0.05),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -contentView.frame.height * 0.2),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            paymentNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            paymentNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            paymentNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: contentView.frame.width * 0.05),
            paymentNameLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.4 ),

        ])
        
        NSLayoutConstraint.activate([
            paymentImage.widthAnchor.constraint(equalToConstant: contentView.frame.height * 0.8 ),
            paymentImage.heightAnchor.constraint(equalToConstant: contentView.frame.height * 0.8 ),
            paymentImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            paymentImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -contentView.frame.width * 0.05)
        ])
        
        spacingView.backgroundColor = .clear
        NSLayoutConstraint.activate([
            spacingView.topAnchor.constraint(equalTo: paymentNameLabel.bottomAnchor),
            spacingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            spacingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            spacingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

        ])
    }
}

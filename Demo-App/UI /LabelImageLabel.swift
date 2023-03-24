//
//  LabelImageLabel.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 24/03/23.
//

import UIKit

class LabelImageLabel: UIView {

    let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Experience"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let infoLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "4 Year+"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark.seal.fill")!.withTintColor(.green, renderingMode: .alwaysOriginal)
         imageView.contentMode = .scaleAspectFit
         imageView.layer.cornerRadius = 10
         imageView.clipsToBounds = true
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setViews()
    }
    
    func setViews(){
       addSubview(titleLabel)
       addSubview(infoLabel)
       addSubview(image)
        
        
       backgroundColor = .white
       layer.shadowColor = UIColor(named: "shadow")?.cgColor
       layer.shadowOpacity = 0.5
       layer.shadowOffset = CGSize(width: 2, height: 2)
       layer.shadowRadius = 5
       layer.cornerRadius = 10
        
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo:topAnchor,constant: 5),
            titleLabel.heightAnchor.constraint(equalTo: heightAnchor,multiplier : 0.35),
            titleLabel.leadingAnchor.constraint(equalTo:leadingAnchor,constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo:trailingAnchor,constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 5 ),
            image.heightAnchor.constraint(equalTo: heightAnchor,multiplier : 0.35),
            image.leadingAnchor.constraint(equalTo:leadingAnchor,constant: 5),
            image.widthAnchor.constraint(equalTo: heightAnchor,multiplier : 0.35)
        ])
        
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 5 ),
            infoLabel.heightAnchor.constraint(equalTo: heightAnchor,multiplier : 0.35),
            infoLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor,constant: 5),
            infoLabel.trailingAnchor.constraint(equalTo:trailingAnchor,constant: -5)
        ])
        
        
    }
    
}

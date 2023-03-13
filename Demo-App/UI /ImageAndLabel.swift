//
//  ImageAndLabel.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 10/03/23.
//

import UIKit

class ImageAndLabel: UIView {

    let imageView : UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "image")
        imageview.contentMode = .redraw
        imageview.clipsToBounds = true
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "Heart"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "futura", size: 15)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setConstrains()
    }
    
    func setConstrains(){
        addSubview(imageView)
        addSubview(label)
        //IMAGE
        NSLayoutConstraint.activate([
         imageView.topAnchor.constraint(equalTo: topAnchor),
         imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
         imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
         imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
         imageView.widthAnchor.constraint(equalTo: widthAnchor)
       ])
           
        imageView.layer.cornerRadius = 35
        
        //LABEL
        NSLayoutConstraint.activate([
           label.topAnchor.constraint(equalTo: imageView.bottomAnchor),
           label.leadingAnchor.constraint(equalTo: leadingAnchor),
           label.trailingAnchor.constraint(equalTo: trailingAnchor),
         //  label.bottomAnchor.constraint(equalTo: bottomAnchor)
       ])
       imageView.layer.masksToBounds = true
        
    }
}

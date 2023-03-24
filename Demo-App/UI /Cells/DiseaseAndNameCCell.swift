//
//  DiseaseAndNameCCell.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 12/03/23.
//

import UIKit

class DiseaseAndNameCCell: UICollectionViewCell {
    
    static let identifier = "DiseaseAndName"
    
    let imageView : UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "fever")
        imageview.backgroundColor = .white
        imageview.contentMode = .scaleAspectFit
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = imageview.frame.width / 2 // Make the image view circular
        imageview.clipsToBounds = true
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()

    let label : UILabel = {
        let label = UILabel()
        label.text = "Fever"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "futura", size: 15)
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.clipsToBounds = true
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
        contentView.addSubview(imageView)
        contentView.addSubview(label)

        layer.cornerRadius = 10
        layer.shadowColor = UIColor(named: "shadow")?.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 5
         
         contentView.backgroundColor = .white
         contentView.layer.cornerRadius = 10
        
        contentView.clipsToBounds = true

        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.widthAnchor.constraint(equalTo: widthAnchor).constant / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false

    
    NSLayoutConstraint.activate([
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        //imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        //imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75),
        imageView.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75),
        
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor),
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
    }
    
    
}

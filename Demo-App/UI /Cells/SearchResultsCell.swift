//
//  SearchCell.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 13/03/23.
//

import UIKit

class SearchResultsCell : UICollectionViewCell{
    
    static let identifier = "SearchResultCell"
    
    let leftLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.text = "Left"
        label.font = UIFont(name: "Avenir next", size: 25)
        label.textAlignment = .left
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rightImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image6")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(leftLabel)
        addSubview(rightImage)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(leftLabel)
        addSubview(rightImage)
        setConstrains()
    }
    
    override func prepareForReuse() {
        leftLabel.text = nil
        setConstrains()
      //  heightAnchor.constraint(equalToConstant: 0).isActive = true
    }
    
    
    func setConstrains(){
        
        NSLayoutConstraint.activate([
            leftLabel.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            leftLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5),
            leftLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            leftLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4)
        ])
        
        NSLayoutConstraint.activate([
            
            rightImage.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            rightImage.widthAnchor.constraint(equalTo: heightAnchor,constant: -10),
            rightImage.heightAnchor.constraint(equalTo: heightAnchor,constant: -10),
            rightImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        
    }
}

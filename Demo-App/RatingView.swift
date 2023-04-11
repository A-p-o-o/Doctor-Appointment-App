//
//  RatingView.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/04/23.
//

import UIKit

class RatingView: UIView {

    var startCount : Int = 0
    
    let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createStar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createStar(){
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
        stackView.topAnchor.constraint(equalTo: topAnchor,constant: 5),
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5),
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5),
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5),
        ])
        
        for tag in 1...5
        {
            
            let startImage : UIImageView = {
                let imageView = UIImageView()
                imageView.image = UIImage(systemName: "star")!.withTintColor(.black, renderingMode: .alwaysOriginal)
                imageView.contentMode = .scaleAspectFit
                imageView.layer.cornerRadius = 10
                imageView.clipsToBounds = true
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.isUserInteractionEnabled = true
                imageView.tag = tag
                return imageView
            }()
            
            stackView.addArrangedSubview(startImage)
            let tapgesture = UITapGestureRecognizer(target: self, action: #selector(starSelected(_:)))
            startImage.addGestureRecognizer(tapgesture)
        }
    }
    
    func deActivateUserInteraction(){
        
        for views in stackView.arrangedSubviews {
            views.isUserInteractionEnabled = false
        }
        
    }
    
    
    func giveRating(rating : Int){
        
        for index in 0..<rating {
            guard let starImage = stackView.arrangedSubviews[index] as? UIImageView else { continue }
            
            starImage.image = UIImage(systemName: "star.fill")!.withTintColor(UIColor(named: "ratings")!, renderingMode: .alwaysOriginal)
            
        }
    }
    
    
    
    @objc func starSelected(_ tapgesture : UITapGestureRecognizer){
        
        deselectImage()
        
        guard let imageView = tapgesture.view as? UIImageView else { return }
        
        if imageView.tag != startCount {
            print(startCount,"image tag = ",imageView.tag)
            selectImage(imageView: imageView)
        }
        else {
            startCount = 0
        }
    }
    
    
    func selectImage(imageView : UIImageView){
        let rating : Int =  imageView.tag
        
        for index in 0..<rating {
            guard let starImage = stackView.arrangedSubviews[index] as? UIImageView else { continue }
            
            starImage.image = UIImage(systemName: "star.fill")!.withTintColor(UIColor(named: "ratings")!, renderingMode: .alwaysOriginal)
            
        }
        startCount = rating
    }
    
    func deselectImage(){
        for views in stackView.arrangedSubviews{
            guard let imageView = views as? UIImageView else { continue }
            imageView.image = UIImage(systemName: "star")!.withTintColor(.black, renderingMode: .alwaysOriginal)
        }
    }
}

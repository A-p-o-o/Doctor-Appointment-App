//
//  DoctorCell.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 12/03/23.
//

import UIKit

class DoctorCell: UICollectionViewCell {
    
    static let identifier = "DoctorCell"
    
    
    let imageview : UIImageView = {
        let imageView = UIImageView()
         imageView.image = UIImage(named: "image6")
         imageView.contentMode = .scaleAspectFill
         //imageView.layer.cornerRadius = 10
         imageView.clipsToBounds = true
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()
    
    let name : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let department: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let favouriteView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let favouriteImage : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")!.withTintColor(.black, renderingMode: .alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let favouriteImageSelected : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart.fill")!.withTintColor(UIColor.systemRed, renderingMode: .alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let ratingImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")!.withTintColor(UIColor(named: "ratings")!, renderingMode: .alwaysOriginal)
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()
    
    let ratingLabel :  UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "5 ratings"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bookButton : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = UIColor(named: "book")
        button.configuration?.baseForegroundColor = .white
        button.setTitle("Book", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setConstrains()
    }
    
    var heightSpace : CGFloat {
        contentView.frame.height * 0.04
    }
    
    var widthSpace : CGFloat {
        contentView.frame.width * 0.05
    }
    
    func setConstrains(){
        contentView.addSubview(imageview)
        contentView.addSubview(name)
        contentView.addSubview(department)
        contentView.addSubview(favouriteView)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(ratingImage)
        contentView.addSubview(bookButton)
        
       layer.cornerRadius = 10
       layer.shadowColor = UIColor(named: "shadow")?.cgColor
       layer.shadowOpacity = 0.5
       layer.shadowOffset = CGSize(width: 2, height: 2)
       layer.shadowRadius = 5
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        
        let imageHeight = contentView.frame.height * 0.45
        
        let height = contentView.frame.height * 0.11
        
        NSLayoutConstraint.activate([
            imageview.topAnchor.constraint(equalTo: contentView.topAnchor,constant: heightSpace),
            imageview.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageview.heightAnchor.constraint(equalToConstant: imageHeight),
            imageview.widthAnchor.constraint(equalToConstant: imageHeight)
        ])
        
        imageview.layer.cornerRadius = imageHeight / 2
        
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: imageview.bottomAnchor),
            name.heightAnchor.constraint(equalToConstant: height),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: widthSpace),
            name.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -widthSpace)
        ])
        
        NSLayoutConstraint.activate([
            department.topAnchor.constraint(equalTo: name.bottomAnchor),
            department.heightAnchor.constraint(equalToConstant: height),
            department.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: widthSpace),
            department.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -widthSpace)
        ])

        
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: department.bottomAnchor),
            ratingLabel.heightAnchor.constraint(equalToConstant: height),
            ratingLabel.leadingAnchor.constraint(equalTo: ratingImage.trailingAnchor,constant: widthSpace),
            ratingLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -widthSpace)
        ])

        NSLayoutConstraint.activate([
            ratingImage.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor),
            ratingImage.heightAnchor.constraint(equalToConstant: height-10),
            ratingImage.widthAnchor.constraint(equalToConstant: height-10),
            ratingImage.leadingAnchor.constraint(equalTo: imageview.leadingAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            bookButton.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor,constant: heightSpace),
            bookButton.heightAnchor.constraint(equalToConstant: height),
            bookButton.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2 ),
            bookButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            favouriteView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: heightSpace),
            favouriteView.heightAnchor.constraint(equalToConstant: height),
            favouriteView.widthAnchor.constraint(equalToConstant: height),
            favouriteView.leadingAnchor.constraint(equalTo: imageview.trailingAnchor,constant: -imageHeight*0.3),
            
        ])
        
        favouriteView.addSubview(favouriteImage)
        favouriteView.addSubview(favouriteImageSelected)
        
        favouriteImageSelected.isHidden = true
        
        let likeSpace =  height * 0.08
        NSLayoutConstraint.activate([
            favouriteImage.topAnchor.constraint(equalTo: favouriteView.topAnchor,constant: likeSpace),
            favouriteImage.bottomAnchor.constraint(equalTo: favouriteView.bottomAnchor,constant: -likeSpace),
            favouriteImage.leadingAnchor.constraint(equalTo: favouriteView.leadingAnchor,constant: likeSpace),
            favouriteImage.trailingAnchor.constraint(equalTo: favouriteView.trailingAnchor,constant: -likeSpace),
        ])
        
        NSLayoutConstraint.activate([
            favouriteImageSelected.topAnchor.constraint(equalTo: favouriteView.topAnchor,constant: likeSpace),
            favouriteImageSelected.bottomAnchor.constraint(equalTo: favouriteView.bottomAnchor,constant: -likeSpace),
            favouriteImageSelected.leadingAnchor.constraint(equalTo: favouriteView.leadingAnchor,constant: likeSpace),
            favouriteImageSelected.trailingAnchor.constraint(equalTo: favouriteView.trailingAnchor,constant: -likeSpace),
        ])
        
        favouriteView.layer.cornerRadius = (height) / 2
        favouriteView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        favouriteView.layer.shadowOpacity = 0.5
        favouriteView.layer.shadowOffset = CGSize(width: 2, height: 2)
        favouriteView.layer.shadowRadius = 5
        
       
       
    }
    
    
}

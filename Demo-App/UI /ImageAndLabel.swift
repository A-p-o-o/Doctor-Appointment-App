//
//  ImageAndLabel.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 10/03/23.
//

import UIKit

class ImageAndLabel: UIView {

    let image : UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "image")
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 35
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "text"
        label.font = UIFont(name: "futura", size: 15)
        return label
    }()
}

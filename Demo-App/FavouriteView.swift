//
//  FavouriteView.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 30/03/23.
//

import UIKit

class FavouriteView: UIView {

    
    
    let viewHeight : CGFloat
    let viewWidth : CGFloat
    
    init(viewHeight: CGFloat, viewWidth: CGFloat) {
        self.viewHeight = viewHeight
        self.viewWidth = viewWidth
        super.init(frame: .zero)
        setViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let favouritebutton : UIButton = {
        let button = UIButton()
        button.configuration = .borderless()
       
        button.setImage(UIImage(systemName: "heart")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal), for: .selected)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    func setViews(){
        
        addSubview(favouritebutton)
        
        
        
        NSLayoutConstraint.activate([
            favouritebutton.centerXAnchor.constraint(equalTo: centerXAnchor),
            favouritebutton.centerYAnchor.constraint(equalTo: centerYAnchor),
            favouritebutton.heightAnchor.constraint(equalToConstant: viewHeight * 0.9),
            favouritebutton.widthAnchor.constraint(equalToConstant: viewHeight * 0.9)
        ])
        favouritebutton.layer.cornerRadius = (viewHeight * 0.9) / 2
        
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.shadowColor = UIColor(named: "shadow")?.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 5
    }
    
}

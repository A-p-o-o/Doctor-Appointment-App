//
//  ReviewCell.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/04/23.
//

import UIKit

class ReviewCell: UITableViewCell {

    static let identifier : String = "ReviewCell"
    
    var isExpanded : Bool = false
    
    let stackview : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let name : UILabel = {
        let label = UILabel()
        label.textColor = .black
//        label.text = "Your Appointment Has been Completed Succcessfully"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let date : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
//        label.text = "Your Appointment Has been Completed Succcessfully"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let ratings  : RatingView = RatingView()
    
    let content : UILabel = {
        let label = UILabel()
        label.textColor = .black
//        label.text = "Your Appointment Has been Completed Succcessfully"
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 3
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let viewMoreButton : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.tintColor = UIColor(named: "white")
        button.configuration?.baseForegroundColor = UIColor(named: "book")
        button.setTitle("View More", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews(){
        //addSubview(stackview)
        
        contentView.addSubview(name)
        contentView.addSubview(date)
        contentView.addSubview(ratings)
        contentView.addSubview(content)
        contentView.addSubview(viewMoreButton)
        
        ratings.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            name.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            name.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -5),
           // name.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            
            date.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            date.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 5),
            date.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            date.bottomAnchor.constraint(equalTo: name.bottomAnchor),
            
            ratings.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            ratings.leadingAnchor.constraint(equalTo: name.leadingAnchor),
          //  ratings.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -5),
            ratings.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            
            content.topAnchor.constraint(equalTo: ratings.bottomAnchor, constant: 5),
            content.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            content.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            
//            viewMoreButton.bottomAnchor.constraint(equalTo: content.bottomAnchor,constant: -5),
//            viewMoreButton.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
//            viewMoreButton.heightAnchor.constraint(lessThanOrEqualToConstant: 20),
//            viewMoreButton.trailingAnchor.constraint(equalTo: content.trailingAnchor),
            
            viewMoreButton.topAnchor.constraint(equalTo: content.bottomAnchor, constant: 18),
            viewMoreButton.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            viewMoreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
        ])
        
        ratings.deActivateUserInteraction()
        viewMoreButton.addTarget(self, action: #selector(viewMoreClicked(_:)), for: .touchUpInside)
    }
    
    
    
    
    
    
    
    @objc func viewMoreClicked(_ sender : UIButton){
        isExpanded = !isExpanded
                content.numberOfLines = isExpanded ? 0 : 3
    }
}

//
//  SearchCell.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 13/03/23.
//

import UIKit

class SearchResultsCell: UITableViewCell {
    
    static let identifier = "SearchResultCell"
    
    let leftLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Left"
        label.font = UIFont(name: "Avenir next", size: 25)
        label.textAlignment = .left
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rightLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Right"
        label.font = UIFont(name: "Avenir next", size: 25)
        label.textAlignment = .right
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(leftLabel)
        addSubview(rightLabel)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(leftLabel)
        addSubview(rightLabel)
        setConstrains()
    }
    
    override func prepareForReuse() {
        leftLabel.text = nil
        rightLabel.text = nil
        setConstrains()
      //  heightAnchor.constraint(equalToConstant: 0).isActive = true
    }
    
    
    func setConstrains(){
        
        NSLayoutConstraint.activate([
            leftLabel.topAnchor.constraint(equalTo: topAnchor),
            leftLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            leftLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            leftLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4)
        ])
        
        NSLayoutConstraint.activate([
            rightLabel.topAnchor.constraint(equalTo: topAnchor),
            rightLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            rightLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            rightLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4)
        ])
    }
}

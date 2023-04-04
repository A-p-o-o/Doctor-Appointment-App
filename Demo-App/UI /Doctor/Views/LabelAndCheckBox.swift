//
//  LabelAndCheckBox.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 01/04/23.
//

import UIKit

class LabelAndCheckBox: UIView {

    let titleLabel :UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        let checkboxButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(named: "uncheckedbox"), for: .normal)
            button.setImage(UIImage(named: "checkedbox"), for: .selected)
            button.configuration?.baseForegroundColor = .black
            return button
        }()

        

        override init(frame: CGRect) {
            super.init(frame: frame)
            setUpViews()
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        

        func setUpViews() {
            addSubview(titleLabel)
            addSubview(checkboxButton)

            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: topAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: checkboxButton.leadingAnchor, constant: -10),
                
                checkboxButton.topAnchor.constraint(equalTo: topAnchor),
                checkboxButton.trailingAnchor.constraint(equalTo: trailingAnchor),
                checkboxButton.bottomAnchor.constraint(equalTo: bottomAnchor),
                checkboxButton.widthAnchor.constraint(equalToConstant: 30)
            ])
            
            checkboxButton.addTarget(self, action: #selector(boxClicked(_:)), for: .touchUpInside)
            
        }
    
    @objc func boxClicked(_ sender : UIButton){
        sender.isSelected = !sender.isSelected
    }

}

//
//  LabelAndField.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 10/03/23.
//

import UIKit

class LabelAndField: UIView {
    
    let label  :  UILabel = {
        let label = UILabel()
        label.text = "label"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
       // label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let textField = UITextField()
    let errorLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        //LABEL
        addSubview(label)
       
        //FIELD
        addSubview(textField)
        textField.placeholder = ""
        textField.borderStyle = .roundedRect
        textField.textColor = UIColor(named: "TextFieldColor")
        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = 20
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        //ERROR LABEL
        addSubview(errorLabel)
        errorLabel.text = "*error"
        errorLabel.textColor = .systemRed
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        
        //LABEL
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            label.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            label.widthAnchor.constraint(equalTo: widthAnchor,constant: -20)
        ])
        
        //FIELD
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 5),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            textField.widthAnchor.constraint(equalTo: widthAnchor,constant: -20)
        ])
        
        //ERROR LABEL
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            errorLabel.widthAnchor.constraint(equalTo: widthAnchor,constant: -20),
            errorLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

}

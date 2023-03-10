//
//  LabelAndField.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 10/03/23.
//

import UIKit

class LabelAndField: UIView {
    
    let label = UILabel()
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
        label.text = "Label"
        label.textColor = .systemBlue
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        //FIELD
        addSubview(textField)
        textField.placeholder = "Enter text here"
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
        heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        
        //LABEL
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.widthAnchor.constraint(greaterThanOrEqualToConstant: 200)
        ])
        
        //FIELD
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: label.bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.widthAnchor.constraint(greaterThanOrEqualToConstant: 200)
        ])
        
        //ERROR LABEL
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            errorLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 200)
        ])
    }

}

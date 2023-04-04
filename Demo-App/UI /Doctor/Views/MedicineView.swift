//
//  MedicineView.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 01/04/23.
//

import UIKit

class MedicineView: UIView {

    let stackView = UIStackView()
    
    let title : UILabel = {
        let label = UILabel()
        label.text = "Medicine 1"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let medicineNameLabel :  UILabel = {
        let label = UILabel()
        label.text = "Medicine Name"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let medicineNameField : UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.borderStyle = .roundedRect
        textField.textColor = UIColor(named: "TextFieldColor")
        textField.backgroundColor = .lightGray
        //textField.layer.cornerRadius = 20
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let whenToTakeLabel : UILabel = {
        let label = UILabel()
        label.text = "When to Take Medicine ? "
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let morning = LabelAndCheckBox()
    let afterNoon = LabelAndCheckBox()
    let night = LabelAndCheckBox()
    let noOfDaysLabel  : UILabel = {
        let label = UILabel()
        label.text = "Medicine"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let noOfDaysField : UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.borderStyle = .roundedRect
        textField.textColor = UIColor(named: "TextFieldColor")
        textField.backgroundColor = .lightGray
        //textField.layer.cornerRadius = 20
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let beforeOrAfterLabel : UILabel = {
        let label = UILabel()
        label.text = "When to Take Medicine ?"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let beforeMeal = LabelAndCheckBox()
    let afterMeal = LabelAndCheckBox()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    func setUpViews(){
        addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
        
        medicineNameLabel.translatesAutoresizingMaskIntoConstraints = false
        medicineNameField.translatesAutoresizingMaskIntoConstraints = false
        whenToTakeLabel.translatesAutoresizingMaskIntoConstraints = false
        morning.translatesAutoresizingMaskIntoConstraints = false
        afterNoon.translatesAutoresizingMaskIntoConstraints = false
        night.translatesAutoresizingMaskIntoConstraints = false
        noOfDaysLabel.translatesAutoresizingMaskIntoConstraints = false
        noOfDaysField.translatesAutoresizingMaskIntoConstraints = false
        beforeOrAfterLabel.translatesAutoresizingMaskIntoConstraints = false
        beforeMeal.translatesAutoresizingMaskIntoConstraints = false
        afterMeal.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(medicineNameLabel)
        stackView.addArrangedSubview(medicineNameField)
        stackView.addArrangedSubview(whenToTakeLabel)
        stackView.addArrangedSubview(morning)
        stackView.addArrangedSubview(afterNoon)
        stackView.addArrangedSubview(night)
        stackView.addArrangedSubview(noOfDaysLabel)
        stackView.addArrangedSubview(noOfDaysField)
        stackView.addArrangedSubview(beforeOrAfterLabel)
        stackView.addArrangedSubview(beforeMeal)
        stackView.addArrangedSubview(afterMeal)
        
        medicineNameLabel.text = "Medicine Name"
        morning.titleLabel.text = "Morning"
        afterNoon.titleLabel.text = "After Noon"
        night.titleLabel.text = "Evening"
        noOfDaysLabel.text = "No of days to Take"
        beforeMeal.titleLabel.text = "Before Meal"
        afterMeal.titleLabel.text = "After Meal"
        
        beforeMeal.checkboxButton.tag = 0
        afterMeal.checkboxButton.tag = 1
        
        beforeMeal.checkboxButton.addTarget(self, action: #selector(mealClicked(_:)), for: .touchUpInside)
        afterMeal.checkboxButton.addTarget(self, action: #selector(mealClicked(_:)), for: .touchUpInside)
        
    }
    
    @objc func mealClicked(_ sender : UIButton){
        
        if sender.tag == 0 {
            afterMeal.checkboxButton.isSelected = false
            beforeMeal.checkboxButton.isSelected = true
        }
        
        if sender.tag == 1 {
            beforeMeal.checkboxButton.isSelected = false
            afterMeal.checkboxButton.isSelected = true
        }
        
        
    }
    
    
}

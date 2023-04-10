//
//  LabelAndField.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 10/03/23.
//

import UIKit

class LabelAndField: UIView {
    
    var selectedDepartment : String? = nil
    var selectedDate : Date? = nil
    var selectedGender : Sex? = nil
    
    
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
    
    let picker = UIPickerView()
    let datePicker = UIDatePicker()
    
    var pickerdata : [String] = []
    
    let eyeButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.setImage(UIImage(systemName: "eye"), for: .selected)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
        errorLabel.isHidden = true
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
        textField.tintColor = UIColor(named: "book")
        textField.placeholder = ""
        textField.autocorrectionType = .no
        textField.clipsToBounds = true
        textField.borderStyle = .roundedRect
        textField.textColor = UIColor(named: "TextFieldColor")
        textField.backgroundColor = UIColor(named: "white")
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        //ERROR LABEL
        addSubview(errorLabel)
        errorLabel.text = "*error"
        errorLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
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
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 5),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        //ERROR LABEL
        NSLayoutConstraint.activate([
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            errorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 4),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        picker.delegate = self
        
        
    }
    
    func setToolBar(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([flexBarButton, doneBarButton], animated: true)
        doneBarButton.tintColor = .blue
        toolbar.barTintColor = UIColor(named: "barcolour")
       textField.inputAccessoryView = toolbar
    }
    
   
    @objc func doneButtonTapped() {
       textField.resignFirstResponder()
    }

}

extension LabelAndField {
    
    
    func onlyNumbers(){
        textField.keyboardType = .numberPad
    }
    
    func makeTextFieldRed(){
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.red.cgColor
    }
    
    func makeTextFieldNormal(){
        textField.layer.borderWidth = 0
        hideErrorLabel()
    }
    
    func displayErrorLabel(text : String){
        makeTextFieldRed()
        errorLabel.isHidden = false
        errorLabel.text = text
    }
    
    func hideErrorLabel(){
        errorLabel.isHidden = true
    }
    
    func isTextEmpty()->Bool{
        if textField.text == "" || textField.text == nil {
            makeTextFieldRed()
           displayErrorLabel(text: "*This field is required")
            return true
        }
        hideErrorLabel()
        return false
    }
    
    func isValidEmail(email : inout String?)->Bool{
        let emailRegex = "^[\\+\\-\\p{L}\\p{M}\\p{N}_]([\\p{L}\\p{M}\\p{N}!#$%&'*+\\-\\/=?^_`{|}~.]*)@(?=.{4,256}$)(([\\p{L}\\p{N}\\p{M}]+)(([\\-_]*[\\p{L}\\p{M}\\p{N}])*)[.])+[\\p{L}\\p{M}]{2,22}$"
        
        if !isTextEmpty(){
            
            if let _ = textField.text!.range(of: emailRegex, options: .regularExpression) {
                makeTextFieldNormal()
               
                email = textField.text!
                return true
            }
            else {
                displayErrorLabel(text: "*Not a Valid Email")
            }
        }
        return false
    }
    
    func isValidPhoneNumber(phoneNumber : inout String?)->Bool{
        let phoneRegex = "^(\\d{3}-\\d{3}-\\d{4}|\\d{10})$"
        
        if !isTextEmpty(){
            
            if let _ = textField.text!.range(of: phoneRegex, options: .regularExpression) {
                makeTextFieldNormal()
                phoneNumber = textField.text!
                return true
            }
            else {
                displayErrorLabel(text: "*Not a Valid Phone Number")
            }
            
        }
        return false
    }
    
    func isValidWeight(weight : inout Double?)->Bool{
        let weightRegex = "^\\d{1,3}(\\.\\d{1,2})?$"
         
        if !isTextEmpty(){
            
            if let _ = textField.text!.range(of: weightRegex, options: .regularExpression) {
                
                
                guard let weightDouble = Double(textField.text!)  else { displayErrorLabel(text: "not a valid height") ; return false }
                weight = weightDouble
                makeTextFieldNormal()
                return true
            }
            else {
                displayErrorLabel(text: "*Not a Valid Weight")
            }
            
        }
        return false
    }
    
    func asPasswordSecure(){
        textField.isSecureTextEntry = true
        
        textField.rightView = eyeButton
        textField.rightViewMode = .whileEditing
        
       
        eyeButton.addTarget(self, action: #selector(eyeButtonTapped(_:)), for: .touchUpInside)
    }
    
    
    @objc func eyeButtonTapped(_ sender : UIButton){
        
        if !sender.isSelected{
            textField.isSecureTextEntry = false
        }
        else {
            textField.isSecureTextEntry = true
        }
        
        sender.isSelected = !sender.isSelected
    }
    
    func asDateOfBirth(){
       
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.maximumDate = Date()
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(calendar: calendar, year: 1900, month: 1, day: 1)
        let minDate = calendar.date(from: components)
        datePicker.minimumDate = minDate
        textField.inputView = datePicker
        datePicker.tintColor = .blue
        datePicker.backgroundColor = UIColor(named: "background")
        datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        setToolBar()
    }
    
    @objc func dateSelected(){
        textField.text =  dateFormat(date: datePicker.date)
        selectedDate = datePicker.date
    }
    
    func isValidHeight(height : inout Double?)->Bool{
        let HeightRegex = "^\\d{1,3}(\\.\\d{1,2})?$"
         
        if !isTextEmpty(){
            
            if let _ = textField.text!.range(of: HeightRegex, options: .regularExpression) {
                
                guard let heightDouble = Double(textField.text!)  else { displayErrorLabel(text: "not a valid height") ; return false }
                height = heightDouble
                makeTextFieldNormal()
                return true
            }
            else {
                displayErrorLabel(text: "*Not a Valid Height")
            }
            
        }
        return false
    }
    
    func isValidPassword(password : inout String?)->Bool{
        let passwordRegex = "^(?=.*[A-Za-z]).{8,}$"
            
        if !isTextEmpty(){
            
            if let _ = textField.text!.range(of: passwordRegex, options: .regularExpression) {
                makeTextFieldNormal()
                password = textField.text!
                return true
            }
            else {
                displayErrorLabel(text: "*Must contain 8 characters & 1 number")
            }
            
        }
        return false
    }
    
    func isValidName(name : inout String?)->Bool{
        let nameRegex = "^[a-zA-Z]+(([a-zA-Z ])?[a-zA-Z]*)*$"
        
        if !isTextEmpty(){
            if let _ = textField.text!.range(of: nameRegex, options: .regularExpression) {
                makeTextFieldNormal()
                name = textField.text!
                return true
            }
            else {
                displayErrorLabel(text: "*Only Alphabet")
            }
        
        }
    return false
    }
    
    
    func isValidAge(age : inout Int?)->Bool{
        
        if !isTextEmpty(){
            guard let number = Int(textField.text!) else {
                displayErrorLabel(text: "Only numbers Allowed")
                return false  }
            if number == 0 {
                displayErrorLabel(text: "Age cannot be 0")
                return false
            }
            else if number < 0 {
                displayErrorLabel(text: "Age cannot be negative")
                return false
            }
            else if  number > 200 {
                displayErrorLabel(text: "Age limit exceeds")
                return false
            }
            age = number
        }
       
        return true
    }
    
    func isValidGender(gender : inout Sex?)->Bool{
        
        if !isTextEmpty(){
            
            guard let sex = Sex.getSex(from: textField.text!) else {  displayErrorLabel(text: "Invalid Input")
                return false  }
            
            gender = sex
        }
        return true
    }
    
    func isValidBloodGroup(bloodGroup : inout BloodGroup?)->Bool{
        
        if !isTextEmpty(){
            guard let blood = BloodGroup.getBloodGroup(from: textField.text!) else {  displayErrorLabel(text: "Invalid Input")
                return false  }
            
            bloodGroup = blood
        }
        return true
    }
    
   
    
    func setGenderPicker(){
        pickerdata = [Sex.Male.name,Sex.Female.name,Sex.NonBinary.name]
        picker.reloadAllComponents()
        textField.inputView = picker
        textField.text = Sex.Male.name
        setToolBar()
    }
    
    func setBloodGroupPicker(){
        pickerdata = [BloodGroup.oPositive.name, BloodGroup.oNegative.name, BloodGroup.aPositive.name, BloodGroup.aNegative.name, BloodGroup.abPositive.name, BloodGroup.abNegative.name, BloodGroup.bPositive.name, BloodGroup.bNegative.name]
        picker.reloadAllComponents()
        textField.inputView = picker
        textField.text = BloodGroup.oPositive.name
        setToolBar()
    }
    
    
    
}


extension LabelAndField : UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerdata.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerdata[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            textField.text = pickerdata[row]
    }
    
}

extension LabelAndField : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
       return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        errorLabel.isHidden = true
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor(named: "book")?.cgColor
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }
}

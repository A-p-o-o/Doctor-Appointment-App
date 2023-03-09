//
//  RegisterController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 09/03/23.
//

import UIKit

class RegisterController: UIViewController {
    
    
    let registerView = UIView()
    
    let usernameLabel = UILabel()
    let mobileNumberLabel = UILabel()
    let emailLabel = UILabel()
    let passwordLabel = UILabel()
    let confirmPasswordLabel = UILabel()
    
    let usernameField = UITextField()
    let passwordfield = UITextField()
    let confirmPassField = UITextField()
    let mobileNumberField = UITextField()
    let emailField = UITextField()
    
    let createButton = UIButton()
    let alreadyhaveAnAccountLabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setGradient()
        
        setRegisterView()
        
        setLabels()
        setTextFields()
        setCreateButton()
        setAlreadyAccountlabel()
       
        setConstraints()
    }
    
    
    func setRegisterView(){
        view.addSubview(registerView)
        
//        registerView.layer.cornerRadius = 10
//        registerView.layer.shadowRadius = 5
//        registerView.layer.shadowOffset = CGSize(width: 5, height: -3)
//        registerView.layer.shadowColor = UIColor(named: "white")!.cgColor
//        registerView.layer.shadowOpacity = 20
 //       registerView.backgroundColor = .magenta
        
        registerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            registerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            registerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            registerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            registerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
        
    }
    
    func setLabels(){
        
        registerView.addSubview(usernameLabel)
        registerView.addSubview(mobileNumberLabel)
        registerView.addSubview(confirmPasswordLabel)
        registerView.addSubview(passwordLabel)
        registerView.addSubview(emailLabel)
        
        //USERNAME LABEL
        usernameLabel.text = "User Name"
        usernameLabel.textColor = .systemBlue
        usernameLabel.font = UIFont(name: "Avenir Next", size: 20)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //MOBILE NUMBER LABEL
        mobileNumberLabel.text = "Mobile Number"
        mobileNumberLabel.textColor = .systemBlue
        mobileNumberLabel.font = UIFont(name: "Avenir Next", size: 20)
        mobileNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //EMAIL LABEL
        emailLabel.text = "Email Address"
        emailLabel.textColor = .systemBlue
        emailLabel.font = UIFont(name: "Avenir Next", size: 20)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //PASSWORD LABEL
        passwordLabel.text = "Password"
        passwordLabel.textColor = .systemBlue
        passwordLabel.font = UIFont(name: "Avenir Next", size: 20)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //CONFIRM PASSWORD LABEL
        confirmPasswordLabel.text = "Confirm Password"
        confirmPasswordLabel.textColor = .systemBlue
        confirmPasswordLabel.font = UIFont(name: "Avenir Next", size: 20)
        confirmPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setTextFields(){
        
        //USERNAME FIELD
        registerView.addSubview(usernameField)
        usernameField.borderStyle = .roundedRect
        usernameField.textColor = UIColor(named: "TextFieldColor")
        usernameField.backgroundColor = .lightGray
        usernameField.layer.cornerRadius = 20
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        
        //MOBILE NUMBER FIELD
        registerView.addSubview(mobileNumberField)
        mobileNumberField.borderStyle = .roundedRect
        mobileNumberField.textColor = UIColor(named: "TextFieldColor")
        mobileNumberField.backgroundColor = .lightGray
        mobileNumberField.layer.cornerRadius = 20
        mobileNumberField.translatesAutoresizingMaskIntoConstraints = false
        
        //EMAIL FIELD
        registerView.addSubview(emailField)
        emailField.borderStyle = .roundedRect
        emailField.textColor = UIColor(named: "TextFieldColor")
        emailField.backgroundColor = .lightGray
        emailField.layer.cornerRadius = 20
        emailField.translatesAutoresizingMaskIntoConstraints = false
        
        //PASSWORD FIELD
        registerView.addSubview(passwordfield)
        passwordfield.borderStyle = .roundedRect
        passwordfield.textColor = UIColor(named: "TextFieldColor")
        passwordfield.backgroundColor = .lightGray
        passwordfield.layer.cornerRadius = 20
        passwordfield.translatesAutoresizingMaskIntoConstraints = false
        
        //CONFIRM PASSWORD FIELD
        registerView.addSubview(confirmPassField)
        confirmPassField.borderStyle = .roundedRect
        confirmPassField.textColor = UIColor(named: "TextFieldColor")
        confirmPassField.backgroundColor = .lightGray
        confirmPassField.layer.cornerRadius = 20
        confirmPassField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setCreateButton(){
        registerView.addSubview(createButton)
        createButton.configuration = .filled()
        createButton.setTitle("Create Account", for: .normal)
        createButton.configuration?.baseBackgroundColor = .red
        createButton.configuration?.baseForegroundColor = .white
        
        createButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setAlreadyAccountlabel(){
        registerView.addSubview(alreadyhaveAnAccountLabel)
        let attributedString = NSMutableAttributedString(string: "Already have an account? Login here")
        attributedString.addAttribute(.foregroundColor, value: UIColor(named: "black")!, range: NSRange(location: 0, length: 24))
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: NSRange(location: 25, length: 10))

        alreadyhaveAnAccountLabel.attributedText = attributedString
        alreadyhaveAnAccountLabel.font = UIFont(name: "Avenir Next", size: 15)
        alreadyhaveAnAccountLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setConstraints(){
        
        //USERNAME LABEL
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: registerView.topAnchor, constant: 20),
           // usernameLabel.bottomAnchor.constraint(equalTo: registerView.bottomAnchor, constant: -500),
            usernameLabel.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 20),
            usernameLabel.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -200),
            usernameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //USERNAME FIELD
        NSLayoutConstraint.activate([
            usernameField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor),
            usernameField.leadingAnchor.constraint(equalTo: registerView.leadingAnchor,constant: 20),
            usernameField.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -20),
            usernameField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //PASSWORD LABEL
        NSLayoutConstraint.activate([
            mobileNumberLabel.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 20),
            mobileNumberLabel.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 20),
            mobileNumberLabel.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -160),
            mobileNumberLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //MOBILE NUMBER FIELD
        NSLayoutConstraint.activate([
            mobileNumberField.topAnchor.constraint(equalTo: mobileNumberLabel.bottomAnchor),
            mobileNumberField.leadingAnchor.constraint(equalTo: registerView.leadingAnchor,constant: 20),
            mobileNumberField.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -20),
            mobileNumberField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //EMAIL LABEL
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: mobileNumberField.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -160),
            emailLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //EMAIL FIELD
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
            emailField.leadingAnchor.constraint(equalTo: registerView.leadingAnchor,constant: 20),
            emailField.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -20),
            emailField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //PASSWORD LABEL
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 20),
            passwordLabel.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -160),
            passwordLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //PASSWORD FIELD
        NSLayoutConstraint.activate([
            passwordfield.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor),
            passwordfield.leadingAnchor.constraint(equalTo: registerView.leadingAnchor,constant: 20),
            passwordfield.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -20),
            passwordfield.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //CONFIRM PASSWORD LABEL
        NSLayoutConstraint.activate([
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordfield.bottomAnchor, constant: 20),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 20),
            confirmPasswordLabel.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -130),
            confirmPasswordLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //CONFIRM PASSWORD FIELD
        NSLayoutConstraint.activate([
            confirmPassField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor),
            confirmPassField.leadingAnchor.constraint(equalTo: registerView.leadingAnchor,constant: 20),
            confirmPassField.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -20),
            confirmPassField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //CREATE ACCOUNT BUTTON
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: confirmPassField.bottomAnchor, constant: 20),
            createButton.trailingAnchor.constraint(equalTo: registerView.trailingAnchor, constant: -20)
        ])
        
        //ALREADY HAVE AN ACCOUNT LABEL
        NSLayoutConstraint.activate([
            alreadyhaveAnAccountLabel.bottomAnchor.constraint(equalTo: registerView.bottomAnchor,constant: -10),
            alreadyhaveAnAccountLabel.leadingAnchor.constraint(equalTo: registerView.leadingAnchor, constant: 20)
        ])
        
      
    }
    
    func setGradient(){
        let gradientLayer2 = CAGradientLayer()
        gradientLayer2.frame = view.bounds
        gradientLayer2.colors = [UIColor(named: "black")!.cgColor,UIColor(named: "white")!.cgColor, UIColor.blue.cgColor]
        gradientLayer2.startPoint = CGPoint(x: 0, y: 0)
        view.layer.insertSublayer(gradientLayer2, at: 0)
    }
    
}

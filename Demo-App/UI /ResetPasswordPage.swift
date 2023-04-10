//
//  ResetPasswordPage.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 09/03/23.
//

import UIKit

class ResetPasswordPage: UIViewController {
    
    let contentView = UIView()
    
    let resetPasswordLabel = UILabel()
    
    let passwordLabel = UILabel()
    let confirmPasswordLabel = UILabel()
    
    let passwordfield = UITextField()
    let confirmPassField = UITextField()
    
    let resetPasswordButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setGradient()
        setContentView()
        setLabels()
        setTextFields()
        setButtons()
        setConstrains()
    }
    
    func setContentView(){
        view.addSubview(contentView)
        contentView.layer.cornerRadius = 20
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200)
        ])
    }
    
    func setLabels(){
        //RESET PASSWORD LABEL
        contentView.addSubview(resetPasswordLabel)
        resetPasswordLabel.text = "Reset Password"
        resetPasswordLabel.textColor = UIColor(named: "white")
        resetPasswordLabel.font = UIFont(name: "Avenir Next", size: 40)
        resetPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //PASSWORD LABEL
        contentView.addSubview(passwordLabel)
        passwordLabel.text = "Password"
        passwordLabel.textColor = .systemBlue
        passwordLabel.font = UIFont(name: "Avenir Next", size: 20)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //CONFIRM PASSWORD LABEL
        contentView.addSubview(confirmPasswordLabel)
        confirmPasswordLabel.text = "Confirm Password"
        confirmPasswordLabel.textColor = .systemBlue
        confirmPasswordLabel.font = UIFont(name: "Avenir Next", size: 20)
        confirmPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
    }
     
    func setTextFields(){
        //PASSWORD FIELD
        contentView.addSubview(passwordfield)
        passwordfield.borderStyle = .roundedRect
        passwordfield.textColor = UIColor(named: "TextFieldColor")
        passwordfield.backgroundColor = .lightGray
        passwordfield.layer.cornerRadius = 20
        passwordfield.translatesAutoresizingMaskIntoConstraints = false
        
        //CONFIRM PASSWORD FIELD
        contentView.addSubview(confirmPassField)
        confirmPassField.borderStyle = .roundedRect
        confirmPassField.textColor = UIColor(named: "TextFieldColor")
        confirmPassField.backgroundColor = .lightGray
        confirmPassField.layer.cornerRadius = 20
        confirmPassField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setButtons(){
        //RESET PASSWORD BUTTON
        contentView.addSubview(resetPasswordButton)
        resetPasswordButton.configuration = .filled()
        resetPasswordButton.setTitle("Reset Password", for: .normal)
        resetPasswordButton.configuration?.baseBackgroundColor = .red
        resetPasswordButton.configuration?.baseForegroundColor = UIColor(named: "white")
        
        resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setConstrains(){
        //RESET PASSWORD LABEL
        NSLayoutConstraint.activate([
            resetPasswordLabel.topAnchor.constraint(equalTo:contentView.topAnchor, constant: 20),
            resetPasswordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            resetPasswordLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            resetPasswordLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        //PASSWORD LABEL
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: resetPasswordLabel.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            passwordLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -160),
            passwordLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //PASSWORD FIELD
        NSLayoutConstraint.activate([
            passwordfield.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor),
            passwordfield.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            passwordfield.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            passwordfield.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //CONFIRM PASSWORD LABEL
        NSLayoutConstraint.activate([
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordfield.bottomAnchor, constant: 20),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            confirmPasswordLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -130),
            confirmPasswordLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //CONFIRM PASSWORD FIELD
        NSLayoutConstraint.activate([
            confirmPassField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor),
            confirmPassField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            confirmPassField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            confirmPassField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //RESET PASSWORD BUTTON
        NSLayoutConstraint.activate([
            resetPasswordButton.topAnchor.constraint(equalTo: confirmPassField.bottomAnchor, constant: 50),
            resetPasswordButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            resetPasswordButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            resetPasswordButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 40)
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

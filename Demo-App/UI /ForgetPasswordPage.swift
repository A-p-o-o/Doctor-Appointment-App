//
//  ForgetPasswordPage.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 09/03/23.
//

import UIKit

class ForgetPasswordPage: UIViewController {
    
    let contentView = UIView()
    
    let forgotPasswordLabel = UILabel()
    
    let emailLabel = UILabel()
    let emailField = UITextField()
    
    let forgotPasswordButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradient()
        setContentView()
        setLabels()
        setFields()
        setButton()
        setConstraints()
    }
    
    func setContentView(){
        view.addSubview(contentView)
        contentView.layer.cornerRadius = 20
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200)
        ])
    }
    
    func setLabels(){
        
        //FORGOT PASSWORD LABEL
        contentView.addSubview(forgotPasswordLabel)
        forgotPasswordLabel.text = "Forgot Password"
        forgotPasswordLabel.textColor = .white
        forgotPasswordLabel.font = UIFont(name: "Avenir Next", size: 40)
        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        //EMAIL LABEL
        contentView.addSubview(emailLabel)
        emailLabel.text = "Email Address"
        emailLabel.textColor = .systemBlue
        emailLabel.font = UIFont(name: "Avenir Next", size: 20)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setFields(){
        //EMAIL FIELD
        contentView.addSubview(emailField)
        emailField.borderStyle = .roundedRect
        emailField.textColor = UIColor(named: "TextFieldColor")
        emailField.backgroundColor = .lightGray
        emailField.layer.cornerRadius = 20
        emailField.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setButton(){
        //FORGOT PASSWORD BUTTON
        contentView.addSubview(forgotPasswordButton)
        forgotPasswordButton.configuration = .filled()
        forgotPasswordButton.setTitle("Forgot Password", for: .normal)
        forgotPasswordButton.configuration?.baseBackgroundColor = .red
        forgotPasswordButton.configuration?.baseForegroundColor = .white
        
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setConstraints(){
        //FORGOT PASSWORD LABEL
        NSLayoutConstraint.activate([
            forgotPasswordLabel.topAnchor.constraint(equalTo:contentView.topAnchor, constant: 20),
            forgotPasswordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            forgotPasswordLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            forgotPasswordLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        //EMAIL LABEL
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo:forgotPasswordLabel.bottomAnchor, constant: 30),
            emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -160),
            emailLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //EMAIL FIELD
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
            emailField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            emailField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            emailField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //FORGOT PASSWORD BUTTON
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 50),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 40)
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

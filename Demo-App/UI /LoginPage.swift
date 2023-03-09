//
//  LoginPage.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 09/03/23.
//

import UIKit

class LoginPage: UIViewController {
    
    let loginView = UIView()
    
    let emailLabel = UILabel()
    let passwordLabel = UILabel()
    
    let emailField = UITextField()
    let passwordfield = UITextField()
    
    let signInButton = UIButton()
    let forgottenPassLabel = UILabel()
    let donthaveAnAccountLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradient()
        setLoginView()
       // setBacgroundImage()
        setLabels()
        setTextFields()
        setButton()
        setConstraints()
    }
    
//    let backgroundImageView = UIImageView()
//
//    func setBacgroundImage(){
//        backgroundImageView.image = UIImage(named: "image")
//        backgroundImageView.contentMode = .scaleAspectFit
//
//        loginView.addSubview(backgroundImageView)
//        loginView.sendSubviewToBack(backgroundImageView)
//
//        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            backgroundImageView.topAnchor.constraint(equalTo: loginView.topAnchor),
//            backgroundImageView.bottomAnchor.constraint(equalTo: loginView.bottomAnchor),
//            backgroundImageView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
//            backgroundImageView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
//        ])
//    }
//
    func setLoginView(){
        view.addSubview(loginView)
        
        loginView.layer.cornerRadius = 20
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            loginView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            loginView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150)
        ])
    }
    
    
    
    func setLabels(){
        //EMAIL LABEL
        loginView.addSubview(emailLabel)
        emailLabel.text = "Email Address"
        emailLabel.textColor = .systemBlue
        emailLabel.font = UIFont(name: "Avenir Next", size: 20)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //PASSWORD LABEL
        loginView.addSubview(passwordLabel)
        passwordLabel.text = "Password"
        passwordLabel.textColor = .systemBlue
        passwordLabel.font = UIFont(name: "Avenir Next", size: 20)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //FORGOTTEN PASSWORD LABEL
        loginView.addSubview(forgottenPassLabel)
        forgottenPassLabel.text = "Forget Password?"
        forgottenPassLabel.textColor = .lightGray
        forgottenPassLabel.font = UIFont(name: "Avenir Next", size: 17)
        forgottenPassLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //DONT HAVE AN ACCOUNT LABEL
        loginView.addSubview(donthaveAnAccountLabel)
        let attributedString = NSMutableAttributedString(string: "Don\'t have an account? Register here")
        attributedString.addAttribute(.foregroundColor, value: UIColor(named: "black")!, range: NSRange(location: 0, length: 22))
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: NSRange(location: 23, length: 13))

        donthaveAnAccountLabel.attributedText = attributedString
        donthaveAnAccountLabel.font = UIFont(name: "Avenir Next", size: 15)
        donthaveAnAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setTextFields(){
        //EMAIL FIELD
        loginView.addSubview(emailField)
        emailField.borderStyle = .roundedRect
        emailField.textColor = UIColor(named: "TextFieldColor")
        emailField.backgroundColor = .lightGray
        emailField.layer.cornerRadius = 20
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        
        //PASSWORD FIELD
        loginView.addSubview(passwordfield)
        passwordfield.borderStyle = .roundedRect
        passwordfield.textColor = UIColor(named: "TextFieldColor")
        passwordfield.backgroundColor = .lightGray
        passwordfield.layer.cornerRadius = 20
        passwordfield.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setButton(){
        //SIGN IN BUTTON
        loginView.addSubview(signInButton)
        signInButton.configuration = .filled()
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.configuration?.baseBackgroundColor = .red
        signInButton.configuration?.baseForegroundColor = .white
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setConstraints(){
        //EMAIL LABEL
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo:loginView.topAnchor, constant: 50),
            emailLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -160),
            emailLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //EMAIL FIELD
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
            emailField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor,constant: 20),
            emailField.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20),
            emailField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //PASSWORD LABEL
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20),
            passwordLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -160),
            passwordLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //PASSWORD FIELD
        NSLayoutConstraint.activate([
            passwordfield.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor),
            passwordfield.leadingAnchor.constraint(equalTo: loginView.leadingAnchor,constant: 20),
            passwordfield.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20),
            passwordfield.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //SIGN IN BUTTON
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: passwordfield.bottomAnchor, constant: 50),
            signInButton.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor,constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20)
        ])
        
        //FORGET PASSWORD LABEL
        NSLayoutConstraint.activate([
            forgottenPassLabel.topAnchor.constraint(equalTo:signInButton.bottomAnchor, constant: 10),
            forgottenPassLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20),
            forgottenPassLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -160),
            forgottenPassLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        //DONT HAVE AN ACCOUNT LABEL
        NSLayoutConstraint.activate([
            donthaveAnAccountLabel.topAnchor.constraint(equalTo: forgottenPassLabel.bottomAnchor,constant: 50),
            donthaveAnAccountLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor,constant: 20),
            donthaveAnAccountLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor,constant: -20)
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

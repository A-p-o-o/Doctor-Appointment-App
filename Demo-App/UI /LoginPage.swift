//
//  LoginPage.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 09/03/23.
//

import UIKit

class LoginPage: UIViewController {
    
    let loginView = UIView()
    
    
    let email = LabelAndField()
    let password = LabelAndField()
    let signInButton = UIButton()
    let forgottenPassLabel = UILabel()
    let donthaveAnAccountLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradient()
        setLoginView()
       // setBacgroundImage()
        setEmail()
        setPassword()
        setLabels()
       
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
            loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            loginView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            loginView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150)
        ])
    }
    
    func setEmail(){
        loginView.addSubview(email)
        email.translatesAutoresizingMaskIntoConstraints = false
        email.label.text = "Email"
        email.errorLabel.isHidden = true
        email.textField.delegate = self
    }
    
    func setPassword(){
        loginView.addSubview(password)
        password.translatesAutoresizingMaskIntoConstraints = false
        password.label.text = "Password"
        password.errorLabel.isHidden = true
        password.textField.delegate = self
    }
    
    
    
    func setLabels(){
        
       
        //FORGOTTEN PASSWORD LABEL
        loginView.addSubview(forgottenPassLabel)
        forgottenPassLabel.text = "Forget Password?"
        forgottenPassLabel.textColor = UIColor(named: "black")
        forgottenPassLabel.font = UIFont(name: "Avenir Next", size: 17)
        forgottenPassLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //DONT HAVE AN ACCOUNT LABEL
        loginView.addSubview(donthaveAnAccountLabel)
        let attributedString = NSMutableAttributedString(string: "Don\'t have an account? Register here")
        attributedString.addAttribute(.foregroundColor, value: UIColor(named: "black")!, range: NSRange(location: 0, length: 22))
        attributedString.addAttribute(.foregroundColor, value: UIColor(named: "blue")!, range: NSRange(location: 23, length: 13))

        donthaveAnAccountLabel.attributedText = attributedString
        donthaveAnAccountLabel.font = UIFont(name: "Avenir Next", size: 15)
        donthaveAnAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        
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
        
       
        NSLayoutConstraint.activate([
            email.topAnchor.constraint(equalTo:loginView.topAnchor, constant: 50),
            email.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            email.widthAnchor.constraint(equalTo: loginView.widthAnchor, multiplier: 0.9),
            email.heightAnchor.constraint(equalToConstant: 100),
            email.label.heightAnchor.constraint(equalToConstant: 30),
            email.textField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            password.topAnchor.constraint(equalTo:email.bottomAnchor, constant: 20),
            password.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            password.widthAnchor.constraint(equalTo: loginView.widthAnchor, multiplier: 0.9),
            password.heightAnchor.constraint(equalToConstant: 100),
            password.label.heightAnchor.constraint(equalToConstant: 30),
            password.textField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //SIGN IN BUTTON
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 50),
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
        if view.layer.sublayers?.count != nil {
            view.layer.sublayers![0].removeFromSuperlayer()
        }
        let gradientLayer2 = CAGradientLayer()
        gradientLayer2.frame = view.bounds
        gradientLayer2.colors = [UIColor(named: "black")!.cgColor,UIColor(named:"white")!.cgColor,UIColor.blue.cgColor]
        gradientLayer2.startPoint = CGPoint(x: 0, y: 0)
        view.layer.insertSublayer(gradientLayer2, at: 0)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) || traitCollection.verticalSizeClass != previousTraitCollection?.verticalSizeClass {
           setGradient()
            if traitCollection.userInterfaceStyle == .dark {
                print("Dark")
            }
        }
    }

}

extension LoginPage : UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        active(textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        inActive(textField)
        
        switch textField {
        case email.textField : validateEmail(email: textField.text!)
        case password.textField : validPassword(password: textField.text!)
        default : return
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField  {
        case email.textField : password.textField.becomeFirstResponder()
        case password.textField : password.textField.resignFirstResponder()
        default : true
        }
        return true
    }
    
    
    private func active(_ textField: UITextField){
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor(named: "blue")?.cgColor
        textField.backgroundColor = UIColor(named: "field_active")
    }
    
    private func inActive(_ textField: UITextField) {
        textField.backgroundColor = UIColor(named: "field_inactive")
        textField.layer.borderWidth = 0
    }
    
    private func validateEmail(email:String){
        let emailRegex = "^[\\+\\-\\p{L}\\p{M}\\p{N}_]([\\p{L}\\p{M}\\p{N}!#$%&'*+\\-\\/=?^_`{|}~.]*)@(?=.{4,256}$)(([\\p{L}\\p{N}\\p{M}]+)(([\\-_]*[\\p{L}\\p{M}\\p{N}])*)[.])+[\\p{L}\\p{M}]{2,22}$"
        
        if let _ = email.range(of: emailRegex, options: .regularExpression) {
            self.email.errorLabel.isHidden = true
                } else {
                    self.email.textField.layer.borderWidth = 1
                    self.email.textField.layer.borderColor = UIColor.systemRed.cgColor
                    self.email.errorLabel.text = "*Invalid Email address"
                    self.email.errorLabel.isHidden = false
                }
    }
    
    private func validPassword(password:String){
        if password.count < 8 {
            self.password.textField.layer.borderWidth = 1
            self.password.textField.layer.borderColor = UIColor.systemRed.cgColor
            self.password.errorLabel.text = "*Password should be minimum 8 charcaters"
            self.password.errorLabel.isHidden = false
        }
        else{
            self.password.errorLabel.isHidden = true
        }
    }
    
    
}

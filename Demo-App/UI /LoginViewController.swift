//
//  LoginViewController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 05/04/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var email : String? = nil
    var password : String? = nil
    

    let scrollView = UIScrollView()
    let stackView = UIStackView()
  
    let loginImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "login")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let loginButton : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = UIColor(named: "book")
        button.configuration?.baseForegroundColor = UIColor(named: "white")
        button.setTitle("Log In", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let dontHaveAnAccountButton : UIButton = {
        let button = UIButton()
        button.configuration = .borderless()
        button.configuration?.baseBackgroundColor = .red
        button.configuration?.baseForegroundColor = UIColor(named: "book")
        button.setTitle("Don't Have An Account ?", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let titles : [String] = ["Email","Password"]
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotifications()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterForKeyboardNotifications()
    }

    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "background")
        navigationController?.navigationBar.tintColor = UIColor(named: "book")
        
        setContainerViews()
        setTitleAndFields()
        createBottomView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        view.endEditing(true)
        stackView.spacing = 20
        for view in stackView.arrangedSubviews {
            guard let labelAndField = view as? LabelAndField else { continue }
            
            labelAndField.textField.text = ""
            labelAndField.errorLabel.isHidden = true
            
        }
    }

    
    func setContainerViews(){
        view.addSubview(scrollView)
        
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20)
        ])
        
        scrollView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                    stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                    stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                    stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                    stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
                ])
        
        stackView.addArrangedSubview(loginImageView)
        NSLayoutConstraint.activate([
            loginImageView.heightAnchor.constraint(equalToConstant:  Viewheight * 0.1),
        ])
    }
    
    
    func setTitleAndFields(){
        
        for index in 0..<titles.count {
           
            let titleAndField = LabelAndField()
            titleAndField.label.text = titles[index]
            titleAndField.textField.placeholder = ""
           
            
            titleAndField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                titleAndField.heightAnchor.constraint(greaterThanOrEqualToConstant:  Viewheight * 0.09),
                titleAndField.widthAnchor.constraint(equalToConstant: viewWidth * 0.9)
            ])
            
       
            titleAndField.errorLabel.isHidden = true
            titleAndField.tag = index
            stackView.addArrangedSubview(titleAndField)
            
            if titleAndField.tag == 0 {
                titleAndField.textField.autocapitalizationType = .none
                titleAndField.textField.text = "userid@gmail.com"
            }
            else if titleAndField.tag == 1 {
                titleAndField.asPasswordSecure()
                titleAndField.textField.text = "D1234567"
            }
        }
        
    }
    
    
    func createBottomView(){
        
        stackView.addArrangedSubview(loginButton)
        
        loginButton.widthAnchor.constraint(equalToConstant: viewWidth * 0.4).isActive = true
        
        stackView.addArrangedSubview(dontHaveAnAccountButton)
        
        loginButton.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        dontHaveAnAccountButton.addTarget(self, action: #selector(notHaveAnAccount), for: .touchUpInside)
    }
    
    @objc func notHaveAnAccount(){
        let viewController = RegisterViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func logIn(){
        view.endEditing(true)
     
        if validateFields()&&isAccountExist()&&isPasswordCorrect(){
            
            
                let user = UserDAO()
                let patient =  user.getUser(userId: email!) as! Patient
           
            navigationController?.popToRootViewController(animated: false)
            
            let viewController = PatientTabBarController(userId: patient.UserId)
           
            viewController.modalPresentationStyle = .fullScreen
            
            present(viewController, animated: true)
        }
          //  navigationController?.pushViewController(viewController, animated: true)
      
    }
    
    func validateFields()->Bool{
        
        for view in stackView.arrangedSubviews{
            guard  let labelAndField = view as? LabelAndField else { continue }
            
            if labelAndField.tag == 0 {
                
                if !labelAndField.isValidEmail(email: &email){
                    return false
                }
            }
            else {
                
                if labelAndField.isTextEmpty(){
                    return false
                }else {
                    password = labelAndField.textField.text!
                }
            }
        }
        return true
    }
    
    func isAccountExist()->Bool{
        let login = Login()
        if  login.isIdExist(userId: email!){
            return true
        }
        let alertController = UIAlertController(title: "Account Not Found", message: "There is no Account Registered for \(email!)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
     return false
    }
    
    func isPasswordCorrect()->Bool{
        let login = Login()
        if login.isPasswordCorrect(userid: email!, password: password!){
            return true
        }
        let alertController = UIAlertController(title: "Incorrect Password", message: "The Password You Have entered is Incorrect ,Please try again", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
        return false
    }
    

   
}


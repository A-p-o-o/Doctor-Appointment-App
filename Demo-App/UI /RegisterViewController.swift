//
//  RegisterViewController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 05/04/23.
//

import UIKit

class RegisterViewController: UIViewController,UITextFieldDelegate {

    
    var phoneNumber : String? = nil
    var email : String? = nil
    var password : String? = nil

    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
  
    let registerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "register")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nextButton : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .red
        button.configuration?.baseForegroundColor = UIColor(named: "white")
        button.setTitle("Next Page", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let alreadyHaveAnAccountButton : UIButton = {
        let button = UIButton()
        button.configuration = .borderless()
        button.configuration?.baseBackgroundColor = .red
        button.configuration?.baseForegroundColor = UIColor(named: "book")
        button.setTitle("Already Have An Account ?", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let titles : [String] = ["Mobile Number","Email Address","Password","Confirm Password"]
    
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
        
        setContainerViews()
        setTitleAndFields()
        createBottomView()
    }

    
    func setContainerViews(){
        view.addSubview(scrollView)
        
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20)
        ])
        
        scrollView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 25
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
        
        stackView.addArrangedSubview(registerImageView)
        NSLayoutConstraint.activate([
            registerImageView.heightAnchor.constraint(equalToConstant:  Viewheight * 0.1),
        ])
    }
    
    
    func setTitleAndFields(){
        
        for index in 0..<titles.count {
           
            let titleAndField = LabelAndField()
            titleAndField.label.text = titles[index]
            titleAndField.textField.placeholder = ""
           
            
            titleAndField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                titleAndField.heightAnchor.constraint(greaterThanOrEqualToConstant:  Viewheight * 0.08),
                titleAndField.widthAnchor.constraint(equalToConstant: viewWidth * 0.9)
            ])
           
            titleAndField.errorLabel.isHidden = true
            titleAndField.tag = index
            stackView.addArrangedSubview(titleAndField)
            setInputViewForFields(LabelAndField: titleAndField)
            
            if titleAndField.tag == 2 || titleAndField.tag == 3 {
                titleAndField.asPasswordSecure()
            }
        }
        
    }
    
    func isUserIdAlreadyExist()->Bool{
        let user = UserDAO()
      return  user.isUserIdExist(userId: email!)
    }
    
    func createBottomView(){
        
        stackView.addArrangedSubview(nextButton)
        
        nextButton.widthAnchor.constraint(equalToConstant: viewWidth * 0.3).isActive = true
        
        stackView.addArrangedSubview(alreadyHaveAnAccountButton)
        
        NSLayoutConstraint.activate([
            alreadyHaveAnAccountButton.heightAnchor.constraint(equalToConstant: Viewheight * 0.04),
            
        ])
        nextButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        alreadyHaveAnAccountButton.addTarget(self, action: #selector(haveAnAccount), for: .touchUpInside)
    }
    
    @objc func nextPage(){
        
        if validateFields(){
            
            if isUserIdAlreadyExist(){
                let alertController = UIAlertController(title: "Account Already Exist", message: "There is already an account connected to \(email!)", preferredStyle: .alert)
                
                let loginAction = UIAlertAction(title: "Login", style: .default){_ in
                    self.haveAnAccount()
                }
                let okAction = UIAlertAction(title: "OK", style: .default)
                
                alertController.addAction(loginAction)
                alertController.addAction(okAction)
                present(alertController,animated: true)
            }
            else {
                let viewController = RegisterSecondPageViewController()
                viewController.mobileNumber = phoneNumber
                viewController.password = password
                viewController.email = email
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
        
    }
    
    @objc func haveAnAccount(){
        navigationController?.popToRootViewController(animated: false)
    }
   
    
    func setInputViewForFields(LabelAndField : LabelAndField){
        
        switch LabelAndField.tag {
        case 0 : LabelAndField.onlyNumbers()
        default : LabelAndField.textField.keyboardType = .default
        }
    }
    
    func validateFields()->Bool{
        for views in stackView.arrangedSubviews{
            guard let labelAndField = views as? LabelAndField else { continue  }
            
            switch labelAndField.tag {
            case 0 : if !labelAndField.isValidPhoneNumber(phoneNumber: &phoneNumber) {
                return false
            }
            case 1 : if !labelAndField.isValidEmail(email: &email){
                return false
            }
            case 2 :if !labelAndField.isValidPassword(password: &password){
                return false
            }
            case 3 :
                if labelAndField.isTextEmpty(){
                    return false
                }
                else {
                    if  labelAndField.textField.text! != password {
                        labelAndField.errorLabel.isHidden = false
                        labelAndField.errorLabel.text = "Password does not match"
                        labelAndField.makeTextFieldRed()
                        return false
                    }
                    else {
                        labelAndField.hideErrorLabel()
                        labelAndField.makeTextFieldNormal()
                    }
                }
            default : continue
                
            }
        }
        return true
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
       return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor(named: "book")?.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }

}

//
//  RegisterSecondPageViewController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 05/04/23.
//

import UIKit

class RegisterSecondPageViewController: UIViewController {
    
    var mobileNumber : String? = nil
    var email : String? = nil
    var password : String? = nil
    var name : String? = nil
    var dateOfBirth : Date? = nil
    var bloodGroup : BloodGroup? = nil
    var gender : Sex? = nil
    
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
  
    let registerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "register")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let createButton : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .red
        button.configuration?.baseForegroundColor = UIColor(named: "white")
        button.setTitle("Create Account", for: .normal)
        
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
    
    let titles : [String] = ["Name","Date Of Birth","Blood Group","Sex"]
    
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
           
            titleAndField.textField.delegate = self
            
            titleAndField.errorLabel.isHidden = true
            titleAndField.tag = index
            stackView.addArrangedSubview(titleAndField)
            
            switch index {
            case 0 : titleAndField.textField.keyboardType = .alphabet
            case 1 : titleAndField.asDateOfBirth()
            case 2 : titleAndField.setBloodGroupPicker()
            case 3 :  titleAndField.setGenderPicker()
            default : continue
            }
            
        }
        
    }
    
    func createBottomView(){
        
        stackView.addArrangedSubview(createButton)
        
        createButton.widthAnchor.constraint(equalToConstant: viewWidth * 0.4).isActive = true
        
        stackView.addArrangedSubview(alreadyHaveAnAccountButton)
       
        createButton.addTarget(self, action: #selector(createClicked), for: .touchUpInside)
        alreadyHaveAnAccountButton.addTarget(self, action: #selector(haveAnAccount), for: .touchUpInside)
    }
    
    
    @objc func createClicked(){
        
        if validateFields(){
            let register = Register()
            register.createAccount(userName: name!, password: password!, UserId: email!, role: .Patient, name: name!, phoneNumber: mobileNumber!, sex: gender!, mail: email!, address: "", patientId: "", weight: 0.0, height: 0.0, AllergyTo: "")
            
            
            let alertController = UIAlertController(title: "Account created Successfully", message: "", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default){ _ in
                self.navigationController?.popToRootViewController(animated: false)
            }
            
            alertController.addAction(okAction)
           present(alertController, animated: true)
        }
        
      
        
    }
    
    @objc func haveAnAccount(){
        navigationController?.popToRootViewController(animated: false)
    }
    
    func validateFields()->Bool{
        for views in stackView.arrangedSubviews{
            guard let labelAndField = views as? LabelAndField else { continue }
            switch labelAndField.tag {
            case 0 : if  !labelAndField.isValidName(name: &name){
                scrollToView(view: labelAndField)
                return false
            }
            case 1 : if labelAndField.isTextEmpty(){
                scrollToView(view: labelAndField)
                return false
            }
                else {
                    dateOfBirth = labelAndField.selectedDate
                }
            case 2 :if labelAndField.isTextEmpty(){
                scrollToView(view: labelAndField)
                return false
            }
                else {
                    bloodGroup = BloodGroup.getBloodGroup(from: labelAndField.textField.text!)
                }
            case 3 :
                if labelAndField.isTextEmpty(){
                    scrollToView(view: labelAndField)
                    return false
                }
                    else {
                        gender = Sex.getSex(from: labelAndField.textField.text!)
                    }
            default : continue
            }
        }
        return true
    }
    
    func userDatas(mobileNumber: String, email: String, password: String) {
        self.mobileNumber = mobileNumber
        self.email = email
        self.password = password
    }
    
    func scrollToView(view: UIView) {
        scrollView.scrollRectToVisible(view.frame, animated: true)
    }
   
}


extension RegisterSecondPageViewController : UITextFieldDelegate {
    
    
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




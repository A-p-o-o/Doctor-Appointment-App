//
//  ResetPasswordController.swift
//  DocArc
//
//  Created by deepak-pt6306 on 10/04/23.
//

import UIKit

class ResetPasswordController: UIViewController {

    var patient : Patient
    
    var password : String? = nil
    
    init(userId : String){
        let user = UserDAO()
        self.patient = (user.getUser(userId: userId) as! Patient)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()

    
    let resetPasswordImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "resetpassword")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let enterPassword : LabelAndField = LabelAndField()
    let resetPassword : LabelAndField = LabelAndField()
    let confirmPassword : LabelAndField = LabelAndField()
    let spaceView = UIView()
    let confirmButton : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.setTitle("Confirm", for: .normal)
        button.configuration?.baseBackgroundColor = .green
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let forgottonPassword : UIButton = {
        let button = UIButton()
        button.configuration = .borderless()
        button.setTitle("Forgot Password ?", for: .normal)
        button.configuration?.baseForegroundColor = UIColor(named: "book")
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
        setUpViews()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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
        
    }
    
    func setUpViews(){
        
        stackView.addArrangedSubview(resetPasswordImageView)
        stackView.addArrangedSubview(enterPassword)
        stackView.addArrangedSubview(resetPassword)
        stackView.addArrangedSubview(confirmPassword)
        stackView.addArrangedSubview(spaceView)
        stackView.addArrangedSubview(confirmButton)
        stackView.addArrangedSubview(forgottonPassword)
        
        enterPassword.label.text = "Enter Password"
        resetPassword.label.text = "New Password"
        confirmPassword.label.text = "Re-Type Password"
        
        resetPasswordImageView.translatesAutoresizingMaskIntoConstraints = false
        enterPassword.translatesAutoresizingMaskIntoConstraints = false
        resetPassword.translatesAutoresizingMaskIntoConstraints = false
        confirmPassword.translatesAutoresizingMaskIntoConstraints = false
        spaceView.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        forgottonPassword.translatesAutoresizingMaskIntoConstraints = false
        
        resetPassword.asPasswordSecure()
        enterPassword.asPasswordSecure()
        confirmPassword.asPasswordSecure()
        
        
        NSLayoutConstraint.activate([
            resetPasswordImageView.heightAnchor.constraint(equalToConstant:  Viewheight * 0.1),
            enterPassword.heightAnchor.constraint(equalToConstant: Viewheight * 0.09),
            resetPassword.heightAnchor.constraint(equalToConstant: Viewheight * 0.09),
            confirmPassword.heightAnchor.constraint(equalToConstant: Viewheight * 0.09),
            spaceView.heightAnchor.constraint(equalToConstant: 50),
            confirmButton.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),
            forgottonPassword.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),
            
            enterPassword.widthAnchor.constraint(equalToConstant: viewWidth - 40),
            resetPassword.widthAnchor.constraint(equalToConstant: viewWidth - 40),
            confirmPassword.widthAnchor.constraint(equalToConstant: viewWidth - 40),
            confirmButton.widthAnchor.constraint(equalToConstant: viewWidth - 60),

        ])
        
        confirmButton.addTarget(self, action: #selector(confirmClicked), for: .touchUpInside)
        forgottonPassword.addTarget(self, action: #selector(forgotClicked), for: .touchUpInside)
    }
    
    
    func validateFields()->Bool{
       
        
        if enterPassword.isTextEmpty(){
            scrollToView(view: enterPassword)
            return false
        }
        else {
            if enterPassword.textField.text! != patient.password {
                
                let alertController = UIAlertController(title: "Incorrect Password", message: "The password You have entered is wrong. Please Try Again", preferredStyle: .alert)
                
                let OKaction = UIAlertAction(title: "Ok", style: .default)
                
                alertController.addAction(OKaction)
                present(alertController, animated: true)
                scrollToView(view: enterPassword)
                return false
            }
        }
        
        if !resetPassword.isValidPassword(password: &password){
            scrollToView(view: resetPassword)
            return false
        }
        
        if confirmPassword.isTextEmpty(){
            scrollToView(view: confirmPassword)
            return false
        }
        else {
            if resetPassword.textField.text! != confirmPassword.textField.text!{
                confirmPassword.displayErrorLabel(text: "*Password does not match")
                scrollToView(view: confirmPassword)
                return false
            }
        }
        return true
    }
    
    @objc func confirmClicked(){
        
        
        if validateFields(){
            patient.changePassword(newPassword: password!)
            
            let alertController = UIAlertController(title: "Password Changed Successfully", message: "", preferredStyle: .alert)
            
            let OKaction = UIAlertAction(title: "Ok", style: .default){ _ in
                self.navigationController?.popViewController(animated: true)
            }
            
            alertController.addAction(OKaction)
            present(alertController, animated: true)
            
        }
    }
    
    @objc func forgotClicked(){
        enterPassword.textField.text = patient.password
    }
    
    func scrollToView(view: UIView) {
        scrollView.scrollRectToVisible(view.frame, animated: true)
    }
    

}

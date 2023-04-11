//
//  MyAccountController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 01/04/23.
//

import UIKit

class MyAccountController: UIViewController {

    
    var patient : Patient
    
    init(userId : String) {
       
        let user = UserDAO()
        self.patient = (user.getUser(userId: userId) as! Patient)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor(named: "book")
        
        view.backgroundColor = UIColor(named: "background")
        setViews()
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        let user = UserDAO()
        self.patient = (user.getUser(userId: patient.UserId) as! Patient)
        profileView.nameLabel.text = patient.name
    }
    
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    let profileView = ProfileView()
    let resetPasswordView = ImageAndLabelView(image: UIImage(systemName: "key.horizontal.fill")?.withTintColor(.green, renderingMode: .alwaysOriginal), text: "Reset Password")
    
    let aboutUs = ImageAndLabelView(image: UIImage(systemName: "person.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal), text: "About Us")
    
    let likeUsView = ImageAndLabelView(image: UIImage(systemName: "hand.thumbsup.fill")?.withTintColor(.systemPink, renderingMode: .alwaysOriginal), text: "Like Us")
    
    let logOutView = ImageAndLabelView(image: UIImage(systemName: "rectangle.portrait.and.arrow.forward")?.withTintColor(UIColor(named: "book")!, renderingMode: .alwaysOriginal), text: "Log Out")
    
    let deleteAccountView = ImageAndLabelView(image: UIImage(systemName: "trash")?.withTintColor(.red, renderingMode: .alwaysOriginal), text: "Delete Account")
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
    
    func setViews(){
        
        profileView.nameLabel.text = patient.name
        
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 10),
        ])
        
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        stackView.addArrangedSubview(profileView)
        stackView.addArrangedSubview(resetPasswordView)
        //stackView.addArrangedSubview(aboutUs)
        //stackView.addArrangedSubview(likeUsView)
        stackView.addArrangedSubview(logOutView)
        stackView.addArrangedSubview(deleteAccountView)
        
        for views in stackView.arrangedSubviews{
            views.translatesAutoresizingMaskIntoConstraints = false
            
            views.backgroundColor = UIColor(named: "white")
            
            if views is ProfileView {
                let profile = views as! ProfileView
                NSLayoutConstraint.activate([
                    profile.heightAnchor.constraint(equalToConstant: Viewheight  * 0.3),
                    profile.imageView.heightAnchor.constraint(equalToConstant: (viewWidth  * 0.4)),
                    profile.imageView.widthAnchor.constraint(equalToConstant: (viewWidth  * 0.4))
                ])
                
                
                profile.imageView.layer.cornerRadius = (viewWidth  * 0.4)/2
                
                
                profile.editButton.addTarget(self, action: #selector(editClicked), for: .touchUpInside)
            }
            else {
                NSLayoutConstraint.activate([
                    views.heightAnchor.constraint(equalToConstant: Viewheight * 0.07)
                ])
            }
            
            views.layer.cornerRadius = 10
            views.layer.shadowColor = UIColor(named: "shadow")?.cgColor
            views.layer.shadowOpacity = 0.5
            views.layer.shadowOffset = CGSize(width: 2, height: 2)
            views.layer.shadowRadius = 5
            
            logOutView.isUserInteractionEnabled = true
            let tapgesture = UITapGestureRecognizer(target: self, action: #selector(logOut))
            logOutView.addGestureRecognizer(tapgesture)
            
            likeUsView.isUserInteractionEnabled = true
            let likeUsGesture = UITapGestureRecognizer(target: self, action: #selector(likeUsTapped(_:)))
            likeUsView.addGestureRecognizer(likeUsGesture)
            
            deleteAccountView.isUserInteractionEnabled = true
            let deleteGesture = UITapGestureRecognizer(target: self, action: #selector(deleteClicked))
            deleteAccountView.addGestureRecognizer(deleteGesture)
            
            resetPasswordView.isUserInteractionEnabled = true
            let resetGesture = UITapGestureRecognizer(target: self, action: #selector(resetClicked))
            resetPasswordView.addGestureRecognizer(resetGesture)
        }
    }
    
    @objc func editClicked(){
        let viewController = EditPatientProfileController(userId: patient.UserId)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func logOut(){
        navigationController?.popToRootViewController(animated: false)
        dismiss(animated: true)
    }
    
   @objc func likeUsTapped(_ sender: Any) {
        let appID = "324684580"
        let urlStr = "itms-apps://itunes.apple.com/app/id\(appID)"
        if let url = URL(string: urlStr), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc func resetClicked(){
        let viewController = ResetPasswordController(userId: patient.UserId)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func deleteClicked(){
        
        let alertController = UIAlertController(title: "Are you sure to Delete Your Account", message: "All your details will be erased", preferredStyle: .alert)
        
        let  yesAction = UIAlertAction(title: "Yes", style: .destructive){_ in
            self.patient.deleteAccount()
            self.navigationController?.popToRootViewController(animated: false)
            self.dismiss(animated: true)
        }
        let noAction = UIAlertAction(title: "No", style: .default)
        
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        
        present(alertController, animated: true)
    }
}

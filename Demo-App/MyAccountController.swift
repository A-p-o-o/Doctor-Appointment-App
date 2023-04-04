//
//  MyAccountController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 01/04/23.
//

import UIKit

class MyAccountController: UIViewController {

    
    let patient : Patient
    
    init(patient: Patient) {
        self.patient = patient
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "background")
        setViews()
    
    }
    
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    let profileView = ProfileView()
    let helpCentreView = ImageAndLabelView(image: UIImage(systemName: "person.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal), text: "help Centre")
    let aboutUs = ImageAndLabelView(image: UIImage(systemName: "person.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal), text: "help Centre")
    let likeUsView = ImageAndLabelView(image: UIImage(systemName: "person.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal), text: "help Centre")
    let logOutView = ImageAndLabelView(image: UIImage(systemName: "person.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal), text: "help Centre")
    let deleteAccountView = ImageAndLabelView(image: UIImage(systemName: "person.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal), text: "help Centre")
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
    
    func setViews(){
        
        
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 20),
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
        stackView.addArrangedSubview(helpCentreView)
        stackView.addArrangedSubview(aboutUs)
        stackView.addArrangedSubview(likeUsView)
        stackView.addArrangedSubview(logOutView)
        stackView.addArrangedSubview(deleteAccountView)
        
        for views in stackView.arrangedSubviews{
            views.translatesAutoresizingMaskIntoConstraints = false
            
            views.backgroundColor = .white
            
            if views is ProfileView {
                NSLayoutConstraint.activate([
                    views.heightAnchor.constraint(equalToConstant: Viewheight  * 0.3)
                ])
                
                let profile = views as! ProfileView
                profile.imageView.layer.cornerRadius = ((viewWidth-40) * 0.4)/2
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
        }
    }
    
    @objc func editClicked(){
        let viewController = EditPatientProfileController(patient: self.patient)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

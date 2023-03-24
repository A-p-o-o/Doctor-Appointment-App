//
//  ViewController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    let doctordao = DoctorDAO()
    lazy var doc = doctordao.getDoctor(doctorId: "D1")
    
    lazy var profile = DoctorProfile(doctor: doc!)
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(profile)
       
        view.backgroundColor = UIColor(named: "background")
        
        profile.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profile.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            profile.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            profile.bottomAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        profile.photo.layer.cornerRadius = (profile.frame.width * 0.65) / 2
        profile.backgroundColor = .blue
    }
 
}







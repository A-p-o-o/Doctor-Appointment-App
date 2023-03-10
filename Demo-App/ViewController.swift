//
//  ViewController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 06/03/23.
//

import UIKit

class ViewController: UIViewController {

    

    
    let surgery = SurgeryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        set()
        
    }
    
    
    func set(){
        view.addSubview(surgery)
        surgery.translatesAutoresizingMaskIntoConstraints = false
        surgery.layer.cornerRadius = 30
        surgery.backgroundColor = .blue
        NSLayoutConstraint.activate([
            surgery.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            surgery.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            surgery.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            surgery.heightAnchor.constraint(equalToConstant: 250),
            surgery.widthAnchor.constraint(equalToConstant: view.frame.width-40)
        ])
        
        
    }
    
   
}


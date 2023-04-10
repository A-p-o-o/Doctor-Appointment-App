//
//  AppointmentController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 26/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    let genders : [String] = ["Male","Female","Non Binary"]
    
    
    let options : [String] = ["Myself","Father","Mother","Brother","Sister","Others"]
    let details : [String] = ["Name","Phone Number" , "E-mail", "Age" ,"Gender"]
    var patientDetails : [String:String] = [:]
    
    var name : String? = nil
    var mobileNumber : String? = nil
    var mail : String? = nil
    var age : Int? = nil
    var gender : Sex? = nil
    var reason : String? = nil
    
    
    let scrollView = UIScrollView()
    
    
    let createVertical = CreateVerticalView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
       setBackground()
        setContainerViews()
        setViews()
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
    
    var heightSpacing : CGFloat {  Viewheight * 0.02 }
    var widthSpacing : CGFloat { viewWidth * 0.03 }
    
    let stackView = UIStackView()
    
    
    func setBackground(){
        view.backgroundColor = UIColor(named: "background")
        
    }
    
    func setContainerViews(){
        view.addSubview(scrollView)
        
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20)
        ])
        
        scrollView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 20
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
    
    func setViews(){
        
        
        
        let appointForView = createVertical.createView(leftSide: ["Appointment For","Myself"], rightSide: ["",""])
        
        stackView.addArrangedSubview(appointForView)
        
        
        let left = ["Appointment Timing","Start Time","End Time","Date","Starts In"]
        let right = ["","Start Time","End Time","Date","Starts In"]
        
        let appointmentTiming = createVertical.createView(leftSide: left, rightSide: right)
        
        stackView.addArrangedSubview(appointmentTiming)
        
//        let deLeft = ["Bill Details","Consultation Fee ","Tax"]
//
//        let billDetailsView = createVertical.createView(leftSide: deLeft, rightSide: deLeft)
        
       // stackView.addArrangedSubview(billDetailsView)
        
    }
    
    
}

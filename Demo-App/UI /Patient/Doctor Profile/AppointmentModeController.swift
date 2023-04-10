//
//  AppointmentModeController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 05/04/23.
//

import UIKit

class AppointmentModeController: UIViewController {

    var doctor : Doctor? = nil
    var patient : Patient? = nil
    var starTime : String? = nil
    var endTime : String? = nil
    var date : String? = nil
    var slotNo : Int? = nil
    var appointment : Appointment? = nil

    let mainTitleString : String = "Choose Your Appointment Method"
    let images : [UIImage] = []
    
    let stackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
   let mainTitle :  UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true

        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let onlineMode : ImageAndLabelView = ImageAndLabelView(image: UIImage(named: "online"), text: "Online")
    let OfflineMode : ImageAndLabelView = ImageAndLabelView(image: UIImage(named: "offline"), text: "Offline")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false 
        view.backgroundColor = UIColor(named: "background")
        setStack()
    }
    
    
    func setStack(){
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.33)
        ])
        
        mainTitle.text = mainTitleString
        
        stackView.addArrangedSubview(mainTitle)
        stackView.addArrangedSubview(OfflineMode)
        stackView.addArrangedSubview(onlineMode)
        
        OfflineMode.imageView.alpha = 1
        onlineMode.imageView.alpha = 1
        
        OfflineMode.translatesAutoresizingMaskIntoConstraints = false
        onlineMode.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
           
            OfflineMode.heightAnchor.constraint(equalToConstant: view.frame.height * 0.1),
            onlineMode.heightAnchor.constraint(equalToConstant: view.frame.height * 0.1)
        ])
        
        onlineMode.layer.cornerRadius = 10
        onlineMode.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        onlineMode.layer.shadowOpacity = 0.5
        onlineMode.layer.shadowOffset = CGSize(width: 2, height: 2)
        onlineMode.layer.shadowRadius = 5
        onlineMode.backgroundColor = UIColor(named: "white")
        
        OfflineMode.layer.cornerRadius = 10
        OfflineMode.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        OfflineMode.layer.shadowOpacity = 0.5
        OfflineMode.layer.shadowOffset = CGSize(width: 2, height: 2)
        OfflineMode.layer.shadowRadius = 5
        OfflineMode.backgroundColor = UIColor(named: "white")
        
        let onlineGesture = UITapGestureRecognizer(target: self, action: #selector(onlineClicked))
        let offlineGesture = UITapGestureRecognizer(target: self, action: #selector(OfflineClicked))
        
        onlineMode.isUserInteractionEnabled = true
        OfflineMode.isUserInteractionEnabled = true
        
        onlineMode.addGestureRecognizer(onlineGesture)
        OfflineMode.addGestureRecognizer(offlineGesture)
    }
    
    
    @objc func onlineClicked(){
        let viewController = BookAppointmentController(doctor: doctor!, userId: patient!.UserId, startTime: starTime!, endTime: endTime!, date: date!, slotNo: slotNo!, type: .Online)
        print("onlineMode")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func OfflineClicked(){
        print("OfflineMode")
        let viewController = BookAppointmentController(doctor: doctor!, userId: patient!.UserId, startTime: starTime!, endTime: endTime!, date: date!, slotNo: slotNo!, type: .Offline)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}

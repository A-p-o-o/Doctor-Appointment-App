//
//  DoctorHomePage.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 21/03/23.
//

import UIKit

class DoctorHomePage: UIViewController {

    let doctor : Doctor
    
    let stackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let generateReport : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.setTitle("Generate Report", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.configuration?.baseBackgroundColor = .lightGray
        button.configuration?.baseForegroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let viewReport : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.setTitle("View Report", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.configuration?.baseBackgroundColor = .lightGray
        button.configuration?.baseForegroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let changeAvailability : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.setTitle("Change Availability", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.configuration?.baseBackgroundColor = .lightGray
        button.configuration?.baseForegroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let coustomSlot : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.setTitle("Create Coustom Slot", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.configuration?.baseBackgroundColor = .lightGray
        button.configuration?.baseForegroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let viewAppointments : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.setTitle("View Appointments", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.configuration?.baseBackgroundColor = .lightGray
        button.configuration?.baseForegroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    init(doctor: Doctor) {
        self.doctor = doctor
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setStack()
    }
    
    
    func setStack(){
        view.addSubview(stackView)
        
        let height  = view.frame.height * 0.7
        let width = view.frame.width * 0.8
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: height),
            stackView.widthAnchor.constraint(equalToConstant: width)
        ])
        
        stackView.spacing = view.frame.height * 0.03
        
        stackView.addArrangedSubview(generateReport)
        stackView.addArrangedSubview(viewReport)
        stackView.addArrangedSubview(changeAvailability)
        stackView.addArrangedSubview(coustomSlot)
        stackView.addArrangedSubview(viewAppointments)
        
        setButtonsTarget()
    }
    
    
    func setButtonsTarget(){
        generateReport.addTarget(self, action: #selector(generateReportClicked), for: .touchUpInside)
        viewReport.addTarget(self, action: #selector(viewReportClicked), for: .touchUpInside)
        changeAvailability.addTarget(self, action: #selector(ChangeAvailabilityClicked), for: .touchUpInside)
        coustomSlot.addTarget(self, action: #selector(coustomSlotClicked), for: .touchUpInside)
        viewAppointments.addTarget(self, action: #selector(viewAppointmentsClicked), for: .touchUpInside)
        
    }
    
    @objc func generateReportClicked(){
        let viewController = GenerateReport(doctor: doctor)
        viewController.title = "Generate Report"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func viewReportClicked(){
        let viewController = ViewReport(doctor: doctor)
        viewController.title = "View Report"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func ChangeAvailabilityClicked(){
        let viewController = ChangeAvailability(doctor: doctor)
        viewController.title = "Change Availability"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func coustomSlotClicked(){
        let viewController = CoustomSlot(doctor: doctor)
        viewController.title = "Create Coustom Slot"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func viewAppointmentsClicked(){
        let viewController = ViewAppointments(doctor: doctor)
        viewController.title = "View Appointments"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

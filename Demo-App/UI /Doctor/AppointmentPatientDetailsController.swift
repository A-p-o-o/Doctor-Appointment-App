//
//  AppointmentPatientDetailsController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 03/04/23.
//

import UIKit

class AppointmentPatientDetailsController: UIViewController {

    private let AppointmentTimingTitle : [String] = ["Appointment Timings",
                                                     "Date ",
                                                     "Time ",
                                                     "Starts in "]
    private let patientDetailsTitle : [String] = ["PatientDetails",
                                                  "Name ",
                                                  "Mail ",
                                                  "Mobile Number ",
                                                  "Age ",
                                                  "Gender ",
                                                  "Reason "]
    
    let appointmentAnswers : [String] = ["",
                                         ": 20-09-2002",
                                         ": 09:00-Am",
                                         ": 2 mins"]
    let patientsAnswers : [String] = ["",
                                      ": Navenn",
                                      ": naveen@gmail.com",
                                      ": 9462856483",
                                      ": 34",
                                      ": Male",
                                      ": hello Doctor, i am not feeling well , my stomach hurts and cant able to eat for for the past 3 days"]
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    let horizontalStack : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.alignment = .top
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let cancelButton : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .red
        button.configuration?.baseForegroundColor = UIColor(named: "white")
        button.setTitle("Cancel Appointment", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let attendButton : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .green
        button.configuration?.baseForegroundColor = UIColor(named: "white")
        button.setTitle("Attend", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "background")
        setContainerViews()
        createStack(details: AppointmentTimingTitle,Answers: appointmentAnswers)
        createStack(details: patientDetailsTitle,Answers: patientsAnswers)
        setBottomView()
    }
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
    
    
    func setContainerViews(){
        view.addSubview(scrollView)
        
        
        scrollView.showsVerticalScrollIndicator = true
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
    
    
    func setBottomView(){
        
        stackView.addArrangedSubview(horizontalStack)
        
       // horizontalStack.addArrangedSubview(cancelButton)
        horizontalStack.addArrangedSubview(attendButton)
        
        cancelButton.addTarget(self, action: #selector(cancelClicked), for: .touchUpInside)
        attendButton.addTarget(self, action: #selector(attendClicked), for: .touchUpInside)
    }
    
    
    
    private func createStack(details : [String],Answers : [String]){
        
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        verticalStack.spacing = 5
        verticalStack.alignment = .center
        verticalStack.distribution = .fill
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        self.stackView.addArrangedSubview(verticalStack)
        
       for index in 0..<details.count {
           
           let horizontalStack : UIStackView = {
               let stackView = UIStackView()
               stackView.axis = .horizontal
               stackView.spacing = 10
               stackView.distribution = .fill
               stackView.alignment = .center
               stackView.translatesAutoresizingMaskIntoConstraints = false
               return stackView
           }()
            
            let label : UILabel = {
                let label = UILabel()
                label.text = "Good Morning"
                label.numberOfLines = 0
                label.lineBreakMode = .byWordWrapping
                label.textColor = .black
                label.font = UIFont.systemFont(ofSize: 18, weight: .light)
                
                let fontMetrics = UIFontMetrics(forTextStyle: .body)
                label.font = fontMetrics.scaledFont(for: label.font)
                label.adjustsFontForContentSizeCategory = true
                
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            
            let detailsLabel : UILabel = {
                let label = UILabel()
                label.text = "Good Morning"
                label.numberOfLines = 0
                label.lineBreakMode = .byWordWrapping
                label.textColor = .black
                label.font = UIFont.systemFont(ofSize: 18, weight: .light)
                
                let fontMetrics = UIFontMetrics(forTextStyle: .body)
                label.font = fontMetrics.scaledFont(for: label.font)
                label.adjustsFontForContentSizeCategory = true
                
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            
            if index == 0 {
                
                label.text = details[index]
                label.font = UIFont.systemFont(ofSize: 20,weight: .medium)
                NSLayoutConstraint.activate([
                    label.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),
                    label.widthAnchor.constraint(equalToConstant: viewWidth - 60)
                ])
                
                verticalStack.addArrangedSubview(label)
            }
            
            else {
                horizontalStack.addArrangedSubview(label)
                horizontalStack.addArrangedSubview(detailsLabel)
                
        
                label.text = details[index]
                detailsLabel.text = Answers[index]
                
                let size = detailsLabel.sizeThatFits(CGSize(width: (viewWidth - 70)/1.5, height: CGFLOAT_MAX))
                
                NSLayoutConstraint.activate([
                    label.widthAnchor.constraint(equalToConstant: (viewWidth - 70)/2.5),
                    horizontalStack.widthAnchor.constraint(equalToConstant: viewWidth - 60),
                    detailsLabel.heightAnchor.constraint(equalToConstant: (size.height + 10))
                ])
                
                verticalStack.addArrangedSubview(horizontalStack)
            }
           
        }
        
        let spacing : UIView = {
          let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: 10).isActive = true
            return view
        }()
        
        verticalStack.addArrangedSubview(spacing)
                   
            verticalStack.layer.cornerRadius = 10
            verticalStack.layer.shadowColor = UIColor(named: "shadow")?.cgColor
            verticalStack.layer.shadowOpacity = 0.5
            verticalStack.layer.shadowOffset = CGSize(width: 2, height: 2)
            verticalStack.layer.shadowRadius = 5
            verticalStack.backgroundColor = UIColor(named: "white")
    }
    
    @objc func cancelClicked(){
        
    }
    
   @objc func attendClicked(){
//        let viewController = CallingController(appointment: )
//        navigationController?.pushViewController(viewController, animated: true)
    }


}

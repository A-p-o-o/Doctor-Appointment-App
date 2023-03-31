//
//  AppointmentDetailsController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 27/03/23.
//

import UIKit

class AppointmentDetailsController: UIViewController {


        let doctor : Doctor
        let patient : Patient
        let starTime : String
        let endTime : String
        let date : String
        let slotNo : Int
        let appointment : Appointment?
        
        
        let options : [String] = ["Myself","Father","Mother","Brother","Sister","Others"]
        let details : [String] = ["Name","Phone Number" , "E-mail (optional)", "Age" ,"Gender"]
        init(doctor: Doctor,patient: Patient,startTime : String,endTime : String,date: String,slotNo:Int) {
            self.doctor = doctor
            self.patient = patient
            self.starTime = startTime
            self.endTime = endTime
            self.date = date
            self.slotNo = slotNo
            self.appointment = nil
            super.init(nibName: nil, bundle: nil)
            
        }
        
        init(appointment : Appointment,patient : Patient){
            self.doctor = appointment.doctor
            self.patient = patient
            self.starTime = appointment.getTime().start
            self.endTime = appointment.getTime().end
            self.date = dateFormat(date: appointment.getdate()!)
            self.appointment = appointment
            self.slotNo = -1
            super.init(nibName: nil, bundle: nil)
        }
        
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        let scrollView = UIScrollView()
    
        let stackView : UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
    
        let doctorInformationView = UIView()
        let patientDetailsView = UIView()
        let appointmentTimingsView = UIView()
        let appointmentTypeView = UIView()
        let billDetailsView = UIView()
        let cancelView = UIView()
        
        let profileImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "image6")
            imageView.contentMode = .scaleAspectFit
            imageView.layer.cornerRadius = 0.4 * min(imageView.bounds.width, imageView.bounds.height)
            imageView.layer.masksToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let nameLabel: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.text = "Dr.Name"
            label.lineBreakMode = .byWordWrapping
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            
            let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
            label.font = fontMetrics.scaledFont(for: label.font)
            label.adjustsFontForContentSizeCategory = true
            
            label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 999), for: .vertical)
            label.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: .vertical)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
       
        let departmentLabel: UILabel = {
            let label = UILabel()
            label.text = "DepartMent"
            label.lineBreakMode = .byWordWrapping
            label.textColor = .black
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            label.font = UIFont.systemFont(ofSize: 20, weight: .light)
            
            let fontMetrics = UIFontMetrics(forTextStyle: .body)
            label.font = fontMetrics.scaledFont(for: label.font)
            label.adjustsFontForContentSizeCategory = true
            
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        
        let appointmentForWhoLabelTitle :  UILabel = {
            let label = UILabel()
            label.text = "Patient Information"
            label.lineBreakMode = .byWordWrapping
            label.textColor = .black
            label.adjustsFontSizeToFitWidth = true
            label.font = UIFont.systemFont(ofSize: 20, weight: .light)
            
            let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
            label.font = fontMetrics.scaledFont(for: label.font)
            label.adjustsFontForContentSizeCategory = true
            
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
       
        
        
        let detailsStackView : UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        let appoiuntmentTimingTitle :  UILabel = {
            let label = UILabel()
            label.text = "Scheduled Appointment"
            label.lineBreakMode = .byWordWrapping
            label.textColor = .black
            label.adjustsFontSizeToFitWidth = true
            label.font = UIFont.systemFont(ofSize: 20, weight: .light)
            
            let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
            label.font = fontMetrics.scaledFont(for: label.font)
            label.adjustsFontForContentSizeCategory = true
            
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let appointmentTimeLabel :  UILabel = {
            let label = UILabel()
            label.text = "Time"
            label.lineBreakMode = .byWordWrapping
            label.textColor = .black
            label.adjustsFontSizeToFitWidth = true
            label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
            
            let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
            label.font = fontMetrics.scaledFont(for: label.font)
            label.adjustsFontForContentSizeCategory = true
            
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let appointmentTimeRemainingLabel :  UILabel = {
            let label = UILabel()
            label.text = "remain Time"
            label.lineBreakMode = .byWordWrapping
            label.textColor = .black
            label.adjustsFontSizeToFitWidth = true
            label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
            
            let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
            label.font = fontMetrics.scaledFont(for: label.font)
            label.adjustsFontForContentSizeCategory = true
            
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
    
    
    let appointmentTypeTitle :  UILabel = {
        let label = UILabel()
        label.text = "Appointment Type "
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let appointmentTypeLabel :  UILabel = {
        let label = UILabel()
        label.text = "Physical"
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
        
        let billdetailsTitle :  UILabel = {
            let label = UILabel()
            label.text = "Bill details"
            label.lineBreakMode = .byWordWrapping
            label.textColor = .black
            label.adjustsFontSizeToFitWidth = true
            label.font = UIFont.systemFont(ofSize: 20, weight: .light)
            
            let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
            label.font = fontMetrics.scaledFont(for: label.font)
            label.adjustsFontForContentSizeCategory = true
            
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let consultationFee :  UILabel = {
            let label = UILabel()
            label.text = "Total Cost"
            label.lineBreakMode = .byWordWrapping
            label.textColor = .black
            label.adjustsFontSizeToFitWidth = true
            label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
            
            let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
            label.font = fontMetrics.scaledFont(for: label.font)
            label.adjustsFontForContentSizeCategory = true
            
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let fee :  UILabel = {
            let label = UILabel()
            label.text = "Rs. 300"
            label.lineBreakMode = .byWordWrapping
            label.textColor = .black
            label.adjustsFontSizeToFitWidth = true
            label.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
            
            let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
            label.font = fontMetrics.scaledFont(for: label.font)
            label.adjustsFontForContentSizeCategory = true
            
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let cancelButton : UIButton = {
            let button = UIButton()
            button.configuration = .filled()
            button.configuration?.baseBackgroundColor = .red
            button.configuration?.baseForegroundColor = .white
            button.setTitle("Cancel Appointment", for: .normal)
            
            let buttonFont: UIFont = .systemFont(ofSize: 25, weight: .semibold)
            let fontMetrics = UIFontMetrics(forTextStyle: .headline)
            button.titleLabel?.font = fontMetrics.scaledFont(for: buttonFont)
            button.titleLabel?.adjustsFontForContentSizeCategory = true
            button.titleLabel?.numberOfLines = 1
            button.titleLabel?.lineBreakMode = .byWordWrapping
            
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
      
        
        var heightSpacing : CGFloat {
            Viewheight * 0.02
        }
        
        var widthSpacing : CGFloat {
            viewWidth * 0.03
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            navigationController?.navigationBar.isHidden = false
            
            setViews()
            setBackground()
           
        }
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
        
        
    
    
    func setBackground(){
        view.backgroundColor = UIColor(named: "background")
        let backgroundImage = UIImage(named: "backimage")
        let backgroundImageView = UIImageView(image: backgroundImage)
       
        backgroundImageView.contentMode = .scaleAspectFit
        self.view.addSubview(backgroundImageView)
        self.view.sendSubviewToBack(backgroundImageView)
        
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: viewWidth * 0.4),
            backgroundImageView.widthAnchor.constraint(equalToConstant: viewWidth * 0.4)
        ])
        
        backgroundImageView.layer.cornerRadius = 10
        backgroundImageView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        backgroundImageView.layer.shadowOpacity = 0.8
        backgroundImageView.layer.shadowOffset = CGSize(width: 4, height: 4)
        backgroundImageView.layer.shadowRadius = 5
        
        nameLabel.text = "Dr.\(doctor.name)"
        departmentLabel.text = doctor.department.departmentName
        appointmentTimeLabel.text = "Start Time : \(starTime)"
        profileImageView.image = UIImage(named: doctor.image)
        calculateRemainingTime()
    }
    
    
    func calculateRemainingTime(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy h:mm-a"
        let date = dateFormatter.date(from: "\(date) \(starTime)")

        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute], from: Date(), to: date!)

        let day = String(format: "%02d", components.day ?? "00")
        let hour = String(format: "%02d", components.hour ?? "00")
        let minutes = String(format: "%02d", components.minute ?? "00")
        
       let d =  day == "00" ?  "" : "\(day)d"
       let h =  hour == "00" ? "" : "\(hour)h"
       let m =  minutes == "00" ? "" : "\(minutes)m"
        print("day :",d,"hour :",h,"Minutes :",m)
        
       
        appointmentTimeRemainingLabel.text = "Starts In : \(d) \(h) \(m)"

    }
    
        func setViews(){
            
            view.addSubview(scrollView)
            
            scrollView.addSubview(stackView)
            
            stackView.addArrangedSubview(doctorInformationView)
            stackView.addArrangedSubview(patientDetailsView)
            stackView.addArrangedSubview(appointmentTimingsView)
            stackView.addArrangedSubview(appointmentTypeView)
            stackView.addArrangedSubview(billDetailsView)
            stackView.addArrangedSubview(cancelView)
            
            scrollView.showsVerticalScrollIndicator = false
            
            doctorInformationView.addSubview(profileImageView)
            doctorInformationView.addSubview(nameLabel)
            doctorInformationView.addSubview(departmentLabel)

            patientDetailsView.addSubview(appointmentForWhoLabelTitle)
            patientDetailsView.addSubview(detailsStackView)

            appointmentTimingsView.addSubview(appoiuntmentTimingTitle)
            appointmentTimingsView.addSubview(appointmentTimeLabel)
            appointmentTimingsView.addSubview(appointmentTimeRemainingLabel)

            appointmentTypeView.addSubview(appointmentTypeTitle)
            appointmentTypeView.addSubview(appointmentTypeLabel)
            
            billDetailsView.addSubview(consultationFee)
            billDetailsView.addSubview(fee)
            
            cancelView.addSubview(cancelButton)
            
            doctorInformationView.backgroundColor = .white.withAlphaComponent(0.6)
            patientDetailsView.backgroundColor = .white.withAlphaComponent(0.6)
            appointmentTimingsView.backgroundColor = .white.withAlphaComponent(0.6)
            billDetailsView.backgroundColor = .white.withAlphaComponent(0.6)
            appointmentTypeView.backgroundColor = .white.withAlphaComponent(0.6)
            
            
           doctorInformationView.layer.cornerRadius = 5
           doctorInformationView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
           doctorInformationView.layer.shadowOpacity = 0.8
           doctorInformationView.layer.shadowOffset = CGSize(width: 4, height: 4)
           doctorInformationView.layer.shadowRadius = 5
            
            patientDetailsView.layer.cornerRadius = 5
            patientDetailsView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
            patientDetailsView.layer.shadowOpacity = 0.8
            patientDetailsView.layer.shadowOffset = CGSize(width: 4, height: 4)
            patientDetailsView.layer.shadowRadius = 5
            
            appointmentTimingsView.layer.cornerRadius = 5
            appointmentTimingsView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
            appointmentTimingsView.layer.shadowOpacity = 0.8
            appointmentTimingsView.layer.shadowOffset = CGSize(width: 4, height: 4)
            appointmentTimingsView.layer.shadowRadius = 5
            
            billDetailsView.layer.cornerRadius = 5
            billDetailsView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
            billDetailsView.layer.shadowOpacity = 0.8
            billDetailsView.layer.shadowOffset = CGSize(width: 4, height: 4)
            billDetailsView.layer.shadowRadius = 5
            
            appointmentTypeView.layer.cornerRadius = 5
            appointmentTypeView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
            appointmentTypeView.layer.shadowOpacity = 0.8
            appointmentTypeView.layer.shadowOffset = CGSize(width: 4, height: 4)
            appointmentTypeView.layer.shadowRadius = 5
            
            cancelView.layer.cornerRadius = 5
            cancelView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
            cancelView.layer.shadowOpacity = 0.8
            cancelView.layer.shadowOffset = CGSize(width: 4, height: 4)
            cancelView.layer.shadowRadius = 5
            cancelView.backgroundColor = .white.withAlphaComponent(0.7)
            
            setConstrains()
            
        }

        
        
        func setConstrains(){
            
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
           
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            ])
            setStack()
            
        }
    
    
    func setStack(){
        
        stackView.spacing = heightSpacing
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor ,constant: 20),
          //  stackView.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
           // stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        doctorInformationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            doctorInformationView.heightAnchor.constraint(equalToConstant: Viewheight * 0.3),
        ])
        
        patientDetailsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            patientDetailsView.bottomAnchor.constraint(equalTo: detailsStackView.bottomAnchor,constant: 10),
            ])
        
        
         appointmentTypeView.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
             appointmentTypeView.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),
             ])
        
        appointmentTimingsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appointmentTimingsView.bottomAnchor.constraint(equalTo: appointmentTimeRemainingLabel.bottomAnchor,constant: 10)
            ])
        
        billDetailsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            billDetailsView.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),
            ])
        
        cancelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelView.heightAnchor.constraint(equalToConstant: Viewheight * 0.1)
        ])
        
        setDoctorInformationView()
    }
        
        func setDoctorInformationView(){
           
            profileImageView.backgroundColor = .black
            NSLayoutConstraint.activate([
                profileImageView.topAnchor.constraint(equalTo: doctorInformationView.topAnchor),
                profileImageView.widthAnchor.constraint(equalToConstant: Viewheight * 0.2),
                profileImageView.heightAnchor.constraint(equalToConstant: Viewheight * 0.2),
                profileImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
            ])
            
            profileImageView.layer.cornerRadius = (Viewheight * 0.2) / 2
            
            NSLayoutConstraint.activate([
                nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor),
                nameLabel.leadingAnchor.constraint(equalTo: doctorInformationView.leadingAnchor),
                nameLabel.trailingAnchor.constraint(equalTo: doctorInformationView.trailingAnchor),
                nameLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.05)
            ])
            
            NSLayoutConstraint.activate([
                departmentLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
                departmentLabel.leadingAnchor.constraint(equalTo: doctorInformationView.leadingAnchor),
                departmentLabel.trailingAnchor.constraint(equalTo: doctorInformationView.trailingAnchor),
                departmentLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.04)
            ])
            
            setAppointmentTimingView()
        }
        
        
        func setPatientDetailsView(){
            
            NSLayoutConstraint.activate([
                appointmentForWhoLabelTitle.topAnchor.constraint(equalTo: patientDetailsView.topAnchor),
                appointmentForWhoLabelTitle.leadingAnchor.constraint(equalTo: patientDetailsView.leadingAnchor,constant: 10),
                appointmentForWhoLabelTitle.trailingAnchor.constraint(equalTo: patientDetailsView.trailingAnchor,constant: -10),
                appointmentForWhoLabelTitle.heightAnchor.constraint(equalToConstant: Viewheight * 0.04)
            ])
        
            
            NSLayoutConstraint.activate([
                detailsStackView.topAnchor.constraint(equalTo: appointmentForWhoLabelTitle.bottomAnchor,constant: heightSpacing/2),
                detailsStackView.leadingAnchor.constraint(equalTo: patientDetailsView.leadingAnchor,constant: 10),
                detailsStackView.trailingAnchor.constraint(equalTo: patientDetailsView.trailingAnchor,constant: -10),
            ])
            
            let details : [String] = ["Name  :\(self.appointment?.patientName ?? "None")","gender : Male ","Age : 27","Phone Number : \( appointment?.patientMobileNumber ?? "None")","Mail : uyweyufuy@gmail.com","Reason : i haven't feeling well lately i haven't feeling well lately i haven't feeling well lately i haven't feeling well lately i haven't feeling well lately i haven't feeling well lately"]
            
            for i in 0..<details.count {
                
                let label = UILabel()
                label.text = "\(details[i])"
                
                label.translatesAutoresizingMaskIntoConstraints = false
                
                label.font = UIFont.systemFont(ofSize: 18, weight: .ultraLight)
               
                
                if i == 5 {
                    label.numberOfLines = 4
                    
                    NSLayoutConstraint.activate([
                        label.heightAnchor.constraint(equalToConstant: Viewheight * 0.07)
                    ])
                }
                else {
                    NSLayoutConstraint.activate([
                        label.heightAnchor.constraint(equalToConstant: Viewheight * 0.03)
                    ])
                }
                detailsStackView.addArrangedSubview(label)
            }
            
            
           
            setAppointmentTypeView()
        }
    
    func setAppointmentTypeView(){
        NSLayoutConstraint.activate([
            appointmentTypeTitle.topAnchor.constraint(equalTo: appointmentTypeView.topAnchor,constant: heightSpacing/2),
            appointmentTypeTitle.leadingAnchor.constraint(equalTo: appointmentTypeView.leadingAnchor,constant: 10),
            appointmentTypeTitle.heightAnchor.constraint(equalToConstant: Viewheight * 0.03),
            appointmentTypeTitle.widthAnchor.constraint(equalToConstant: Viewheight * 0.4)
        ])
        
        NSLayoutConstraint.activate([
            appointmentTypeLabel.topAnchor.constraint(equalTo: appointmentTypeView.topAnchor,constant: heightSpacing/2),
            appointmentTypeLabel.trailingAnchor.constraint(equalTo: appointmentTypeView.trailingAnchor,constant: -10),
            appointmentTypeLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.03),
            appointmentTypeLabel.widthAnchor.constraint(equalToConstant: viewWidth * 0.4)
        ])

       
        setBillDetailsView()
    }
        
        func setAppointmentTimingView(){
            
            NSLayoutConstraint.activate([
                appoiuntmentTimingTitle.topAnchor.constraint(equalTo: appointmentTimingsView.topAnchor),
                appoiuntmentTimingTitle.leadingAnchor.constraint(equalTo: appointmentTimingsView.leadingAnchor,constant: 10),
                appoiuntmentTimingTitle.trailingAnchor.constraint(equalTo: appointmentTimingsView.trailingAnchor,constant: -10),
                appoiuntmentTimingTitle.heightAnchor.constraint(equalToConstant: Viewheight * 0.04)
            ])

            NSLayoutConstraint.activate([
                appointmentTimeLabel.topAnchor.constraint(equalTo: appoiuntmentTimingTitle.bottomAnchor,constant: heightSpacing/2),
                appointmentTimeLabel.leadingAnchor.constraint(equalTo: appointmentTimingsView.leadingAnchor,constant: 10),
                appointmentTimeLabel.trailingAnchor.constraint(equalTo: appointmentTimingsView.trailingAnchor,constant: -10),
                appointmentTimeLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.03)
            ])

            NSLayoutConstraint.activate([
                appointmentTimeRemainingLabel.topAnchor.constraint(equalTo: appointmentTimeLabel.bottomAnchor),
                appointmentTimeRemainingLabel.leadingAnchor.constraint(equalTo: appointmentTimingsView.leadingAnchor,constant: 10),
                appointmentTimeRemainingLabel.trailingAnchor.constraint(equalTo: appointmentTimingsView.trailingAnchor,constant: -10),
                appointmentTimeRemainingLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.03)
            ])
            
            setPatientDetailsView()
        }
        
        func setBillDetailsView(){
        
     
            NSLayoutConstraint.activate([
                consultationFee.topAnchor.constraint(equalTo: billDetailsView.topAnchor,constant: heightSpacing/2),
                consultationFee.leadingAnchor.constraint(equalTo: billDetailsView.leadingAnchor,constant: 10),
                consultationFee.heightAnchor.constraint(equalToConstant: Viewheight * 0.03)
            ])
            
            NSLayoutConstraint.activate([
                fee.topAnchor.constraint(equalTo: billDetailsView.topAnchor,constant: heightSpacing/2),
                fee.trailingAnchor.constraint(equalTo: billDetailsView.trailingAnchor,constant: -10),
                fee.heightAnchor.constraint(equalToConstant: Viewheight * 0.03)
            ])

            scrollView.isUserInteractionEnabled = true
            
          setCancellationView()
        }
    
    func setCancellationView(){
        
        NSLayoutConstraint.activate([
            cancelButton.centerYAnchor.constraint(equalTo: cancelView.centerYAnchor),
            cancelButton.centerXAnchor.constraint(equalTo: cancelView.centerXAnchor)
        ])
        
        cancelButton.addTarget(self, action: #selector(cancelAppointment), for: .touchUpInside)
    }
    
    @objc func cancelAppointment(){
        
        let alertController = UIAlertController(title: "Cancel Appointment", message: "Are you sure to cancel your Appointment ?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .destructive) {
            _ in
          let _ =   self.patient.cancelAppointment(appointment: self.appointment!)
            self.navigationController?.popToRootViewController(animated: true)
            
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let reSchedule = UIAlertAction(title: "Re-Schedule", style: .default)
        alertController.addAction(okAction)
        alertController.addAction(reSchedule)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
        
        
    }




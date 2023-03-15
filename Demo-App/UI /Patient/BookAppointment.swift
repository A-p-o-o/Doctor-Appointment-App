//
//  BookAppointment.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 14/03/23.
//

import UIKit

class BookAppointment: UIViewController {
    
    let doctor : Doctor
    let patient : Patient
    let starTime : String
    let endTime : String
    let date : String
    let doctorProfile : DoctorProfile
    let slotNo : Int
    
    let appointmentView = UIView()
    let imageView : UIImageView = {
        let imageView = UIImageView()
         imageView.image = UIImage(systemName: "clock")?.withRenderingMode(.alwaysTemplate)
         imageView.contentMode = .scaleAspectFit
         imageView.tintColor = UIColor(named: "black")
         //imageView.backgroundColor = UIColor(named: "black")
         imageView.clipsToBounds = true
        
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()
    
    let appointmentTimeLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.text = "Appointment Details"
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
       // label.backgroundColor = .red
        return label
    }()
    
    let startTimeLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
       // label.backgroundColor = .red
        return label
    }()
    
    let EndTimeLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
       // label.backgroundColor = .red
        return label
    }()
    
    let dateLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 1
        label.text = "date"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
       // label.backgroundColor = .red
        return label
    }()
    
    let timeRemainingLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let confirmButton : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.setTitle("Confirm", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.configuration?.baseBackgroundColor = .green
        button.configuration?.baseForegroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfile()
        title = "BOOK APPOINTMENT"
        view.backgroundColor = .purple
        setViews()
        setButton()
        dateLabel.text      = "Date of Appointment : \(date)"
        startTimeLabel.text = "Start Time          : \(starTime)"
        EndTimeLabel.text   = "End Time            : \(endTime)"
        calculateRemainingTime()
    }
    
    init(doctor: Doctor,patient: Patient,startTime : String,endTime : String,date: String,slotNo:Int) {
        self.doctor = doctor
        self.patient = patient
        self.doctorProfile = DoctorProfile(doctor: doctor)
        self.starTime = startTime
        self.endTime = endTime
        self.date = date
        self.slotNo = slotNo
        super.init(nibName: nil, bundle: nil)
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setProfile(){
        
        view.addSubview(doctorProfile)
        doctorProfile.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            doctorProfile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            doctorProfile.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            doctorProfile.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            doctorProfile.heightAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.height * 0.15)
            
        ])
        
        doctorProfile.backgroundColor = .white
    }
    
    func setViews(){
        
        view.addSubview(appointmentView)
        appointmentView.backgroundColor = .white
        appointmentView.translatesAutoresizingMaskIntoConstraints = false
        
       

        NSLayoutConstraint.activate([
            appointmentView.topAnchor.constraint(equalTo: doctorProfile.bottomAnchor, constant: 10),
            appointmentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            appointmentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            appointmentView.heightAnchor.constraint(equalToConstant: view.frame.height*0.25)
        ])
        
        let appointmentViewHeight = view.frame.height*0.25
        let appointmentViewWidth  = view.frame.width
         
        appointmentView.addSubview(imageView)
        appointmentView.addSubview(appointmentTimeLabel)
        appointmentView.addSubview(dateLabel)
        appointmentView.addSubview(startTimeLabel)
        appointmentView.addSubview(EndTimeLabel)
        appointmentView.addSubview(timeRemainingLabel)
        
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: appointmentView.topAnchor, constant: appointmentViewHeight*0.04),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: appointmentViewWidth*0.02),
            imageView.widthAnchor.constraint(equalToConstant: appointmentViewHeight*0.184),
            imageView.heightAnchor.constraint(equalToConstant: appointmentViewHeight*0.184)
        ])
        
        imageView.layer.cornerRadius = appointmentViewHeight*0.184 / 2
        
        NSLayoutConstraint.activate([
            appointmentTimeLabel.topAnchor.constraint(equalTo: appointmentView.topAnchor, constant: appointmentViewHeight*0.04),
            appointmentTimeLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor,constant: appointmentViewWidth*0.02),
            appointmentTimeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -appointmentViewWidth*0.02),
            appointmentTimeLabel.heightAnchor.constraint(equalToConstant: appointmentViewHeight*0.184)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: appointmentViewWidth*0.02),
            dateLabel.widthAnchor.constraint(equalToConstant: appointmentViewWidth*0.96),
            dateLabel.heightAnchor.constraint(equalToConstant: appointmentViewHeight*0.184)
        ])
        
        NSLayoutConstraint.activate([
            startTimeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            startTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: appointmentViewWidth*0.02),
            startTimeLabel.widthAnchor.constraint(equalToConstant: appointmentViewWidth*0.96),
            startTimeLabel.heightAnchor.constraint(equalToConstant: appointmentViewHeight*0.184)
        ])
        
        NSLayoutConstraint.activate([
            EndTimeLabel.topAnchor.constraint(equalTo: startTimeLabel.bottomAnchor),
            EndTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: appointmentViewWidth*0.02),
            EndTimeLabel.widthAnchor.constraint(equalToConstant: appointmentViewWidth*0.96),
            EndTimeLabel.heightAnchor.constraint(equalToConstant: appointmentViewHeight*0.184)
            
        ])
        
        NSLayoutConstraint.activate([
            timeRemainingLabel.topAnchor.constraint(equalTo: EndTimeLabel.bottomAnchor),
            timeRemainingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: appointmentViewWidth*0.02),
            timeRemainingLabel.widthAnchor.constraint(equalToConstant: appointmentViewWidth*0.96),
            timeRemainingLabel.heightAnchor.constraint(equalToConstant: appointmentViewHeight*0.184)
           // timeRemainingLabel.bottomAnchor.constraint(equalTo: appointmentView.bottomAnchor, constant: -appointmentViewHeight*0.04)
        ])
        
        

   }
    
    func setButton(){
        view.addSubview(confirmButton)
        
        let buttonHeight = view.frame.height * 0.05
        let buttonwidth  = view.frame.width * 0.3
        
        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: appointmentView.bottomAnchor,constant: 100),
            confirmButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            confirmButton.widthAnchor.constraint(equalToConstant: buttonwidth),
            confirmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -view.frame.width*0.05)
        ])
        
        confirmButton.addTarget(self, action: #selector(confirm), for: .touchUpInside)
    }
    
    func calculateRemainingTime(){
        // Create a date formatter to convert the string date to a Date object
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy h:mm-a"
        let date = dateFormatter.date(from: "\(date) \(starTime)")

        // Calculate the time difference between the current date and the given date
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute], from: Date(), to: date!)

        // Display the remaining time in a label
        let remainingTime = String(format: "%02dd %02dh %02dm ", components.day ?? "", components.hour ?? "", components.minute ?? "")
        timeRemainingLabel.text = "Starts In              : \(remainingTime)"

    }
    
    @objc func confirm(){
        
        let _ = patient.createAppointment(doctor: doctor, date: formatDate(date: date), slot: .slot(number: 2, time: .time(start: starTime, end: endTime)))
        
        print(starTime,endTime)
        navigationController!.popToViewController(navigationController!.viewControllers[0], animated: true)
        
        
        
            }
        

        
    
    
    

}

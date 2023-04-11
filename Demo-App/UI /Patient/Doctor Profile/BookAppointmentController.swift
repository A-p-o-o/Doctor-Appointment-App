//
//  AppointmentController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 26/03/23.
//

import UIKit

class BookAppointmentController: UIViewController {
    
    let genders : [String] = ["Male","Female","Non Binary"]
    
    let doctor : Doctor
    let patient : Patient
    let starTime : String
    let endTime : String
    let date : String
    let slotNo : Int
    let appointment : Appointment?
    let type : AppointmentType
    
    let options : [String] = ["Myself","Father","Mother","Brother","Sister","Others"]
    let details : [String] = ["Name","Phone Number" , "E-mail", "Age" ,"Gender"]
    var patientDetails : [String:String] = [:]
    
    var name : String? = nil
    var mobileNumber : String? = nil
    var mail : String? = nil
    var age : Int? = nil
    var gender : Sex? = nil
    var reason : String? = nil
    
    init(doctor: Doctor,userId : String,startTime : String,endTime : String,date: String,slotNo:Int,type : AppointmentType) {
        self.doctor = doctor
        self.starTime = startTime
        self.endTime = endTime
        self.date = date
        self.slotNo = slotNo
        self.appointment = nil
        self.type = type
        
        
        let user = UserDAO()
        self.patient = (user.getUser(userId: userId) as! Patient)
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
        self.type = appointment.type
        super.init(nibName: nil, bundle: nil)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let scrollView = UIScrollView()
    
    let doctorInformationView = UIView()
    let patientDetailsView = UIView()
    let reasonView = UIView()
    let appointmentTimingsView = UIView()
    let billDetailsView = UIView()
    let bookingView = UIView()
    let spaceView = UIView()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image6")
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .black
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
        label.text = "AppointMent For"
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
    
    let appointmentForWhoLabel : UIButton = {
        let button = UIButton()
        button.configuration = .borderedProminent()
        button.configuration?.baseBackgroundColor = .clear
        button.configuration?.baseForegroundColor = .black
        button.setTitle("Myself", for: .normal)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        
        let buttonFont: UIFont = .systemFont(ofSize: 25, weight: .semibold)
        let fontMetrics = UIFontMetrics(forTextStyle: .headline)
        button.titleLabel?.font = fontMetrics.scaledFont(for: buttonFont)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.lineBreakMode = .byWordWrapping
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let listOfPeopleTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let detailsStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let reasonForAppointmentTitle :  UILabel = {
       let label = UILabel()
       label.text = "Reason"
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
    
    let reasonForAppointment : UITextView = {
        let textView = UITextView()
        textView.layer.cornerRadius = 10
//        textView.layer.borderWidth = 1
//        textView.layer.borderColor = UIColor.black.cgColor
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor =  UIColor(named: "field_inactive")
        return textView
    }()
    
    let appoiuntmentTimingTitle :  UILabel = {
        let label = UILabel()
        label.text = "Appointment Timing"
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
        label.text = "consultation fee"
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
    
    let confirmButton : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = UIColor(named: "book")
        button.configuration?.baseForegroundColor = UIColor(named: "white")
        button.setTitle("Confirm", for: .normal)
        
        let buttonFont: UIFont = .systemFont(ofSize: 25, weight: .semibold)
        let fontMetrics = UIFontMetrics(forTextStyle: .headline)
        button.titleLabel?.font = fontMetrics.scaledFont(for: buttonFont)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.lineBreakMode = .byWordWrapping
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let billLabel :  UILabel = {
        let label = UILabel()
        label.text = "Amount to Pay"
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
    
    let amountLabel : UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .ultraLight)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
  let genderPickerView = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false 
        
        profileImageView.image = UIImage(named: doctor.image)
        fee.text = "Rs. \(doctor.appointmentFee)"
        departmentLabel.text = doctor.department.departmentName
        nameLabel.text = "Dr.\(doctor.name)"
        appointmentTimeLabel.text = "Start : \(starTime) - End : \(endTime)"
        amountLabel.text = "Rs. \(doctor.appointmentFee)"
        setBackground()
        setViews()
        calculateRemainingTime()
       
        
        addTargets()
    }
    
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
    
    var heightSpacing : CGFloat {  Viewheight * 0.02 }
    var widthSpacing : CGFloat { viewWidth * 0.03 }
        
        
       
    
    func setBackground(){
        view.backgroundColor = UIColor(named: "background")
        
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
        view.addSubview(bookingView)
        
        scrollView.addSubview(doctorInformationView)
        scrollView.addSubview(patientDetailsView)
        scrollView.addSubview(reasonView)
        scrollView.addSubview(appointmentTimingsView)
        scrollView.addSubview(billDetailsView)
        scrollView.addSubview(listOfPeopleTableView)
        scrollView.addSubview(spaceView)
        scrollView.backgroundColor = .clear
        
        scrollView.showsVerticalScrollIndicator = false
        
        doctorInformationView.addSubview(profileImageView)
        doctorInformationView.addSubview(nameLabel)
        doctorInformationView.addSubview(departmentLabel)
        
        doctorInformationView.backgroundColor = UIColor(named: "white")
        patientDetailsView.backgroundColor = UIColor(named: "white")
        appointmentTimingsView.backgroundColor = UIColor(named: "white")
        billDetailsView.backgroundColor = UIColor(named: "white")
        reasonView.backgroundColor = UIColor(named: "white")
        
       doctorInformationView.layer.cornerRadius = 10
       doctorInformationView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
       doctorInformationView.layer.shadowOpacity = 0.8
       doctorInformationView.layer.shadowOffset = CGSize(width: 4, height: 4)
       doctorInformationView.layer.shadowRadius = 5
        
        patientDetailsView.layer.cornerRadius = 10
        patientDetailsView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        patientDetailsView.layer.shadowOpacity = 0.8
        patientDetailsView.layer.shadowOffset = CGSize(width: 4, height: 4)
        patientDetailsView.layer.shadowRadius = 5
        
        
        reasonView.layer.cornerRadius = 10
        reasonView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        reasonView.layer.shadowOpacity = 0.8
        reasonView.layer.shadowOffset = CGSize(width: 4, height: 4)
        reasonView.layer.shadowRadius = 5
        
        
        appointmentTimingsView.layer.cornerRadius = 10
        appointmentTimingsView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        appointmentTimingsView.layer.shadowOpacity = 0.8
        appointmentTimingsView.layer.shadowOffset = CGSize(width: 4, height: 4)
        appointmentTimingsView.layer.shadowRadius = 5
        
        billDetailsView.layer.cornerRadius = 10
        billDetailsView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        billDetailsView.layer.shadowOpacity = 0.8
        billDetailsView.layer.shadowOffset = CGSize(width: 4, height: 4)
        billDetailsView.layer.shadowRadius = 5

        patientDetailsView.addSubview(appointmentForWhoLabelTitle)
        patientDetailsView.addSubview(appointmentForWhoLabel)
        patientDetailsView.addSubview(detailsStackView)
        
        reasonView.addSubview(reasonForAppointmentTitle)
        reasonView.addSubview(reasonForAppointment)

        appointmentTimingsView.addSubview(appoiuntmentTimingTitle)
        appointmentTimingsView.addSubview(appointmentTimeLabel)
        appointmentTimingsView.addSubview(appointmentTimeRemainingLabel)

        billDetailsView.addSubview(billdetailsTitle)
        billDetailsView.addSubview(consultationFee)
        billDetailsView.addSubview(fee)

        bookingView.addSubview(confirmButton)
        bookingView.addSubview(billLabel)
        bookingView.addSubview(amountLabel)

        setConstrains()
    }
    
    func addTargets(){
        let tapgesture1 = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        let tapgesture2 = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        let tapgesture3 = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        let tapgesture4 = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        let tapgesture5 = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        
        doctorInformationView.isUserInteractionEnabled = true
        patientDetailsView.isUserInteractionEnabled = true
        bookingView.isUserInteractionEnabled = true
        reasonView.isUserInteractionEnabled = true
        appointmentTimingsView.isUserInteractionEnabled = true
        
        doctorInformationView.addGestureRecognizer(tapgesture1)
        patientDetailsView.addGestureRecognizer(tapgesture2)
        bookingView.addGestureRecognizer(tapgesture3)
        appointmentTimingsView.addGestureRecognizer(tapgesture5)
        reasonView.addGestureRecognizer(tapgesture4)
    }
    
    
    
    
    func setConstrains(){
        
        scrollView.bounces = false
       
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
        ])
        
        setDoctorInformationView()
    }
    
    func setDoctorInformationView(){
        
        doctorInformationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            doctorInformationView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            doctorInformationView.heightAnchor.constraint(equalToConstant: Viewheight * 0.3),
            doctorInformationView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            doctorInformationView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            doctorInformationView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: doctorInformationView.topAnchor,constant: 10),
            profileImageView.widthAnchor.constraint(equalToConstant: Viewheight * 0.2),
            profileImageView.heightAnchor.constraint(equalToConstant: Viewheight * 0.2),
            profileImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        profileImageView.layer.borderColor = UIColor(named: "radius")?.cgColor
        profileImageView.layer.borderWidth = 2
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
        
        setPatientDetailsView()
        
    }
    
    
    func setPatientDetailsView(){
        
        NSLayoutConstraint.activate([
            appointmentForWhoLabelTitle.topAnchor.constraint(equalTo: patientDetailsView.topAnchor),
            appointmentForWhoLabelTitle.leadingAnchor.constraint(equalTo: patientDetailsView.leadingAnchor,constant: 10),
            appointmentForWhoLabelTitle.trailingAnchor.constraint(equalTo: patientDetailsView.trailingAnchor,constant: -10),
            appointmentForWhoLabelTitle.heightAnchor.constraint(equalToConstant: Viewheight * 0.04)
        ])
        
        NSLayoutConstraint.activate([
            appointmentForWhoLabel.topAnchor.constraint(equalTo: appointmentForWhoLabelTitle.bottomAnchor,constant: heightSpacing/2),
            appointmentForWhoLabel.leadingAnchor.constraint(equalTo: patientDetailsView.leadingAnchor,constant: 10),
            appointmentForWhoLabel.widthAnchor.constraint(equalToConstant: viewWidth * 0.4),
            appointmentForWhoLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.03)
        ])
        
       
        

        
        
        listOfPeopleTableView.isHidden = true
        NSLayoutConstraint.activate([
            listOfPeopleTableView.topAnchor.constraint(equalTo: appointmentForWhoLabel.bottomAnchor,constant: 10),
            listOfPeopleTableView.leadingAnchor.constraint(equalTo: patientDetailsView.leadingAnchor,constant: 10),
            listOfPeopleTableView.trailingAnchor.constraint(equalTo: patientDetailsView.trailingAnchor,constant: view.frame.width * 0.5),
            listOfPeopleTableView.heightAnchor.constraint(equalToConstant: Viewheight * 0.3)
        ])
        
        
        detailsStackView.spacing = heightSpacing
        NSLayoutConstraint.activate([
            detailsStackView.topAnchor.constraint(equalTo: appointmentForWhoLabel.bottomAnchor,constant: heightSpacing),
            detailsStackView.leadingAnchor.constraint(equalTo: patientDetailsView.leadingAnchor,constant: 10),
            detailsStackView.trailingAnchor.constraint(equalTo: patientDetailsView.trailingAnchor,constant: -10),
        ])
        
        
        
        patientDetailsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            patientDetailsView.topAnchor.constraint(equalTo:doctorInformationView.bottomAnchor,constant: heightSpacing),
            patientDetailsView.bottomAnchor.constraint(equalTo: detailsStackView.bottomAnchor),
            patientDetailsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            patientDetailsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            ])
        
        appointmentForWhoLabel.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(myselfClicked))
               appointmentForWhoLabel.addGestureRecognizer(tapGesture)
        
        
        listOfPeopleTableView.delegate = self
        listOfPeopleTableView.dataSource = self
        
        setReasonView()
        
    }
    
    @objc func endEditing(){
        view.endEditing(true)
        listOfPeopleTableView.isHidden = true
        print("End Editing")
    }
    
    @objc func myselfClicked(){
        listOfPeopleTableView.isHidden = false
    }
    
    func setReasonView(){
        NSLayoutConstraint.activate([
            reasonForAppointmentTitle.topAnchor.constraint(equalTo: reasonView.topAnchor),
            reasonForAppointmentTitle.leadingAnchor.constraint(equalTo: reasonView.leadingAnchor,constant: 10),
            reasonForAppointmentTitle.trailingAnchor.constraint(equalTo: reasonView.trailingAnchor,constant: -10),
            reasonForAppointmentTitle.heightAnchor.constraint(equalToConstant: Viewheight * 0.04)
        ])
 
        NSLayoutConstraint.activate([
            reasonForAppointment.topAnchor.constraint(equalTo: reasonForAppointmentTitle.bottomAnchor,constant: heightSpacing/2),
            reasonForAppointment.leadingAnchor.constraint(equalTo: reasonView.leadingAnchor,constant: 10),
            reasonForAppointment.trailingAnchor.constraint(equalTo: reasonView.trailingAnchor,constant: -10),
            reasonForAppointment.heightAnchor.constraint(equalToConstant: Viewheight * 0.1)
        ])
        reasonForAppointment.delegate = self
        
        reasonView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            reasonView.topAnchor.constraint(equalTo: patientDetailsView.bottomAnchor,constant: heightSpacing),
            reasonView.bottomAnchor.constraint(equalTo: reasonForAppointment.bottomAnchor,constant: 10),
           // reasonView.heightAnchor.constraint(equalToConstant: Viewheight * 0.2),
            reasonView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            reasonView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            ])
        setAppointmentTimingView()
    }
    
    func setAppointmentTimingView(){
        
        NSLayoutConstraint.activate([
            appoiuntmentTimingTitle.topAnchor.constraint(equalTo: appointmentTimingsView.topAnchor),
            appoiuntmentTimingTitle.leadingAnchor.constraint(equalTo: appointmentTimingsView.leadingAnchor,constant: 10),
            appoiuntmentTimingTitle.trailingAnchor.constraint(equalTo: appointmentTimingsView.trailingAnchor,constant: -10),
            appoiuntmentTimingTitle.heightAnchor.constraint(equalToConstant: Viewheight * 0.04)
        ])

        NSLayoutConstraint.activate([
            appointmentTimeLabel.topAnchor.constraint(equalTo: appoiuntmentTimingTitle.bottomAnchor,constant: heightSpacing),
            appointmentTimeLabel.leadingAnchor.constraint(equalTo: appointmentTimingsView.leadingAnchor,constant: 10),
            appointmentTimeLabel.trailingAnchor.constraint(equalTo: appointmentTimingsView.trailingAnchor,constant: -10),
            appointmentTimeLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.03)
        ])

        NSLayoutConstraint.activate([
            appointmentTimeRemainingLabel.topAnchor.constraint(equalTo: appointmentTimeLabel.bottomAnchor,constant: 10),
            appointmentTimeRemainingLabel.leadingAnchor.constraint(equalTo: appointmentTimingsView.leadingAnchor,constant: 10),
            appointmentTimeRemainingLabel.trailingAnchor.constraint(equalTo: appointmentTimingsView.trailingAnchor,constant: -10),
            appointmentTimeRemainingLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.03)
        ])
        
        
        
        appointmentTimingsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appointmentTimingsView.topAnchor.constraint(equalTo: reasonView.bottomAnchor,constant: heightSpacing),
            appointmentTimingsView.bottomAnchor.constraint(equalTo: appointmentTimeRemainingLabel.bottomAnchor,constant: 10),
            appointmentTimingsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            appointmentTimingsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            ])
        
        setBillDetailsView()
    }
    
    func setBillDetailsView(){
        
        NSLayoutConstraint.activate([
            billdetailsTitle.topAnchor.constraint(equalTo: billDetailsView.topAnchor),
            billdetailsTitle.leadingAnchor.constraint(equalTo: billDetailsView.leadingAnchor,constant: 10),
            billdetailsTitle.trailingAnchor.constraint(equalTo: billDetailsView.trailingAnchor,constant: -10),
            billdetailsTitle.heightAnchor.constraint(equalToConstant: Viewheight * 0.04)
        ])
 
        NSLayoutConstraint.activate([
            consultationFee.topAnchor.constraint(equalTo: billdetailsTitle.bottomAnchor,constant: heightSpacing/2),
            consultationFee.leadingAnchor.constraint(equalTo: billDetailsView.leadingAnchor,constant: 10),
            consultationFee.heightAnchor.constraint(equalToConstant: Viewheight * 0.03)
        ])
        
        NSLayoutConstraint.activate([
            fee.topAnchor.constraint(equalTo: billdetailsTitle.bottomAnchor,constant: heightSpacing/2),
            fee.trailingAnchor.constraint(equalTo: billDetailsView.trailingAnchor,constant: -10),
            fee.heightAnchor.constraint(equalToConstant: Viewheight * 0.03)
        ])

        scrollView.isUserInteractionEnabled = true
        
        
        billDetailsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            billDetailsView.topAnchor.constraint(equalTo: appointmentTimingsView.bottomAnchor,constant: heightSpacing),
            billDetailsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            billDetailsView.heightAnchor.constraint(equalToConstant: Viewheight * 0.1),
            billDetailsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            billDetailsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            ])
        setBookingView()
    }
    
    func setBookingView(){
        
        bookingView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: bookingView.topAnchor,constant: heightSpacing),
            confirmButton.heightAnchor.constraint(equalToConstant: Viewheight * 0.06),
            confirmButton.widthAnchor.constraint(equalToConstant: viewWidth * 0.4),
            confirmButton.trailingAnchor.constraint(equalTo: bookingView.trailingAnchor,constant: -10),
            ])
        
        NSLayoutConstraint.activate([
            billLabel.topAnchor.constraint(equalTo: bookingView.topAnchor,constant: heightSpacing * 0.7),
            billLabel.heightAnchor.constraint(equalToConstant:
                                                Viewheight * 0.04),
            billLabel.widthAnchor.constraint(equalToConstant: viewWidth * 0.3),
            billLabel.leadingAnchor.constraint(equalTo: bookingView.leadingAnchor,constant: 10),
            ])
        
        NSLayoutConstraint.activate([
            amountLabel.topAnchor.constraint(equalTo: billLabel.bottomAnchor),
            amountLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.04),
            amountLabel.widthAnchor.constraint(equalToConstant: viewWidth * 0.3),
            amountLabel.leadingAnchor.constraint(equalTo: bookingView.leadingAnchor,constant: 10),
            ])
        
        bookingView.backgroundColor = UIColor(named: "white")
        
        NSLayoutConstraint.activate([
            bookingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bookingView.heightAnchor.constraint(equalToConstant: Viewheight * 0.1),
            bookingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bookingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: Viewheight * 0.1, right: 0)
        
        bookingView.layer.cornerRadius = 0
        bookingView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        bookingView.layer.shadowOpacity = 0.8
        bookingView.layer.shadowOffset = CGSize(width: 4, height: 4)
        bookingView.layer.shadowRadius = 5
        
        confirmButton.addTarget(self, action: #selector(confirm), for: .touchUpInside)
        setSpacingView()
    }
    
    
    func setSpacingView(){
       
        spaceView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            spaceView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            spaceView.heightAnchor.constraint(equalToConstant: Viewheight * 0.15),
            spaceView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            spaceView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
    }
    
    func setkeyboard(labelAndField : LabelAndField){
        labelAndField.textField.returnKeyType = .done
        switch labelAndField.tag{
        case 0 : labelAndField.textField.keyboardType = .default
        case 1 : labelAndField.textField.keyboardType = .numberPad
        case 2 : labelAndField.textField.keyboardType = .emailAddress
            labelAndField.textField.autocapitalizationType = .none
        case 3 : labelAndField.textField.keyboardType = .numberPad
        case 4 : labelAndField.setGenderPicker()
        default : labelAndField.textField.keyboardType = .default
        }
    }
    
    func validate()->Bool{
        if !detailsStackView.isHidden{
            
            for views in detailsStackView.arrangedSubviews{
                
                guard let labelAndField = views as? LabelAndField else {  continue }
                
                switch labelAndField.tag{
                case 0 : if  !labelAndField.isValidName(name: &name){
                    scrollToView(view: labelAndField)
                    return false
                }
                case 1 : if  !labelAndField.isValidPhoneNumber(phoneNumber: &mobileNumber){
                    scrollToView(view: labelAndField)
                    return false
                }
                case 2 : if  !labelAndField.isValidEmail(email: &mail){
                    scrollToView(view: labelAndField)
                    return false
                }
                case 3 : if !labelAndField.isValidAge(age: &age){
                    scrollToView(view: labelAndField)
                    return false
                }
                case 4 : if  labelAndField.isTextEmpty(){
                    scrollToView(view: labelAndField)
                    return false
                }else {
                    gender =  Sex.getSex(from: labelAndField.textField.text!)
                }
                default : continue
                }
            }
        }
        if reasonForAppointment.text.isEmpty {
            reasonForAppointment.layer.borderWidth = 2
            reasonForAppointment.layer.borderColor = UIColor.red.cgColor
            scrollToView(view: reasonForAppointment)
            return false
        }
        else {
            reason = reasonForAppointment.text!
        }
        
        return true
    }
    
    @objc func confirm(){
        
        if validate(){
            
            if detailsStackView.arrangedSubviews.count == 0 {
                let _ = patient.createAppointment(patientName: patient.name, patientMobileNumber: patient.phoneNumber, email: patient.mail, age: patient.age!, gender: patient.sex, reason: reasonForAppointment.text, doctor: doctor, date: formatDate(date: date), slot: .slot(number: slotNo, time: .time(start: starTime, end: endTime)),type: type,cost: doctor.appointmentFee)
            }
            else {
                
                let _ = patient.createAppointment(patientName: name!, patientMobileNumber: mobileNumber!, email: mail!, age: age!, gender: gender!, reason: reason!, doctor: doctor, date: formatDate(date: date), slot: .slot(number: slotNo, time: .time(start: starTime, end: endTime)),type: type,cost: doctor.appointmentFee)
            }
            
            
            let viewController = BookingConfirmedController()
            viewController.presentedByController = self
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true)
        }
            }
    
    func scrollToView(view: UIView) {
        scrollView.scrollRectToVisible(view.frame, animated: true)
    }
}

extension BookAppointmentController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "\(options[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        appointmentForWhoLabel.setTitle("\(options[indexPath.row])", for: .normal)
        
        
        for view in detailsStackView.arrangedSubviews {
            view.isHidden = true
            detailsStackView.removeArrangedSubview(view)
           
        }
        tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.row != 0 {
            for index in 1...details.count{
                let labelAndField = LabelAndField()
                labelAndField.label.text = "\(details[index-1])"
                labelAndField.textField.placeholder = ""
                labelAndField.translatesAutoresizingMaskIntoConstraints = false
                labelAndField.textField.backgroundColor =  UIColor(named: "field_inactive")
                
                NSLayoutConstraint.activate([
                    labelAndField.heightAnchor.constraint(greaterThanOrEqualToConstant:  Viewheight * 0.08),
                    labelAndField.textField.bottomAnchor.constraint(equalTo: labelAndField.bottomAnchor, constant: -10)
                ])
                
                labelAndField.tag = index - 1
                detailsStackView.addArrangedSubview(labelAndField)
                setkeyboard(labelAndField: labelAndField)
                labelAndField.sizeToFit()
            }
        }
        
        listOfPeopleTableView.isHidden = true
        
        switch indexPath.row {
        case 1,3 : let view =  detailsStackView.arrangedSubviews[4] as! LabelAndField
            view.textField.text = Sex.Male.name
        case 2,4 : let view =  detailsStackView.arrangedSubviews[4] as! LabelAndField
            view.textField.text = Sex.Female.name
        default:
            return
        }
        
        
        
        
    }
    
 
}



extension BookAppointmentController : UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        textView.layer.borderColor = UIColor(named: "book")?.cgColor
        textView.backgroundColor = .lightGray
        
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor(named: "field_inactive")
        textView.layer.borderWidth = 0
    }
}



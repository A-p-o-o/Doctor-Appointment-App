//
//  UpcomingAppointmentdetailsController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 05/04/23.
//


import UIKit

class AppointmentdetailsController: UIViewController {
    
    
    private let appointmentTimingTitles : [String] = ["scheduled Appointment","Appointment ID","Date","Time","Type"]
    lazy var appointmentAnswers : [String] = ["","\(appointment.appointmentId!)",
                                              ": \(date)",
                                         ": \(appointment.getTime().start) - \(appointment.getTime().end)",
                                              ": \(appointment.type.stringName)"]
    private let patientDetailsTitle : [String] = ["PatientDetails","Name ", "Mail ", "Mobile Number ", "Age ", "Gender ", "Reason "]
    lazy var patientsAnswers : [String] = ["",": \(appointment.patientName)", ": \(appointment.email)", ": \(appointment.patientMobileNumber)", ": \(appointment.age)",      ": \(appointment.gender.name)", ": \(appointment.reason)"]
    
    
    
    private let billdetails : [String] = ["Bill Details","Total Cost"]
    lazy var billAnswers : [String] = ["",": \(appointment.cost)"]
    
    let doctor : Doctor
    let patient : Patient
    let date : String
    let appointment : Appointment
    let isUpcoming : Bool
    var delegate: AppointmentdetailsControllerDelegate?
    
    init(appointment : Appointment,userId : String ,isUpcoming : Bool){
        self.doctor = appointment.doctor
        self.date = dateFormat(date: appointment.date)
        self.appointment = appointment
        self.isUpcoming = isUpcoming
           
            let user = UserDAO()
            self.patient = (user.getUser(userId: userId) as! Patient)
            
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
   
    let doctorInformationView = UIView()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image6")
        imageView.contentMode = .scaleToFill
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
    
    let createAnotherAppointmentButton : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = UIColor(named: "book")
        button.configuration?.baseForegroundColor = UIColor(named: "white")
        button.setTitle("Book Another Appointment", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "background")
        
        setContainerViews()
        setDoctorProfile()
        setViews()
        
        if isUpcoming{
            upcomingAppointment()
        }
        else {
            completedAppointment()
        }
    }
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
    
    
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
    
    func setDoctorProfile(){
        
        profileImageView.image = UIImage(named: doctor.image)
        
        stackView.addArrangedSubview(doctorInformationView)
        
        doctorInformationView.addSubview(profileImageView)
        doctorInformationView.addSubview(nameLabel)
        doctorInformationView.addSubview(departmentLabel)
        
        doctorInformationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            doctorInformationView.heightAnchor.constraint(equalToConstant: Viewheight * 0.3),
        ])
        
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
        
        
        doctorInformationView.layer.cornerRadius = 10
        doctorInformationView.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        doctorInformationView.layer.shadowOpacity = 0.5
        doctorInformationView.layer.shadowOffset = CGSize(width: 2, height: 2)
        doctorInformationView.layer.shadowRadius = 5
        doctorInformationView.backgroundColor = UIColor(named: "white")
        
    }
    
    
    
    func setViews(){
        
        let appointmentView = createView(leftSide: appointmentTimingTitles, rightSide: appointmentAnswers)
        stackView.addArrangedSubview(appointmentView)
        
        let patientdetailsView = createView(leftSide: patientDetailsTitle, rightSide: patientsAnswers)
        stackView.addArrangedSubview(patientdetailsView)
        
        let billView = createView(leftSide: billdetails, rightSide: billAnswers)
        stackView.addArrangedSubview(billView)
        
    }
    
    func upcomingAppointment(){
        
        let horizontalStack = createHorizontalStack(labels: [cancelButton,attendButton])
        stackView.addArrangedSubview(horizontalStack)
        
        cancelButton.addTarget(self, action: #selector(cancelClicked), for: .touchUpInside)
        attendButton.addTarget(self, action: #selector(attendClicked), for: .touchUpInside)
    }
    
    
    func completedAppointment(){
        
        stackView.addArrangedSubview(createAnotherAppointmentButton)
        createAnotherAppointmentButton.addTarget(self, action: #selector(bookAnother), for: .touchUpInside)
    }
    
    func createView(leftSide : [String],rightSide : [String])->UIView{
        let view = UIView()
        
        let verticalStack : UIStackView = {
            
            let verticalStack = UIStackView()
            verticalStack.axis = .vertical
            verticalStack.spacing = 5
            verticalStack.distribution = .fill
            
            verticalStack.translatesAutoresizingMaskIntoConstraints = false
            
            return verticalStack
        }()
        
        for index in 0..<leftSide.count{
            
            if index == 0 {
                let label =  createLabel(text: leftSide[index])
                label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
               let horizontalStack = createHorizontalStack(labels: [label])
               verticalStack.addArrangedSubview(horizontalStack)
            }
            else {
                let leftLabel = createLabel(text: leftSide[index])
                let rightLabel = createLabel(text: rightSide[index])
                let horizontalStack = createHorizontalStack(labels: [leftLabel,rightLabel])
                verticalStack.addArrangedSubview(horizontalStack)
            }
        }
        
        view.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: view.topAnchor,constant: 10),
            verticalStack.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -10),
            verticalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            verticalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10)
        ])
        
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor(named: "shadow")?.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowRadius = 5
        view.backgroundColor = UIColor(named: "white")
        
        return view
    }
    
    
    func createHorizontalStack(labels : [UIView])->UIStackView{
        let horizontalStack  = UIStackView()
            horizontalStack.axis = .horizontal
            horizontalStack.spacing = 10
            horizontalStack.distribution = .fill
            horizontalStack.alignment = .top
            horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        
        
        for label in labels {
            horizontalStack.addArrangedSubview(label)
        }
        horizontalStack.sizeToFit()
        
        return horizontalStack
    }
    
    func createSpacing()->UIView{
          let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: 10).isActive = true
            return view
    }
    
    func createLabel(text : String)->UILabel{
            let label = UILabel()
            label.text = text
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 18, weight: .light)
            
            let fontMetrics = UIFontMetrics(forTextStyle: .body)
            label.font = fontMetrics.scaledFont(for: label.font)
            label.adjustsFontForContentSizeCategory = true
            
            label.translatesAutoresizingMaskIntoConstraints = false
        
        let size = label.sizeThatFits(CGSize(width: (viewWidth - 70)/2, height: CGFLOAT_MAX))
        
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: (size.height + 10))
        ])
            return label
    }
    
   
    @objc func bookAnother(){
        let viewController = DoctorProfileController(doctor: self.doctor,userId: patient.UserId)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func cancelClicked(){
        let alertController = UIAlertController(title: "Cancel Appointment", message: "Are you sure to cancel your Appointment ?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Yes", style: .destructive) {
            _ in
          let _ =   self.patient.cancelAppointment(appointment: self.appointment,reason: "reason")
            self.navigationController?.popViewController(animated: true)
            
            
        }
        
        let cancelAction = UIAlertAction(title: "No", style: .cancel)
        let reSchedule = UIAlertAction(title: "Re-Schedule", style: .default){
             _ in
            let viewController = RescheduleController(appointment: self.appointment)
            viewController.delegate = self
            if let sheet = viewController.sheetPresentationController  {
                sheet.detents = [.medium()]
                viewController.modalTransitionStyle = .coverVertical
            }
    //        self.present(viewController, animated: true)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        alertController.addAction(okAction)
        alertController.addAction(reSchedule)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    @objc func attendClicked(){
        
        if appointment.type == .Offline {
            patient.attendAppointment(appointment: appointment)
           let viewController = AppointmentEndedController(userId: patient.UserId, doctor: doctor)
            viewController.modalPresentationStyle = .fullScreen
            viewController.delegate = self
            present(viewController, animated: true)
        }
        else {
            
            let viewController = CallingController(appointment: appointment,userId: patient.UserId)
            viewController.delegate = self
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: false)
        }
    }

}


extension AppointmentdetailsController: RescheduleControllerDelegate {
    
    func clickedReshedule(_ selectedVC: clickedVC, appointment: Appointment?) {
        navigationController?.popViewController(animated: false)
        delegate?.clickedReshedule(selectedVC, appointment: appointment)
    }
}

extension AppointmentdetailsController : PopPageFromPresentedProtocol {
    func popTheViewController() {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension AppointmentdetailsController : CalledEndedProtocol {
    func callEnded() {
        let viewController = AppointmentEndedController(userId: patient.UserId, doctor: doctor)
         viewController.modalPresentationStyle = .fullScreen
         viewController.delegate = self
         present(viewController, animated: true)
    }
    
    
}

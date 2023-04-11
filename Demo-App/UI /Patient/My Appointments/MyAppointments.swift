//
//  Appointments.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 10/03/23.
//

import UIKit

class MyAppointments: UIViewController  {
    
    
    let patient : Patient?
    
    var appointments: (upcoming:[Appointment],completed : [Appointment],cancelled: [Appointment])  {
        patient!.viewAppointment()
    }
    
    var data : [Appointment] = []
    
    let noResultsImageAndLabel = ImageAndLabel()
    let myTitle : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.text = "My Appointments"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let upcomingAndCompleted : UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Up Coming","Completed","Cancelled"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.selectedSegmentTintColor = .systemBlue
        return segment
    }()
    
    let appointmentsTable = UITableView()
    
    init(userId : String) {
       
        let user = UserDAO()
        self.patient = (user.getUser(userId: userId) as! Patient)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        navigationController?.navigationBar.tintColor = UIColor(named: "book")
        
        setTitle()
        setSegement()
        setTable()
        upcomingAndCompleted.selectedSegmentIndex = 0
        appointmentsTable.backgroundColor = .clear
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        appointmentsTable.reloadData()
    }
    
   
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
       
    
    func setTitle(){
        
        let height = Viewheight * 0.07
        let width  = viewWidth
        
        view.addSubview(myTitle)
        
        NSLayoutConstraint.activate([
            myTitle.heightAnchor.constraint(equalToConstant: height),
            myTitle.widthAnchor.constraint(equalToConstant: width - 20),
            myTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    
    func setSegement(){
        view.addSubview(upcomingAndCompleted)
        let height = Viewheight * 0.04
        let width  = viewWidth
        
        NSLayoutConstraint.activate([
            upcomingAndCompleted.heightAnchor.constraint(equalToConstant: height),
            upcomingAndCompleted.widthAnchor.constraint(equalToConstant: width - 20),
            upcomingAndCompleted.topAnchor.constraint(equalTo: myTitle.bottomAnchor),
            upcomingAndCompleted.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        upcomingAndCompleted.addTarget(self, action: #selector(segmentControlChanged), for: .valueChanged)
        
    }
    
    func setTable(){
        
        appointmentsTable.register(AppointmentCell.self, forCellReuseIdentifier: AppointmentCell.identifier)
        appointmentsTable.rowHeight = 93.2
        
        print("height",view.frame.height * 0.1)
        
        view.addSubview(appointmentsTable)
        appointmentsTable.translatesAutoresizingMaskIntoConstraints = false
        appointmentsTable.backgroundColor = .gray
        appointmentsTable.dataSource = self
        appointmentsTable.delegate = self
        
        NSLayoutConstraint.activate([
            appointmentsTable.topAnchor.constraint(equalTo: upcomingAndCompleted.bottomAnchor,constant: 10),
            appointmentsTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            appointmentsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            appointmentsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10)
        ])
    }
    
    
    
    
    @objc func segmentControlChanged(){
        appointmentsTable.reloadData()
        
        if upcomingAndCompleted.selectedSegmentIndex == 0 {
            data = appointments.upcoming
        }
        else if upcomingAndCompleted.selectedSegmentIndex == 1{
            data = appointments.completed
        }
        else {
            data = appointments.cancelled
        }
    }
    
    func setNoResults(){
        appointmentsTable.addSubview(noResultsImageAndLabel)
        
        noResultsImageAndLabel.isHidden = false
        noResultsImageAndLabel.label.text = ""
        
        noResultsImageAndLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            noResultsImageAndLabel.centerXAnchor.constraint(equalTo: appointmentsTable.centerXAnchor),
            noResultsImageAndLabel.centerYAnchor.constraint(equalTo: appointmentsTable.centerYAnchor),
            noResultsImageAndLabel.heightAnchor.constraint(equalToConstant: 200),
            noResultsImageAndLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
   
    }
    
    

}

extension MyAppointments : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if upcomingAndCompleted.selectedSegmentIndex == 0 {
            if appointments.upcoming.count == 0 {
                setNoResults()
            }
            else {
                noResultsImageAndLabel.isHidden = true
            }
            return appointments.upcoming.count
        }
        else if upcomingAndCompleted.selectedSegmentIndex == 1{
            if appointments.completed.count == 0 {
                setNoResults()
            }
            else {
                noResultsImageAndLabel.isHidden = true
            }
            return appointments.completed.count
        }
        else {
            if appointments.cancelled.count == 0 {
                setNoResults()
            }
            else {
                noResultsImageAndLabel.isHidden = true
            }
            return appointments.cancelled.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AppointmentCell.identifier) as! AppointmentCell
        
        if upcomingAndCompleted.selectedSegmentIndex == 0 {
            
            let appointment = appointments.upcoming[indexPath.row]
            cell.doctorName.text = "Dr. \(appointment.doctor.name)"
            cell.time.text = " \(dateFormat(date: appointment.date))"
            cell.department.text = appointment.doctor.department.departmentName
            cell.doctorImage.image = UIImage(named: appointment.doctor.image)
        
        
            
        if appointment.type == .Offline {
            cell.type.text = "Physical"
            cell.type.textColor = .red
        }
        else {
            cell.type.text = "Online"
            cell.type.textColor = .green
        }
        }

        else if upcomingAndCompleted.selectedSegmentIndex == 1{

                let appointment = appointments.completed[indexPath.row]
            cell.doctorName.text = "Dr. \(appointment.doctor.name)"
            cell.time.text = " \(dateFormat(date: appointment.date))"
            cell.department.text = appointment.doctor.department.departmentName
            cell.doctorImage.image = UIImage(named: appointment.doctor.image)

            if appointment.type == .Offline {
                cell.type.text = "Physical"
                cell.type.textColor = .red
            }
            else {
                cell.type.text = "Online"
                cell.type.textColor = .green
            }
        }
        
        else {
            let appointment = appointments.cancelled[indexPath.row]
        cell.doctorName.text = "Dr. \(appointment.doctor.name)"
        cell.time.text = " \(dateFormat(date: appointment.date))"
        cell.department.text = appointment.doctor.department.departmentName
        cell.doctorImage.image = UIImage(named: appointment.doctor.image)

        if appointment.type == .Offline {
            cell.type.text = "Physical"
            cell.type.textColor = .red
        }
        else {
            cell.type.text = "Online"
            cell.type.textColor = .green
        }
        }
        
        return cell
    }
    
    
}

extension MyAppointments : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if upcomingAndCompleted.selectedSegmentIndex == 0 {
            let viewController = AppointmentdetailsController(appointment: appointments.upcoming[indexPath.row],userId: patient!.UserId,isUpcoming: true)
            viewController.delegate = self
            navigationController?.pushViewController(viewController, animated: true)
        }
        else if upcomingAndCompleted.selectedSegmentIndex == 1{
            let viewController = AppointmentdetailsController(appointment: appointments.completed[indexPath.row], userId: patient!.UserId,isUpcoming: false)
            navigationController?.pushViewController(viewController, animated: true)
        }
        else {
            let viewController = AppointmentdetailsController(appointment: appointments.cancelled[indexPath.row], userId: patient!.UserId,isUpcoming: false)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension MyAppointments: AppointmentdetailsControllerDelegate {
    
    func clickedReshedule(_ selectedVC: clickedVC,  appointment: Appointment?) {
        
        switch selectedVC {
        case .sameDoc:
            
            guard let doctor = appointment?.doctor else { return }
            guard let patient = appointment?.bookedBy else { return }
            
            let viewController = DoctorProfileController(doctor: doctor,userId: patient.UserId)
            navigationController?.pushViewController(viewController, animated: false)
        case .DiffDocSameTime:
            
            guard let patient = appointment?.bookedBy else { return }
            
            let viewController = AvailableDoctorsController(userId: patient.UserId)
            viewController.time = appointment?.slot.time.startTime
            viewController.date = appointment?.date
            viewController.department = appointment?.doctor.department
         //   viewController.type = appointment?.type
            navigationController?.pushViewController(viewController, animated: false)
            
        case .DiffDocAndTime:
            
            guard let patient = appointment?.bookedBy else { return }
            
            let viewController = ViewDepartment(userId: patient.UserId,department: (appointment?.doctor.department.departmentName)!)
            navigationController?.pushViewController(viewController, animated: false)
        }
    }
}

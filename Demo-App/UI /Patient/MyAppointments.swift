//
//  Appointments.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 10/03/23.
//

import UIKit

class MyAppointments: UIViewController {
    
    let patient : Patient?
    
    var appointments: (upcoming:[Appointment],completed : [Appointment])  {
        patient!.viewAppointment()
    }
    
    var data : [Appointment] = []
    
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
        let segment = UISegmentedControl(items: ["Up Coming","Completed"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.selectedSegmentTintColor = .systemBlue
        return segment
    }()
    
    let appointmentsTable = UITableView()
    
    init(patient: Patient?) {
        self.patient = patient
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setTitle()
        setSegement()
        setTable()
        upcomingAndCompleted.selectedSegmentIndex = 0
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        appointmentsTable.reloadData()
    }
    
    
    func setTitle(){
        
        let height = view.frame.height * 0.07
        let width  = view.frame.width
        
        view.addSubview(myTitle)
        
        NSLayoutConstraint.activate([
            myTitle.heightAnchor.constraint(equalToConstant: height),
            myTitle.widthAnchor.constraint(equalToConstant: width),
            myTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: -50)
        ])
        
    }
    
    
    func setSegement(){
        view.addSubview(upcomingAndCompleted)
        let height = view.frame.height * 0.04
        let width  = view.frame.width
        
        NSLayoutConstraint.activate([
            upcomingAndCompleted.heightAnchor.constraint(equalToConstant: height),
            upcomingAndCompleted.widthAnchor.constraint(equalToConstant: width),
            upcomingAndCompleted.topAnchor.constraint(equalTo: myTitle.bottomAnchor)
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
            appointmentsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            appointmentsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    
    
    @objc func segmentControlChanged(){
        appointmentsTable.reloadData()
    }
    
    

}

extension MyAppointments : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if upcomingAndCompleted.selectedSegmentIndex == 0 {
            return appointments.upcoming.count
        }
        else {
            return appointments.completed.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AppointmentCell.identifier) as! AppointmentCell
        if upcomingAndCompleted.selectedSegmentIndex == 0 {
            let appointment = appointments.upcoming[indexPath.row]
            cell.doctorName.text = "Dr. \(appointment.doctor.name)   Department : \(appointment.doctor.department)"
            cell.time.text = "Date : \(dateFormat(date: appointment.date))"
        }
        
        return cell
    }
    
    
}

extension MyAppointments : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if upcomingAndCompleted.selectedSegmentIndex == 0 {
            print("Selected")
            let viewController = BookAppointment(appointment: appointments.upcoming[indexPath.row], patient: self.patient!)
            viewController.confirmButton.isHidden = true
            navigationController?.pushViewController(viewController, animated: true)
        }
        else {
           print("Completed")
        }
    }
}
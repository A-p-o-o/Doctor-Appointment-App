//
//  ViewAppointments.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 21/03/23.
//

import UIKit

class ViewAppointments: UIViewController {
    
    let doctor : Doctor
    
    var appointments: (upcoming :[String : [Appointment]] ,completed : [String : [Appointment]],cancelled: [Appointment]) {
        doctor.appointments
    }
    
    var upcomingDays : [String] {
       return Array(appointments.upcoming.keys).sorted(by: >)
    }
    
    var completedDays : [String] {
        return Array(appointments.completed.keys).sorted(by: >)
     }
   
   lazy var data : [String] = upcomingDays
    
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
    
    let appointmentsTable = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    init(doctor : Doctor){
        self.doctor = doctor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        
        setTitle()
        setSegement()
        setTable()
        upcomingAndCompleted.selectedSegmentIndex = 0
        appointmentsTable.backgroundColor = .clear
        orientationChanged()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        appointmentsTable.reloadData()
    }
   
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
        
    func orientationChanged(){
        
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        
        
        NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { [self] _ in
            
            let orientation = UIDevice.current.orientation
            switch orientation {
            case .portrait:
                appointmentsTable.reloadData()
            case .landscapeLeft, .landscapeRight:
                appointmentsTable.reloadData()
            default:
                break
            }
        }
        
    }
       
    
    func setTitle(){
        
        let height = Viewheight * 0.07
        let width  = viewWidth
        
        view.addSubview(myTitle)
        
        NSLayoutConstraint.activate([
            myTitle.heightAnchor.constraint(equalToConstant: height),
            myTitle.widthAnchor.constraint(equalToConstant: width),
            myTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    
    func setSegement(){
        view.addSubview(upcomingAndCompleted)
        let height = Viewheight * 0.04
        
        NSLayoutConstraint.activate([
            upcomingAndCompleted.heightAnchor.constraint(equalToConstant: height),
            upcomingAndCompleted.widthAnchor.constraint(equalTo: view.widthAnchor,constant:  -20),
            upcomingAndCompleted.topAnchor.constraint(equalTo: myTitle.bottomAnchor),
            upcomingAndCompleted.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        upcomingAndCompleted.addTarget(self, action: #selector(segmentControlChanged), for: .valueChanged)
        
    }
    
    func setTable(){
        
        appointmentsTable.register(DateAndPatientsCell.self, forCellWithReuseIdentifier: DateAndPatientsCell.identifier)
        
        
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
        
        data = []
        
        if upcomingAndCompleted.selectedSegmentIndex == 0 {
           data = upcomingDays
            appointmentsTable.reloadData()
        }
        else {
            data = completedDays
            appointmentsTable.reloadData()
        }
        
    }
    
    

}


extension ViewAppointments : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if upcomingAndCompleted.selectedSegmentIndex == 0 {
            return data.count
        }
        else {
            return data.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateAndPatientsCell.identifier, for: indexPath) as! DateAndPatientsCell
        
        if upcomingAndCompleted.selectedSegmentIndex == 0 {
            
            cell.leftTitleLabel.text = upcomingDays[indexPath.row]
            cell.rightTitleLabel.text = "\(appointments.upcoming[upcomingDays[indexPath.row]]?.count ?? 0) Appointments"
            
        }
        
        
        return cell
    }
    
    
}

extension ViewAppointments : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = Viewheight * 0.07
        let width = collectionView.frame.width - 20
       return CGSize(width: width, height: height)
    }
}

extension ViewAppointments : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if upcomingAndCompleted.selectedSegmentIndex == 0 {
            
            let viewController = PerDayAppointmentsController()
            
            let date : String = data[indexPath.row]
            let onlineAppointments : [Appointment] = {
                (appointments.upcoming[date]?.filter({$0.type == .Online}))!
            }()
            
            let offlineAppointments : [Appointment] = {
                (appointments.upcoming[date]?.filter({$0.type == .Offline}))!
            }()
            
            viewController.updatedata(userName: doctor.UserId, selectedDate: date, onlineAppointments: onlineAppointments, offlineAppointmernts: offlineAppointments)
            navigationController?.pushViewController(viewController, animated: true)
        }
        else {
           print("Completed")
        }
    }
}


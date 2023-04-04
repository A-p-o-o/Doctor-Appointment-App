//
//  PerDayAppointmentsController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 03/04/23.
//

import UIKit

class PerDayAppointmentsController: UIViewController {
    
    var userName : String? = nil
    
    var doctor : Doctor {
        userDetails.getDoctor(userId: userName!)!
    }
    
    private let userDetails : UserDetails = UserDetails()
    
    var selectedDate : String? = nil
    
    var OnlineAppointments: [Appointment]? = nil
    var offlineAppointmernts : [Appointment]? = nil
    
     var data : [Appointment]? = nil
    
    func updatedata(userName : String,selectedDate : String,onlineAppointments : [Appointment],offlineAppointmernts : [Appointment]){
        self.userName = userName
        self.selectedDate = selectedDate
        self.OnlineAppointments = onlineAppointments
        self.offlineAppointmernts = offlineAppointmernts
    }
    
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
    
    let OfflineAndOnline : UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Offline","Online"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.selectedSegmentTintColor = .systemBlue
        return segment
    }()
    
    let appointmentsTable = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        
        setTitle()
        setSegement()
        setTable()
        OfflineAndOnline.selectedSegmentIndex = 0
        appointmentsTable.backgroundColor = .clear
        orientationChanged()
        
        myTitle.text = selectedDate!
        data = offlineAppointmernts
    }
    
    override func viewDidAppear(_ animated: Bool) {
        appointmentsTable.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationController?.navigationBar.isHidden = true
       // navigationController?.navigationBar.isHidden = true
       // tabBarController?.tabBar.isHidden = false
        
        navigationController?.navigationBar.tintColor = .black
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
        view.addSubview(OfflineAndOnline)
        let height = Viewheight * 0.04
        
        NSLayoutConstraint.activate([
            OfflineAndOnline.heightAnchor.constraint(equalToConstant: height),
            OfflineAndOnline.widthAnchor.constraint(equalTo: view.widthAnchor,constant:  -20),
            OfflineAndOnline.topAnchor.constraint(equalTo: myTitle.bottomAnchor),
            OfflineAndOnline.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        OfflineAndOnline.addTarget(self, action: #selector(segmentControlChanged), for: .valueChanged)
        
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
            appointmentsTable.topAnchor.constraint(equalTo: OfflineAndOnline.bottomAnchor,constant: 10),
            appointmentsTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            appointmentsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            appointmentsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    
    
    @objc func segmentControlChanged(){
        
        data = []
        
        if OfflineAndOnline.selectedSegmentIndex == 0 {
           data = offlineAppointmernts
            appointmentsTable.reloadData()
        }
        else {
            data = OnlineAppointments
            appointmentsTable.reloadData()
        }
        
    }
    
    

}


extension PerDayAppointmentsController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if OfflineAndOnline.selectedSegmentIndex == 0 {
            return data?.count ?? 0
        }
        else {
            return data?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateAndPatientsCell.identifier, for: indexPath) as! DateAndPatientsCell
        
        cell.leftTitleLabel.text = data![indexPath.row].patientName
        
        if OfflineAndOnline.selectedSegmentIndex == 0 {
            cell.rightTitleLabel.text = "Offline"
            cell.rightTitleLabel.textColor = .red
            cell.rightImageView.image = UIImage(named: "circle.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
            
        }
        else {
            cell.rightTitleLabel.text = "Online"
            cell.rightTitleLabel.textColor = .green
            cell.rightImageView.image = UIImage(named: "circle.fill")?.withTintColor(.green, renderingMode: .alwaysOriginal)
        }
        
        
        return cell
    }
    
    
}

extension PerDayAppointmentsController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = Viewheight * 0.07
        let width = collectionView.frame.width - 20
       return CGSize(width: width, height: height)
    }
}

extension PerDayAppointmentsController : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if OfflineAndOnline.selectedSegmentIndex == 1 {
            
            let viewController = AppointmentPatientDetailsController()
            navigationController?.pushViewController(viewController, animated: true)
        }
        else {
           print("Completed")
        }
    }
}


//
//  AvailableDoctorsController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 31/03/23.
//

import UIKit

class AvailableDoctorsController: UIViewController {

    let patient : Patient
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
     
    var date : Date? = nil
    var department : Department? = nil
    var time : String? = nil
   // var type : AppointmentType? = nil
    
    var searchtext = "No"
    
    var availableDoctors : [Doctor] {
        search.availableDoctorsOn(date: dateFormat(date: date!), department: department!, time: time!)
    }
    
    lazy var filteredDoctors = availableDoctors
    
    let search = Search()

    let searchController = UISearchController()
    let noResultsImageAndLabel = ImageAndLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = UIColor(named: "book")
        setCollectionView()
        view.backgroundColor = UIColor(named: "background")
        title = "Available Doctors"
        setSearchController()
        orientationChanged()
        
    }
    
    func setSearchController(){
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        navigationItem.searchController = searchController
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        orientationChanged()
    }
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
        
    func orientationChanged(){
        
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        
        
        NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { [self] _ in
            
            let orientation = UIDevice.current.orientation
            switch orientation {
            case .portrait:
                collectionView.reloadData()
            case .landscapeLeft, .landscapeRight:
                collectionView.reloadData()
            default:
                break
            }
        }
        
    }
    
    init(userId : String) {
       
        let user = UserDAO()
        self.patient = (user.getUser(userId: userId) as! Patient)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setCollectionView(){
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        

        
        collectionView.register(ResultDoctorCell.self, forCellWithReuseIdentifier: ResultDoctorCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(named: "background")
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setNoResults(){
        collectionView.addSubview(noResultsImageAndLabel)
        
        noResultsImageAndLabel.isHidden = false
        noResultsImageAndLabel.label.text = "No Doctors available on \(date!) for \(time!)"
        
        noResultsImageAndLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            noResultsImageAndLabel.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
            noResultsImageAndLabel.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor),
            noResultsImageAndLabel.heightAnchor.constraint(equalToConstant: 200),
            noResultsImageAndLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
   
    }

}

extension  AvailableDoctorsController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if filteredDoctors.count == 0 && searchtext == "No"{
            noResultsImageAndLabel.label.text = "No Doctors Available"
            setNoResults()
        }
        
       else  if filteredDoctors.count == 0 && searchtext != "No" && searchtext != "" {
           noResultsImageAndLabel.label.text = "No results for \(searchtext)"
            setNoResults()
        }
        else {
            noResultsImageAndLabel.isHidden = true
        }
        return filteredDoctors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResultDoctorCell.identifier, for: indexPath) as! ResultDoctorCell
        let doctor = filteredDoctors[indexPath.row]
        cell.name.text = doctor.name
        cell.department.text = doctor.department.departmentName
        cell.experience.text = "\(doctor.experience) years of experience"
        cell.profile.image = UIImage(named: doctor.image)
        cell.backgroundColor = UIColor(named: "white")?.withAlphaComponent(0.6)
        
        cell.profile.layer.cornerRadius = (cell.frame.height - 5) / 2
        cell.sizeToFit()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = Viewheight * 0.1
        let width = collectionView.frame.width - 20
       return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
                let doctor = filteredDoctors[indexPath.row]
        
        let endAndSlot : (endtime : String ,slotNo : Int) = search.getEndtimeAndSlot(doctor: doctor, date: dateFormat(date: date!), startTime: time!)
        
        //let viewController = BookAppointmentController(doctor: doctor, userId: patient.UserId, startTime: time!, endTime: endAndSlot.endtime, date: dateFormat(date: date!), slotNo: endAndSlot.slotNo,type: type!)
        
        let viewController = AppointmentModeController()
        viewController.doctor = doctor
        viewController.patient = self.patient
        viewController.slotNo = endAndSlot.slotNo
        viewController.starTime = time!
        viewController.endTime = endAndSlot.endtime
        viewController.date = dateFormat(date: date!)
        
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    
}

extension AvailableDoctorsController : UISearchResultsUpdating,UISearchControllerDelegate {
    
    func updateSearchResults(for searchController: UISearchController){
        
        guard let text = searchController.searchBar.text else {
            return
        }
        searchtext = text
        filteredDoctors = []
        
        for doctor in availableDoctors {
            if (doctor.name).uppercased().contains(text.uppercased()){
                filteredDoctors.append(doctor)
            }
        }
        collectionView.reloadData()
       
     }
    

    func didDismissSearchController(_ searchController: UISearchController) {
        searchtext = "No"
        filteredDoctors = []
        filteredDoctors = availableDoctors
        collectionView.reloadData()
        
    }
}

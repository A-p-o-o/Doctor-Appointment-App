//
//  ViewDepartment.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 14/03/23.
//

import UIKit

class ViewDepartment: UIViewController ,UISearchResultsUpdating,UISearchControllerDelegate{
    
    let patient : Patient
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var department = ""
    var doctorsInDepartments : [Doctor] {
        search.doctorsInDepartment(dept: department)
    }
    
    lazy var filteredDoctors = doctorsInDepartments
    
    let search = Search()

    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = false 
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.tintColor = .black
        setTableView()
        view.backgroundColor = UIColor(named: "background")
        title = department
        setSearchController()
        orientationChanged()
    }
    
    
    func setSearchController(){
        title = department.uppercased()
        navigationController?.navigationBar.prefersLargeTitles = true
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
    
    init(patient: Patient, department: String = "") {
        self.patient = patient
        self.department = department
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setTableView(){
        
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

}

extension  ViewDepartment : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredDoctors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResultDoctorCell.identifier, for: indexPath) as! ResultDoctorCell
        let doctor = filteredDoctors[indexPath.row]
        cell.name.text = doctor.name
        cell.department.text = doctor.department.departmentName
        cell.experience.text = "\(doctor.experience) years of experience"
        cell.profile.image = UIImage(named: doctor.image)
        cell.backgroundColor = .white.withAlphaComponent(0.6)
        
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
                let viewController = DoctorProfileController(doctor: doctor,patient: self.patient)
        
                navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}

extension ViewDepartment {
    
    func updateSearchResults(for searchController: UISearchController){
        
        guard let text = searchController.searchBar.text else {
            return
        }
       
        filteredDoctors = []
        
        for doctor in doctorsInDepartments {
            if (doctor.name).uppercased().contains(text.uppercased()){
                filteredDoctors.append(doctor)
            }
        }
        collectionView.reloadData()
       
     }
    

    func didDismissSearchController(_ searchController: UISearchController) {
        filteredDoctors = []
        filteredDoctors = doctorsInDepartments
        collectionView.reloadData()
        
    }
}

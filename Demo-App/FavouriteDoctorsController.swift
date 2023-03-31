//
//  FavouriteDoctorsController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 30/03/23.
//

import UIKit

class FavouriteDoctorsController: UIViewController ,UISearchResultsUpdating,UISearchControllerDelegate{

    
    let patient : Patient
    var favouriteDoctors : [Doctor] {
        patient.getFavouriteDoctors()
    }
    lazy var filtered : [Doctor] = favouriteDoctors
    
    init(patient: Patient) {
        self.patient = patient
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let searchController = UISearchController()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
   let noResults : UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
       imageView.image = UIImage(named: "noresults")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
   }()
   
    
    
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
    
    
    override func viewDidLoad ( ){
        super.viewDidLoad ()
        
        navigationController?.navigationBar.isHidden = false 
        tabBarController?.tabBar.isHidden = true

        
        view.backgroundColor = UIColor(named: "background")
        title = "Favourite Doctors"
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        navigationItem.searchController = searchController
        
        setTableView()
        noResults.isHidden = true
    }
    
    func updateSearchResults(for searchController: UISearchController){
        
        guard let text = searchController.searchBar.text else {
            return
        }
       
        filtered = []
        
        for doctor in favouriteDoctors {
            if (doctor.name).uppercased().contains(text.uppercased()){
                filtered.append(doctor)
            }
        }
        collectionView.reloadData()
       
     }
    

    func didDismissSearchController(_ searchController: UISearchController) {
        filtered = []
        filtered = favouriteDoctors
        collectionView.reloadData()
        noResults.isHidden = true
    }
    
    
    func setTableView(){
        
        view.addSubview(collectionView)
       // view.addSubview(noResults)
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

extension  FavouriteDoctorsController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filtered.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResultDoctorCell.identifier, for: indexPath) as! ResultDoctorCell
        let doctor = filtered[indexPath.row]
        cell.name.text = doctor.name
        cell.department.text = doctor.department.departmentName
        cell.experience.text = "\(doctor.experience) years of experience"
        cell.profile.image = UIImage(named: doctor.image)
        cell.backgroundColor = .white.withAlphaComponent(0.6)
        cell.profile.layer.cornerRadius = (cell.contentView.frame.height - (2 * cell.contentView.frame.height * 0.04 - 5)) / 2
        cell.sizeToFit()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = Viewheight * 0.1
        let width = collectionView.frame.width - 20
       return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

                let doctor = favouriteDoctors[indexPath.row]
                let viewController = DoctorProfileController(doctor: doctor,patient: self.patient)

                navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}

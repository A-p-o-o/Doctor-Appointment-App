//
//  AllDepartmentsController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 28/03/23.
//

import UIKit

class AllDepartmentsController: UIViewController {
    
    let patient : Patient
    
    init(patient: Patient) {
        self.patient = patient
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = true

        setSearchController()
         setViews()
        view.backgroundColor = UIColor(named: "background")
       
    }
    
    let allDepartments : [Department] = Department.allCases
    
    lazy var filteredDepartments : [Department] = allDepartments
    
    let searchController = UISearchController()
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
   

    func setSearchController(){
        title = "All Specialist"
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        navigationItem.searchController = searchController
    }
    
    func setViews(){
       
        
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
        collectionView.register(SpecialistCell.self, forCellWithReuseIdentifier: SpecialistCell.identifier)
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
        ])
    }
    

 
}

extension AllDepartmentsController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return  filteredDepartments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpecialistCell.identifier, for: indexPath) as! SpecialistCell
        cell.departmentName.text = filteredDepartments[indexPath.row].departmentName
        cell.departmentImage.image = UIImage(named: filteredDepartments[indexPath.row].departmentName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       let width =  (viewWidth - 40) / 2 - 10
        let height = (Viewheight ) / 5 - 20
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let viewController = ViewDepartment(patient: self.patient)
        let department = filteredDepartments[indexPath.row].departmentName
        viewController.department = department
        navigationController?.pushViewController(viewController, animated: false)
    }
    
}

extension AllDepartmentsController : UISearchResultsUpdating,UISearchControllerDelegate{
    func updateSearchResults(for searchController: UISearchController){
        
        guard let text = searchController.searchBar.text else {
            return
        }
       
        filteredDepartments = []
        
        for department in allDepartments {
            if (department.departmentName).uppercased().contains(text.uppercased()){
                filteredDepartments.append(department)
            }
        }
        collectionView.reloadData()
       
     }
    

    func didDismissSearchController(_ searchController: UISearchController) {
        filteredDepartments = []
        filteredDepartments = allDepartments
        collectionView.reloadData()
        
    }
}

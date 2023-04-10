//
//  AllSymptomsController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 28/03/23.
//

import UIKit

class AllSymptomsController: UIViewController {
    
    let allSymptomsAndDepartment : [Department : [String]] = Symptomps().allDepartmentAndSymptoms
    
    let allDepartments : [Department] = Array(Symptomps().allDepartmentAndSymptoms.keys).sorted(by: { $0.departmentName < $1.departmentName  })
    
    lazy var filteredSymptomsAndDepartments  : [Department : [String]]  = allSymptomsAndDepartment
    
    let patient : Patient
    var searchtext : String = "No"
    
    init(userId : String) {
       
        let user = UserDAO()
        self.patient = (user.getUser(userId: userId) as! Patient)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let searchController = UISearchController()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let noResultsImageAndLabel = ImageAndLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setViews()
        view.backgroundColor = UIColor(named: "background")
       setSearchController()
        
        
    }
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
        
        
    func setSearchController(){
        title = "All Symptoms"
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
        
        collectionView.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeaderView.identifier)
        
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
    
    func setNoResults(){
        collectionView.addSubview(noResultsImageAndLabel)
        
        noResultsImageAndLabel.isHidden = false
        noResultsImageAndLabel.label.text = ""
        
        noResultsImageAndLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            noResultsImageAndLabel.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
            noResultsImageAndLabel.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor),
            noResultsImageAndLabel.heightAnchor.constraint(equalToConstant: 200),
            noResultsImageAndLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
   
    }
    

 
}

extension AllSymptomsController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if Array(filteredSymptomsAndDepartments.keys).count == 0 && searchtext == "No"{
            noResultsImageAndLabel.label.text = "No data Available"
            setNoResults()
        }
        
       else  if Array(filteredSymptomsAndDepartments.keys).count == 0 && searchtext != "No" && searchtext != "" {
           noResultsImageAndLabel.label.text = "No results for \(searchtext)"
            setNoResults()
        }
        else {
            noResultsImageAndLabel.isHidden = true
        }
        return Array(filteredSymptomsAndDepartments.keys).count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let department = allDepartments[section]
        return filteredSymptomsAndDepartments[department]!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpecialistCell.identifier, for: indexPath) as! SpecialistCell
        
        let department = allDepartments[indexPath.section]
        let symptoms = filteredSymptomsAndDepartments[department]!
       
        cell.departmentName.text = symptoms[indexPath.row]
        cell.departmentImage.image = UIImage(named: symptoms[indexPath.row])
        
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       let width =  (viewWidth - 40) / 2 - 10
        let height = Viewheight / 5 - 20
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: Viewheight * 0.05) 
        }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionHeaderView.identifier, for: indexPath) as! CollectionHeaderView
            
            headerView.title.text = allDepartments[indexPath.section].departmentName
            return headerView
        default:
            fatalError("Unexpected supplementary view kind: \(kind)")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        let department = Array(filteredSymptomsAndDepartments.keys)[indexPath.section]
        let viewController = ViewDepartment(userId: patient.UserId,department: department.departmentName)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension AllSymptomsController : UISearchResultsUpdating,UISearchControllerDelegate {
    
    func updateSearchResults(for searchController: UISearchController){
        
        guard let text = searchController.searchBar.text else {
            return
        }
        searchtext = text
        filteredSymptomsAndDepartments = [:]
        
        for (department,symptoms) in allSymptomsAndDepartment{
            
            for sysmptom in symptoms{
                
                if sysmptom.uppercased().contains(text.uppercased()){
                    print("text =",text,"syp",sysmptom)
                    if filteredSymptomsAndDepartments.contains(where: { $0.key == department }) {
                        filteredSymptomsAndDepartments[department]?.append(sysmptom)
                    }
                    else{
                        filteredSymptomsAndDepartments[department] = []
                        filteredSymptomsAndDepartments[department]?.append(sysmptom)
                    }
                }
            }
        }
        collectionView.reloadData()
       
     }
    

    func didDismissSearchController(_ searchController: UISearchController) {
        searchtext = "No"
        filteredSymptomsAndDepartments = [:]
        filteredSymptomsAndDepartments = allSymptomsAndDepartment
        collectionView.reloadData()
        
    }
}

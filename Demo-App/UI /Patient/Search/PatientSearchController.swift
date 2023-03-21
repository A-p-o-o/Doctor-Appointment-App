//
//  PatientSearchController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 13/03/23.
//

import UIKit

class PatientSearchController: UIViewController {
    
    let patient : Patient
    

    let searchField : UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Search Doctor / Department / Symptoms"
        search.searchBarStyle = .minimal
        search.translatesAutoresizingMaskIntoConstraints = false
        search.backgroundColor = .red
        return search
    }()
    
    var data :[Any] = []
    
    let tableView = UITableView()
    
    
    init(patient: Patient) {
        self.patient = patient
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setSearchBar()
        setTableView()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        searchField.text = ""
        data = []
        tableView.reloadData()
    }
    
    
    
    func setSearchBar(){
        
        view.addSubview(searchField)
        searchField.delegate = self
        
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchField.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor),
            searchField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            searchField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)
        ])
        
    }
    
    func setTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SearchResultsCell.self, forCellReuseIdentifier: SearchResultsCell.identifier)
        tableView.separatorInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        tableView.register(ResultDoctorCell.self, forCellReuseIdentifier: ResultDoctorCell.identifier)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchField.bottomAnchor,constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

extension PatientSearchController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        guard let text = searchBar.text else {return}
//        guard let patient else {return}
        data = []
        data.append(contentsOf: patient.searchDoctor(text: text))
        let search = Search()
        data.append(contentsOf: search.searchDepartment(text: text))
    
        tableView.reloadData()
    }
    
}

extension PatientSearchController : UITableViewDataSource ,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        
        
        let indexValue = data[indexPath.row]
        if  indexValue is Department {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultsCell.identifier, for: indexPath) as! SearchResultsCell
            
            cell.leftLabel.text = "\(data[indexPath.row])".capitalized
            cell.rightLabel.text = "DEPARTMENT"
            
            return cell
        }
        else if indexValue is Doctor{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ResultDoctorCell.identifier, for: indexPath) as! ResultDoctorCell
            
            let doctor = indexValue as! Doctor
            cell.name.text = doctor.name
            cell.department.text = "\(doctor.department)".capitalized
            cell.experience.text = "\(doctor.experience) years of experience"
            cell.profile.layer.cornerRadius = (cell.contentView.frame.height - 10) / 2
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultsCell.identifier, for: indexPath) as! SearchResultsCell
            
            let doctor = indexValue as! Doctor
            cell.leftLabel.text = doctor.name
            cell.rightLabel.text = "\(doctor.department)".capitalized
            cell.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let indexValue = data[indexPath.row]
        
        if indexValue is Doctor {
            return CGFloat(80)
        }
        return CGFloat(40)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = data[indexPath.row]
        
        if item is Doctor {
            let doc = item as! Doctor
            let viewController = ViewDoctor(doctor: doc,patient: self.patient)
            navigationController?.pushViewController(viewController, animated: true)
        }
        if item is Department {
            let department = item as! Department
            let viewController = ViewDepartment(patient: self.patient)
            viewController.department = "\(department)".lowercased()
            navigationController?.pushViewController(viewController, animated: false)
        }
    }
    
    
}

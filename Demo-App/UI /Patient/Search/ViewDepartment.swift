//
//  ViewDepartment.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 14/03/23.
//

import UIKit

class ViewDepartment: UIViewController {
    
    let tableView = UITableView()
    var department = ""
    var doctorsInDepartments : [Doctor] {
        search.doctorsInDepartment(dept: department)
    }
    
    let search = Search()

    override func viewDidLoad() {
        super.viewDidLoad()

        setTableView()
        view.backgroundColor = .white
        title = department.capitalized
    }
    
    
    func setTableView(){
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(ResultDoctorCell.self, forCellReuseIdentifier: ResultDoctorCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

extension ViewDepartment : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let viewController = ViewDoctor()
        viewController.doctor = doctorsInDepartments[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension ViewDepartment : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return doctorsInDepartments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultDoctorCell.identifier, for: indexPath) as! ResultDoctorCell
        let doctor = doctorsInDepartments[indexPath.row]
        cell.name.text = doctor.name
        cell.department.text = "\(doctor.department)".uppercased()
        cell.experience.text = "\(doctor.experience) years of experience"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
    
}

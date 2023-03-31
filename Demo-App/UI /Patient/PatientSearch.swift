//
//  PatientSearch.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 13/03/23.
//

import UIKit

class PatientSearch: UIViewController {
    
    let patient : Patient

    let searchField : UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Search Doctor / Department / Symptoms"
        search.searchBarStyle = .minimal
        search.translatesAutoresizingMaskIntoConstraints = false
        search.backgroundColor = .red
        return search
    }()
    
    
//    let calendar : UICalendarView = {
//        let calendar =  UICalendarView()
//        calendar.translatesAutoresizingMaskIntoConstraints = false
//        return calendar
//    }()
//
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setSearchBar()
        setCalendar()
    }
    
    init(patient: Patient) {
        self.patient = patient
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func setCalendar(){
//        
//        view.addSubview(calendar)
//        
//        NSLayoutConstraint.activate([
//        calendar.topAnchor.constraint(equalTo: searchField.bottomAnchor,constant: 20),
//        calendar.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor),
//        calendar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//        calendar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
//        ])
    }


}

extension PatientSearch : UISearchBarDelegate{
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let vc = BookAppointmentOfYourChoiceController()
        vc.patient = self.patient
        vc.view.backgroundColor = .green
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: false)
        return false
    }
}

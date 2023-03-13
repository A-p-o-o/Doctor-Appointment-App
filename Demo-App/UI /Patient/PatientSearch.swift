//
//  PatientSearch.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 13/03/23.
//

import UIKit

class PatientSearch: UIViewController {

    let searchField : UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Search Doctor / Department / Symptoms"
        search.searchBarStyle = .minimal
        search.translatesAutoresizingMaskIntoConstraints = false
        search.backgroundColor = .red
        return search
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setSearchBar()
    }
    
    
    func setSearchBar(){
        
        view.addSubview(searchField)
        
        
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchField.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor),
            searchField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            searchField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)
        ])
        
    }


}

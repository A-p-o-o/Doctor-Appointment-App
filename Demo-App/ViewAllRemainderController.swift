//
//  ViewAllRemainderController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 04/04/23.
//

import UIKit

class ViewAllRemainderController: UIViewController {
    
    let reminders = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func setRemaindersTableView(){
        view.addSubview(reminders)
        
        reminders.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reminders.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            reminders.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            reminders.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            reminders.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        reminders.register(UITableViewCell.self, forCellReuseIdentifier: "reminders")
        reminders.dataSource = self
        reminders.delegate = self
    }
}

extension ViewAllRemainderController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        23
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reminders",for: indexPath)
        
        return cell
    }
    
    
}

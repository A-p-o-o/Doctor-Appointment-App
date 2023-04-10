//
//  ratingController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/04/23.
//

import UIKit

class ratingController: UIViewController {

    
    let data = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id risus eu nulla bibendum tempor. Aliquam ac massa orci. Maecenas interdum libero a luctus vehicula.",
                    "Vestibulum ultrices, mauris at venenatis pharetra, turpis quam varius ipsum, ac rhoncus sapien massa a tellus. Ut vel tincidunt leo. Aliquam sit amet luctus ex. Donec id augue bibendum, bibendum sapien vel, consequat ante. Sed non lacinia erat.",
                    "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Duis sit amet bibendum elit, at ultricies dolor. Donec varius ultricies enim eget tristique. Sed quis nibh lectus."]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        setTableView()
    }
    
  
    
    func setTableView(){
        
        view.addSubview(tableView)
        
        tableView.register(ReviewCell.self, forCellReuseIdentifier: ReviewCell.identifier)
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        
    }

}

extension ratingController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewCell.identifier, for: indexPath)  as! ReviewCell
        
        cell.name.text = "Naveen"
        cell.date.text = "20-09-2002"
        cell.ratings.giveRating(rating: 3)
        cell.content.text = data[1]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        UITableView.automaticDimension
    }
    
}

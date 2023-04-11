//
//  ratingController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 07/04/23.
//

import UIKit

class ratingController: UIViewController {

    
    
    let data = ["Lorem ipsum dolor sit amet",
                    "Vestibulum ultrices, mauris at venenatis pharetra, turpis quam varius ipsum, ac rhoncus sapien massa a tellus. Ut vel tincidunt leo. Aliquam sit amet luctus ex. Donec id augue bibendum, bibendum sapien vel, consequat ante. Sed non lacinia erat.",
                    "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Duis sit amet bibendum elit, at ultricies dolor. Donec varius ultricies enim eget tristique. Sed quis nibh lectus."]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setTableView()
    }
    
  
    
    func setTableView(){
        
        view.addSubview(tableView)
        
        tableView.register(ReviewCell.self, forCellReuseIdentifier: ReviewCell.identifier)
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        
    }
    
    var selectedIndex : Int? = nil
    
    @objc func viewMoreClicked(_ sender : UIButton){
       
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            selectedIndex = sender.tag
        }
        let indexPath = IndexPath(row: sender.tag, section: 0)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func isViewMoreNeeded(cell : ReviewCell){
        let threeLineSize = cell.content.sizeThatFits(CGSize(width: view.frame.width, height: CGFLOAT_MAX))
        
        cell.content.numberOfLines = 0
        let ZeroLineSize = cell.content.sizeThatFits(CGSize(width: view.frame.width, height: CGFLOAT_MAX))
        
        cell.content.numberOfLines = 3
        
        if threeLineSize.height == ZeroLineSize.height{
            cell.viewMoreButton.isHidden = true
        }
    }
    

}

extension ratingController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewCell.identifier, for: indexPath)  as! ReviewCell
        
        var text = data[1]
        if indexPath.row % 2 == 0 {
            text = data[0]
        }
        
        
        cell.name.text = "Naveen"
        cell.date.text = "20-09-2002"
        cell.ratings.giveRating(rating: 3)
        cell.content.text = text
        isViewMoreNeeded(cell: cell)
        cell.viewMoreButton.tag = indexPath.row
        cell.viewMoreButton.addTarget(self, action: #selector(viewMoreClicked(_:)), for: .touchUpInside)
        if selectedIndex == indexPath.row{
            cell.content.numberOfLines = 0
            cell.viewMoreButton.isHidden = true
        }else {
            cell.content.numberOfLines = 3
           // cell.viewMoreButton.isHidden = false
            cell.isSelected = false
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        UITableView.automaticDimension
    }
   
    
}

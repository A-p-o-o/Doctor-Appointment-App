//
//  PayementController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 27/03/23.
//

import UIKit

class PayementController: UIViewController {

    let paymentOptionLabel :  UILabel = {
        let label = UILabel()
        label.text = "Choose Your Payment "
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
        label.font = fontMetrics.scaledFont(for: label.font)
        label.adjustsFontForContentSizeCategory = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let typeOfPayementsTableView : UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = UIColor(named: "background")
       setViews()
       
    }
    
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
        
        
    
    func setViews(){
        view.addSubview(paymentOptionLabel)
        view.addSubview(typeOfPayementsTableView)
        setConstrains()
    }
    
    
    func setConstrains(){
        
        typeOfPayementsTableView.register(PaymentsCell.self, forCellReuseIdentifier: PaymentsCell.identifier)
        typeOfPayementsTableView.dataSource = self
        typeOfPayementsTableView.delegate = self
        typeOfPayementsTableView.isScrollEnabled = false
        
        typeOfPayementsTableView.separatorInset = UIEdgeInsets(top: -30, left: 0, bottom: 30, right: 0)

        
        NSLayoutConstraint.activate([
            paymentOptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            paymentOptionLabel.heightAnchor.constraint(equalToConstant: Viewheight * 0.05),
            paymentOptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: viewWidth * 0.05),
            paymentOptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -viewWidth * 0.05),

        ])

        typeOfPayementsTableView.separatorStyle = .none
        typeOfPayementsTableView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            typeOfPayementsTableView.topAnchor.constraint(equalTo: paymentOptionLabel.bottomAnchor,constant: 20),
            typeOfPayementsTableView.heightAnchor.constraint(equalToConstant:Viewheight * 0.5),
           typeOfPayementsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: viewWidth * 0.05),
            typeOfPayementsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -viewWidth * 0.05)
        ])
    }
}

extension PayementController : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PaymentsCell.identifier, for: indexPath) as! PaymentsCell
        cell.paymentNameLabel.text = "Google Pay"
        cell.backgroundColor = .clear
        cell.containerView.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height : CGFloat = typeOfPayementsTableView.frame.height / 8
       
        return height
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
       
    }
    

}


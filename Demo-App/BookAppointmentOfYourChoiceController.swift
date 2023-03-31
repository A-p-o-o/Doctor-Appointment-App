//
//  BookAppointmentOfYourChoiceController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 28/03/23.
//

import UIKit

class BookAppointmentOfYourChoiceController: UIViewController, UISearchControllerDelegate{
    
    
    var patient : Patient? = nil
    let search = Search()
    
    
    
    var isdateSelected : Bool = false
    var isTimeSelected : Bool = false
    var isDepartmentSelected : Bool = false
    
    var selectedDate : Date? = nil
    var selectedTime : String? = nil
    var selectedDepartment : Department? = nil
    
    let dateData : [Date]  = {
        var dates : [Date] = []
        let date = Date()
        for value in 0..<7{
            dates.append(Calendar.current.date(byAdding: .day, value: value, to: date)!)
        }
        return dates
    }()
    
    let timeData : [String] =  ["09:00-AM","09:30-AM","10:00-AM","10:30-AM","11:00-AM","11:30-AM","02:00-PM","02:30-PM","03:00-PM","03:30-PM"]
    
    
    let departmentData : [Department] = Department.allCases
    
    lazy var searchResultsController = UINavigationController(rootViewController: SearchResultsController(collectionViewLayout: UICollectionViewFlowLayout()) )
    
    
    lazy var  searchController = UISearchController(searchResultsController: searchResultsController)
                                                    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    let DateView = TitleAndCollectionView()
    let TimeView = TitleAndCollectionView()
    let DepartmentView = TitleAndCollectionView()
    
    let confirmButton : UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = UIColor(named: "book")
        button.configuration?.baseForegroundColor = .white
        button.setTitle("Confirm", for: .normal)
        
        let buttonFont: UIFont = .systemFont(ofSize: 25, weight: .semibold)
        let fontMetrics = UIFontMetrics(forTextStyle: .headline)
        button.titleLabel?.font = fontMetrics.scaledFont(for: buttonFont)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.lineBreakMode = .byWordWrapping
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    lazy var Viewheight = view.frame.height < view.frame.width ? view.frame.width : view.frame.height
    lazy var viewWidth = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        setSearchController()
        setupScrollView()
        setUpStackView()
        setUpDateView()
        setUpTimeView()
        setUpDepartmentView()
        
        TimeView.isHidden = true
        DepartmentView.isHidden = true
        confirmButton.isHidden = true
        
        searchResultsController.modalPresentationStyle = .formSheet
    }
    
    
    func setSearchController(){
        title = "Book Appointment"
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.showsSearchResultsController = true
       
//        tabBarController?.navigationItem.searchController = searchController
//        tabBarController?.navigationItem.hidesSearchBarWhenScrolling = false
        self.definesPresentationContext = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = true
        tabBarController?.navigationItem.searchController = searchController
    }
    
    func setupScrollView(){
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10),
        ])
        
    }
    
    
    func setUpStackView(){
        scrollView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    func setUpDateView(){
        stackView.addArrangedSubview(DateView)
        
       // DateView.titleLabel.backgroundColor = .white
        DateView.collectionView.tag = 0
        DateView.collectionView.backgroundColor = .clear
        DateView.collectionView.register(AvailableDates.self, forCellWithReuseIdentifier: AvailableDates.identifier)
    
        DateView.configure(withTitle: "Select a Date", collectionViewDataSource: self, collectionViewDelegate: self)
        
        DateView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            DateView.heightAnchor.constraint(greaterThanOrEqualToConstant: Viewheight * 0.15)
        ])
        
    }
    
    func setUpTimeView(){
        stackView.addArrangedSubview(TimeView)
        
       // TimeView.titleLabel.backgroundColor = .white
        TimeView.collectionView.tag = 1
        TimeView.collectionView.backgroundColor = .clear
        TimeView.collectionView.register(Slots.self, forCellWithReuseIdentifier: Slots.identifier)
    
        TimeView.configure(withTitle: "Select a Time", collectionViewDataSource: self, collectionViewDelegate: self)
        
        TimeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            TimeView.heightAnchor.constraint(greaterThanOrEqualToConstant: Viewheight * 0.1)
        ])
        
    }
    
    func setUpDepartmentView(){
        stackView.addArrangedSubview(DepartmentView)
        
        //DepartmentView.titleLabel.backgroundColor = .white
        DepartmentView.collectionView.tag = 2
        DepartmentView.collectionView.backgroundColor = .clear
        
        DepartmentView.collectionView.register(Slots.self, forCellWithReuseIdentifier: Slots.identifier)
    
        DepartmentView.configure(withTitle: "Select a Department", collectionViewDataSource: self, collectionViewDelegate: self)
        DepartmentView.collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 10)
        DepartmentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            DepartmentView.heightAnchor.constraint(greaterThanOrEqualToConstant: Viewheight * 0.4)
        ])
        
        DepartmentView.collectionView.sizeToFit()
        DepartmentView.sizeToFit()
        
        let spaceview = UIView()
        
        stackView.addArrangedSubview(spaceview)
        
        spaceview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spaceview.heightAnchor.constraint(equalToConstant: Viewheight * 0.04)
        ])
        
        stackView.addArrangedSubview(confirmButton)
        
        NSLayoutConstraint.activate([
            confirmButton.heightAnchor.constraint(equalToConstant: Viewheight * 0.05)
        ])
        
        confirmButton.addTarget(self, action: #selector(confirmClicked), for: .touchUpInside)
        
    }
    
    @objc func confirmClicked(){
       
        let viewController = AvailableDoctorsController(patient: self.patient!)
        viewController.time = selectedTime
        viewController.date = selectedDate
        viewController.department = selectedDepartment
        
        navigationController?.pushViewController(viewController, animated: true)
    }
   
    }

extension BookAppointmentOfYourChoiceController :UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        guard let patient else {return}
    
        print(text)
        
        var data : [Any] = []
        data.append(contentsOf: patient.searchDoctor(text: text))
        data.append(contentsOf: search.searchDepartment(text: text))
        
       
         
       let navigationController =  searchController.searchResultsController as! UINavigationController
        guard let controller = navigationController.topViewController as? SearchResultsController else {return}
        controller.updateData(data: data)
    }
    
}


extension BookAppointmentOfYourChoiceController : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return dateData.count
        }
        else if collectionView.tag == 1 {
            return timeData.count
        }
        else {
            return departmentData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        
    
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AvailableDates.identifier, for: indexPath) as! AvailableDates
            
            cell.titleLabel.text = dateFormat(date: dateData[indexPath.row])
            cell.infoLabel.text = "Thursday"
            
            guard let selectedDate else { return cell }
            if indexPath.row == dateData.firstIndex(of: selectedDate){
                cell.layer.borderWidth = 2
                cell.layer.borderColor = UIColor(named: "book")?.cgColor
                cell.isSelected = true
            }
            
            return cell
        }
        else if collectionView.tag == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Slots.identifier, for: indexPath) as! Slots
            
            cell.titleLabel.text = departmentData[indexPath.row].departmentName
            
            guard let selectedDepartment else { return cell }
            if indexPath.row == departmentData.firstIndex(of: selectedDepartment){
                cell.layer.borderWidth = 2
                cell.layer.borderColor = UIColor(named: "book")?.cgColor
                cell.isSelected = true

            }
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Slots.identifier, for: indexPath) as! Slots
            
            cell.titleLabel.text = timeData[indexPath.row]
            
            guard let selectedTime else { return cell }
            if indexPath.row == timeData.firstIndex(of: selectedTime){
                cell.layer.borderWidth = 2
                cell.layer.borderColor = UIColor(named: "book")?.cgColor
                cell.isSelected = true

            }
            
            return cell
            
        }
                

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 0 {
            return CGSize(width: viewWidth / 3.5, height: Viewheight / 17)
        }
        else if collectionView.tag == 2 {
            return CGSize(width: viewWidth / 2.7, height: Viewheight / 17)
        }
        
        return CGSize(width: viewWidth / 3.5, height: Viewheight / 28)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if collectionView.tag == 0 {
            
            let cell =  collectionView.cellForItem(at: indexPath)! as! AvailableDates
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor(named: "book")?.cgColor
            
            TimeView.isHidden = false
            selectedDate = dateData[indexPath.row]
            
            
        }
        
        if collectionView.tag == 1 {
            let cell =  collectionView.cellForItem(at: indexPath)! as! Slots
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor(named: "book")?.cgColor
            
            DepartmentView.isHidden = false
            selectedTime = timeData[indexPath.row]
        }
        
        
        if collectionView.tag == 2 {
            let cell =  collectionView.cellForItem(at: indexPath)! as! Slots
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor(named: "book")?.cgColor
            
            selectedDepartment = departmentData[indexPath.row]
            confirmButton.isHidden = false
        }
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        
            let cell = collectionView.cellForItem(at: indexPath)
                cell?.layer.borderWidth = 0.0
                cell?.layer.borderColor = nil
        
    }
    
    
    
    
}

  
    


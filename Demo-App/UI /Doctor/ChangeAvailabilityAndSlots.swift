//
//  ChangeAvailabilityAndSlots.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 22/03/23.
//

import UIKit

class ChangeAvailabilityAndSlots: UIViewController {

    let doctor : Doctor
    var slots : [Slot] {
        doctor.getAvailableSlots(date: date)
    }
    var availability : Bool
    let date : Date
    
    init(doctor: Doctor, availability: Bool, date: Date) {
        self.doctor = doctor
        self.availability = availability
        self.date = date
        
        print(date)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let dateLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 1
        label.text = "26, Monday, September"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let changeAvailabilityLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 1
        label.text = "Change Availability"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let availabilitySegmentControl : UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Available","Not - Available"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.selectedSegmentTintColor = .systemBlue
        return segment
    }()
    
    let slotTimingsLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 1
        label.text = "Slot Timings"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let createCoustomSlotButton : UIButton = {
        let button = UIButton()
        button.configuration = .plain()
        button.configuration?.baseForegroundColor = .black
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
       
        return button
    }()
    
    let slotCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Change Availability & Slots"
        setConstrains()
        SetSegmentConfiguration()
        setSlotTimingsCollectionView()
        setNavigation()
        coustomConfigure()
        slotCollectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        slotCollectionView.reloadData()
    }
    
    
    
    var widthspace : CGFloat { view.frame.width * 0.02 }
    var heightspace : CGFloat { view.frame.height * 0.02 }
    
    func setNavigation(){
        self.navigationItem.setHidesBackButton(true, animated: false)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        self.navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func doneButtonTapped() {
        
        navigationController?.popViewController(animated: true)
    }
    
    func setConstrains(){
        view.addSubview(dateLabel)
        view.addSubview(changeAvailabilityLabel)
        view.addSubview(availabilitySegmentControl)
        view.addSubview(slotTimingsLabel)
        view.addSubview(createCoustomSlotButton)
        

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd, EEEE, MMMM"
        dateLabel.text = dateFormatter.string(from: date)
        
        let dateLabelHeight = view.frame.height * 0.06
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: dateLabelHeight),
            dateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: widthspace),
            dateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -widthspace)
        ])
        
        let changeAvailabilityLabelHeight = view.frame.height * 0.04
        
        NSLayoutConstraint.activate([
            changeAvailabilityLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor,constant: heightspace),
            changeAvailabilityLabel.heightAnchor.constraint(equalToConstant: changeAvailabilityLabelHeight),
            changeAvailabilityLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: widthspace),
            changeAvailabilityLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -widthspace)
        ])
        
        let availabilitySegmentHeight = view.frame.height * 0.04
        
        NSLayoutConstraint.activate([
            availabilitySegmentControl.topAnchor.constraint(equalTo: changeAvailabilityLabel.bottomAnchor,constant: heightspace),
            availabilitySegmentControl.heightAnchor.constraint(equalToConstant: availabilitySegmentHeight),
            availabilitySegmentControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: widthspace),
            availabilitySegmentControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -widthspace)
        ])
        
        let slotTimingsHeight = view.frame.height * 0.04
        let slotTimingsWidth = (view.frame.width - (2 * widthspace) ) * 0.50
        
        NSLayoutConstraint.activate([
            slotTimingsLabel.topAnchor.constraint(equalTo: availabilitySegmentControl.bottomAnchor,constant: heightspace),
            slotTimingsLabel.heightAnchor.constraint(equalToConstant: slotTimingsHeight),
            slotTimingsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: widthspace),
            slotTimingsLabel.widthAnchor.constraint(equalToConstant: slotTimingsWidth)
        ])
        
        let coustomSlotHeight = view.frame.height * 0.04
        let coustomSlotWidth = (view.frame.width - (2 * widthspace) ) * 0.50
        
        NSLayoutConstraint.activate([
            createCoustomSlotButton.topAnchor.constraint(equalTo: availabilitySegmentControl.bottomAnchor,constant: heightspace),
            createCoustomSlotButton.heightAnchor.constraint(equalToConstant: coustomSlotHeight),
            createCoustomSlotButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -widthspace),
          //  createCoustomSlotButton.widthAnchor.constraint(equalToConstant: coustomSlotWidth)
        ])
        
        
    }
    
    func SetSegmentConfiguration(){
        
        availabilitySegmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        if availability {
            availabilitySegmentControl.selectedSegmentIndex = 0
            availabilitySegmentControl.selectedSegmentTintColor = .systemGreen.withAlphaComponent(0.7)
            slotTimingsLabel.isHidden = false
            createCoustomSlotButton.isHidden = false
            slotCollectionView.isHidden = false
        }
        else {
            availabilitySegmentControl.selectedSegmentIndex = 1
            availabilitySegmentControl.selectedSegmentTintColor = .systemRed.withAlphaComponent(0.7)
            slotTimingsLabel.isHidden = true
            createCoustomSlotButton.isHidden = true
            slotCollectionView.isHidden = true
        }
        
        
    }
    
    func coustomConfigure(){
        createCoustomSlotButton.addTarget(self, action: #selector(coustomButtonSelected), for: .touchUpInside)
    }
    
   @objc  func coustomButtonSelected(){
       
       let viewController = EditCurrentSlot(doctor: doctor, slots: slots,date: date)
      // navigationController?.pushViewController(viewController, animated: true)
       viewController.modalPresentationStyle = .fullScreen
       present(viewController, animated: false)
            }
    
       
    
    @objc func segmentChanged(_ sender : UISegmentedControl){
        
        switch sender.selectedSegmentIndex {
            
        case 0 :
               availableSelected()
            availabilitySegmentControl.selectedSegmentTintColor = .systemGreen.withAlphaComponent(0.7)
        case 1 :
               notAvailableSelected()
            availabilitySegmentControl.selectedSegmentTintColor = .systemRed.withAlphaComponent(0.7)
        default:
            return
        }
        
    }
    
    func availableSelected(){
        let alertController = UIAlertController(title: "Hello Dr.\(doctor.name)", message: "Are you sure you want to open your appointments?", preferredStyle: .alert)
        
       
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { [self] (action:UIAlertAction!) in
            self.availabilitySegmentControl.selectedSegmentIndex = 1
            availabilitySegmentControl.selectedSegmentTintColor = .systemRed.withAlphaComponent(0.7)
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) { [self] (action:UIAlertAction!) in
            self.availabilitySegmentControl.selectedSegmentIndex = 0
            self.doctor.changeAvailability(date: date)
            availabilitySegmentControl.selectedSegmentTintColor = .systemGreen.withAlphaComponent(0.7)
            slotTimingsLabel.isHidden = false
            createCoustomSlotButton.isHidden = false
            slotCollectionView.isHidden = false
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)

       
        self.present(alertController, animated: true, completion:nil)
        
    }
    
    func notAvailableSelected(){
        
        let alertController = UIAlertController(title: "Hello Dr.\(doctor.name)", message: "Are you sure you want to close your Appointments?", preferredStyle: .alert)
        
       
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action:UIAlertAction!) in
            self.availabilitySegmentControl.selectedSegmentIndex = 0
            self.availabilitySegmentControl.selectedSegmentTintColor = .systemGreen.withAlphaComponent(0.7)
        }
        let okAction = UIAlertAction(title: "OK", style: .destructive) { [self] (action:UIAlertAction!) in
            self.availabilitySegmentControl.selectedSegmentIndex = 1
            doctor.changeAvailability(date: date)
            availabilitySegmentControl.selectedSegmentTintColor = .systemRed.withAlphaComponent(0.7)
            slotTimingsLabel.isHidden = true
            createCoustomSlotButton.isHidden = true
            slotCollectionView.isHidden = true
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)

       
        self.present(alertController, animated: true, completion:nil)
    }
    
    func setSlotTimingsCollectionView(){
        view.addSubview(slotCollectionView)
        slotCollectionView.translatesAutoresizingMaskIntoConstraints =  false
        
        
        slotCollectionView.register(SlotTimingsCell.self, forCellWithReuseIdentifier: SlotTimingsCell.identifier)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 20
        
        slotCollectionView.collectionViewLayout = flowLayout
        
        slotCollectionView.dataSource = self
        slotCollectionView.delegate = self
        
        NSLayoutConstraint.activate([
            slotCollectionView.topAnchor.constraint(equalTo: slotTimingsLabel.bottomAnchor,constant: heightspace),
            slotCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            slotCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -widthspace),
            slotCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: widthspace)
        ])
    }
}

extension ChangeAvailabilityAndSlots : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlotTimingsCell.identifier, for: indexPath) as! SlotTimingsCell
        
        switch slots[indexPath.row]{
            
        case .slot(let slotNo,let Time,_) :
            cell.slotNoLabel.text = "Slot No \(slotNo)"
            
            switch Time {
                
            case .time(let startTime,let endTime) :
                cell.startTimeLabel.text = "Start Time : \(startTime)"
                cell.endTimeLabel.text = "End Time : \(endTime)"
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (slotCollectionView.frame.height  - (5 * 24)) / 4
        let width = (slotCollectionView.frame.width - (3 * 10)-20)  / 2
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
    }
    
}



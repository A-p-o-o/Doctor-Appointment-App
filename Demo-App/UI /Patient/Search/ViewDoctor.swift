//
//  ViewDoctor.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 13/03/23.
//

import UIKit

class ViewDoctor: UIViewController {
    
    let doctor : Doctor
    let patient : Patient
    
    var selectDate :String? = nil
    
    var slots : (startTime:[String],endTime:[String],slotno:[Int]) = ([],[],[])
    
    var availableDatesOfDoctor : [String] {
        search.doctorAvailableDates(doctorId: doctor.employeeId)
    }
    
    var dateAndSlots : [String:(startTime:[String],endTime:[String],slotno:[Int])] {
        search.dateAndslots(dates: availableDatesOfDoctor, doctorId: doctor.employeeId)
    }
    
    
    let search = Search()
    let dao = DoctorDAO()
    //Doctor Profile

    let topView : DoctorProfile
    
    
    //Available slots
    let middleView = UIView()
    let availableDates = UICollectionView(frame: .zero, collectionViewLayout:UICollectionViewFlowLayout())
    
    //slots on particular date
    let bottomView  = UIView()
    let selectedDate : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "black")
        label.text = "dd-mm-yyyy"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.backgroundColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let availableSlots = UICollectionView(frame: .zero, collectionViewLayout:UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        setViews()
        availableSlots.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        availableSlots.reloadData()
    }
    
     init(doctor: Doctor? = nil, patient: Patient? = nil) {
         self.doctor = doctor!
         self.patient = patient!
         self.topView = DoctorProfile(doctor: doctor!)
         super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews(){
        
        view.addSubview(topView)
        view.addSubview(middleView)
        view.addSubview(bottomView)
        
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        middleView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.height * 0.15)
            
        ])
        
        topView.photo.layer.cornerRadius = (view.bounds.height) * 0.15 * 0.8 / 2
        
        
        NSLayoutConstraint.activate([
            middleView.topAnchor.constraint(equalTo: topView.bottomAnchor,constant: 10),
            middleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            middleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            middleView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.13)
        ])
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: middleView.bottomAnchor,constant: 10),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        setMiddleView()
        setbottomView()
    }
    
    
    
    func setMiddleView(){
        middleView.addSubview(availableDates)
        
        availableDates.register(AvailableDates.self, forCellWithReuseIdentifier: AvailableDates.identifier)
        
        availableDates.backgroundColor = .clear
        availableDates.tag = 1
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 20
        
        availableDates.translatesAutoresizingMaskIntoConstraints = false
        
        availableDates.dataSource = self
        availableDates.delegate = self
        availableDates.showsVerticalScrollIndicator = false
        availableDates.showsHorizontalScrollIndicator = true
        
        availableDates.collectionViewLayout = flowLayout
        
        
        availableDates.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            availableDates.topAnchor.constraint(equalTo: middleView.topAnchor),
            availableDates.bottomAnchor.constraint(equalTo: middleView.bottomAnchor),
            availableDates.leadingAnchor.constraint(equalTo: middleView.leadingAnchor),
            availableDates.trailingAnchor.constraint(equalTo: middleView.trailingAnchor)
            
        ])
    }
    
    func setbottomView(){
        bottomView.addSubview(selectedDate)
        bottomView.addSubview(availableSlots)
        
        availableSlots.tag = 2
        
        NSLayoutConstraint.activate([
            selectedDate.topAnchor.constraint(equalTo: bottomView.topAnchor),
            selectedDate.heightAnchor.constraint(equalTo: bottomView.heightAnchor,multiplier: 0.07),
            selectedDate.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            selectedDate.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor)
        ])
        
        
        availableSlots.register(Slots.self, forCellWithReuseIdentifier: Slots.identifier)

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 20
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

        availableSlots.translatesAutoresizingMaskIntoConstraints = false

        availableSlots.dataSource = self
        availableSlots.delegate = self
        availableSlots.showsVerticalScrollIndicator = false
        availableSlots.showsHorizontalScrollIndicator = true

        availableSlots.collectionViewLayout = flowLayout


        availableSlots.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            availableSlots.topAnchor.constraint(equalTo: selectedDate.bottomAnchor,constant: 10),
            availableSlots.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            availableSlots.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            availableSlots.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor)
        ])

    }
    
    
   
   
}

extension ViewDoctor : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 1 {
            return availableDatesOfDoctor.count
        }
        else {
            
            return slots.startTime.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AvailableDates.identifier, for: indexPath) as! AvailableDates
            
            let date = availableDatesOfDoctor[indexPath.row]
            cell.titleLabel.text = date
            
            let slots : Int = dateAndSlots[date]?.startTime.count ?? 0
            cell.infoLabel.text = slots == 0 ? "No slots Available" : "\(slots) slots Available"
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Slots.identifier, for: indexPath) as! Slots
            
            cell.titleLabel.text  =  "\(slots.startTime[indexPath.row]) - \(slots.endTime[indexPath.row])"
            
            return cell
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 1 {
            let height = collectionView.frame.height * 0.8
            let width = collectionView.frame.width * 0.35
            
            return CGSize(width: width, height: height)
        }
        else {
            let height = collectionView.frame.height  / 7
            let width = collectionView.frame.width / 3 - 40
            
            return CGSize(width: width, height: height)
        }
    }
    
}


extension ViewDoctor : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
       
        
        if collectionView.tag == 1 {
            
           let cell =  collectionView.cellForItem(at: indexPath)! as! AvailableDates
            selectedDate.text = cell.titleLabel.text!
            selectDate = cell.titleLabel.text!
            slots = dateAndSlots[cell.titleLabel.text!]!
            availableSlots.reloadData()
            
        }
        
        else if collectionView.tag == 2{
            collectionView.deselectItem(at: indexPath, animated: false)
            
            
            let viewController = BookAppointment(doctor: self.doctor, patient: self.patient, startTime: slots.startTime[indexPath.row],endTime: slots.endTime[indexPath.row], date: selectDate!,slotNo: slots.slotno[indexPath.row])
            viewController.cancelButton.isHidden = true
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if collectionView.tag == 1 {
            let cell = collectionView.cellForItem(at: indexPath)
                cell?.layer.borderWidth = 0.0
                cell?.layer.borderColor = nil
        }
    }
}
